/*******************************************************************************
 * (c) Copyright 2012-2015 Microsemi SoC Products Group.  All rights reserved.
 *
 * USB CDC Class VCP Device Example application to demonstrate the SmartFusion2
 * MSS USB operations in device mode.
 *
 * This file implements VCP functionality.
 * This file uses SmartFusion2 MSS USB Driver stack (inclusive of USBD-CDC class
 * driver) to connect to USB Host as USB Virtual COM-Port device.
 *
 * SVN $Revision: 7858 $
 * SVN $Date: 2015-09-23 18:12:35 +0530 (Wed, 23 Sep 2015) $
 */

#include "vcp_app.h"
#include "mss_usb_std_def.h"
#include "mss_usb_device.h"
#include "mss_usb_device_cdc.h"
//#include "drivers/mss_gpio/mss_gpio.h"
#include "mss_assert.h"

#ifdef __cplusplus
extern "C" {
#endif

/*******************************************************************************
* Private function declarations.
*/
void VCP_init_cb(void);
void VCP_release_cb(uint8_t cfgidx);
uint8_t VCP_tx_cb(uint8_t status);
uint8_t VCP_rx_cb(uint8_t status, uint32_t rx_count);
void VCP_notification_cb(uint8_t** buf_p, uint32_t* len_p);

uint8_t VCP_process_request_cb(mss_usbd_setup_pkt_t* setup_pkt,
                               uint8_t** buf,
                               uint32_t* length);

void VCP_default_rx_complete_handler(uint32_t rx_count, uint32_t rx_err_status);
uint8_t VCP_cep_tx_cb(uint8_t status);
uint8_t VCP_cep_rx_cb(uint8_t status);
/*******************************************************************************
* Global variables
*/
vcp_linecoding_params_t g_linecoding_params = {
    MSS_USB_VCP_9600_BAUD,
    MSS_USB_VCP_ONE_STOP_BIT,
    MSS_USB_VCP_NO_PARITY,
    MSS_USB_VCP_DATA_8_BITS
};

/*******************************************************************************
 * Information in this array is sent to the USB host in reply to the
 * Notification request.
 * {bmRequestType,bNotification,wValue,wIndex,wData}
 */
uint8_t g_not_buf[10] = {0xA1,0x20,0x00,0x00,0x00,0x00,0x02,0x00,0x00,0x00};

uint8_t g_vcp_serial_state = 0u;

uint8_t g_vcprx_complete_status = 1u;
uint8_t g_vcptx_complete_status = 1u;
static uint8_t host_detected = 0u;

vcp_rx_complete_handler_t g_rx_complete_handler = VCP_default_rx_complete_handler;

/*USB drivers needs to be in configured state before data transfers can happen*/
volatile vcp_config_state_t g_vcp_config_state = VCP_NOT_CONFIGURED;

/* Call-back function implemented by VCP application */
mss_usbd_cdc_app_cb_t g_vcp_app_cb = {
    VCP_init_cb,
    VCP_release_cb,
    VCP_process_request_cb,
    VCP_tx_cb,
    VCP_rx_cb,
    VCP_notification_cb,
    VCP_cep_tx_cb,
    VCP_cep_rx_cb
};

/* USB descriptors for CDC class virtual COM-Port enumeration. */
extern mss_usbd_user_descr_cb_t vcp_descriptors_cb;

/*******************************************************************************
 * Exported functions from VCP Application.
*******************************************************************************/

/***************************************************************************//**
 * See vcp_app.h for details of how to use this function.
 */
void
VCP_init
(
    uint32_t baud_rate,
    uint8_t stop_bits,
    uint8_t parity,
    uint8_t data_bits
)
{
    SYSREG->WDOG_CR = 0x0000;        /*Disable Watch-dog*/

    //MSS_GPIO_init();
    //MSS_GPIO_config(MSS_GPIO_0 , MSS_GPIO_OUTPUT_MODE);

    /*Keep USB PHY out of Reset*/
    //MSS_GPIO_set_output(MSS_GPIO_0 , 0);

    g_linecoding_params.bitrate = baud_rate;
    g_linecoding_params.format = stop_bits;
    g_linecoding_params.paritytype = parity;
    g_linecoding_params.datatype = data_bits;

    /*
    Assign call-back function handler structure needed by USB Device Core driver
    */
    MSS_USBD_set_descr_cb_handler(&vcp_descriptors_cb);

    /*Assign call-back function handler structure needed by USBD-CDC driver.*/
    MSS_USBD_CDC_init(&g_vcp_app_cb, MSS_USB_DEVICE_HS);

    /*Initialize USBD driver driver */
    MSS_USBD_init(MSS_USB_DEVICE_HS);
}

/***************************************************************************//**
 * See vcp_app.h for details of how to use this function.
 */
uint32_t
VCP_tx
(
    uint8_t* buf,
    uint32_t length
)
{
    if((g_vcp_config_state >= VCP_CONFIGURED) && (buf != (uint8_t*)0))
    {
        g_vcptx_complete_status = 0u;
        MSS_USBD_CDC_tx(buf, length);
        return 1u;
    }
    else
    {
        return 0u;
    }
}

/***************************************************************************//**
 * See vcp_app.h for details of how to use this function.
 */
uint32_t
VCP_rx_prepare
(
    uint8_t* buf,
    uint32_t length,
    vcp_rx_complete_handler_t rx_handler_func
)
{
    if((g_vcp_config_state >= VCP_CONFIGURED) &&
        (rx_handler_func != (vcp_rx_complete_handler_t)0) &&
        (buf != (uint8_t*)0))
    {
        g_vcprx_complete_status = 0u;
        g_rx_complete_handler = rx_handler_func;
        MSS_USBD_CDC_rx_prepare(buf, length);
        return 1u;
    }
    else
    {
        return 0u;
    }
}

/***************************************************************************//**
 * See vcp_app.h for details of how to use this function.
 */
void
VCP_tx_wait_complete
(
    void
)
{
    while (!g_vcptx_complete_status);
}

uint32_t
VCP_tx_done
(
    void
)
{
    return (g_vcptx_complete_status);
}

/***************************************************************************//**
 * See vcp_app.h for details of how to use this function.
 */
vcp_config_state_t
VCP_configuration_state
(
    void
)
{
    return (g_vcp_config_state);
}

/*******************************************************************************
* Private function definitions.
*******************************************************************************/

/*******************************************************************************
 * Implementation of usb_cdc_init call-back needed by USB CDC class driver.
 */
void
VCP_init_cb
(
    void
)
{
    g_vcptx_complete_status = 1u;
    g_vcprx_complete_status = 1u;
    g_vcp_config_state = VCP_CONFIGURED;
}

/*******************************************************************************
 * Implementation of usb_cdc_release call-back needed by USB CDC class driver.
 */
void
VCP_release_cb
(
    uint8_t cfgidx
)
{
    g_vcp_config_state = VCP_NOT_CONFIGURED;
}

/*******************************************************************************
 * Implementation of usb_cdc_process_request call-back needed by USBD-CDC driver
 */
uint8_t
VCP_process_request_cb
(
    mss_usbd_setup_pkt_t* setup_pkt,
    uint8_t** buf,
    uint32_t* length
)
{
    uint8_t result = USB_FAIL;
    switch(setup_pkt->request)
    {

    case USB_CDC_SEND_ENCAPSULATED_COMMAND:
        result = USB_FAIL;
    break;

    case USB_CDC_GET_ENCAPSULATED_RESPONSE:
        result = USB_FAIL;
    break;

    case USB_CDC_SET_COMM_FEATURE:
        result = USB_FAIL;
    break;

    case USB_CDC_GET_COMM_FEATURE:
        result = USB_FAIL;
    break;

    case USB_CDC_CLEAR_COMM_FEATURE:
        result = USB_FAIL;
    break;

    case USB_CDC_SET_LINE_CODING:
        *buf = (uint8_t*)&g_linecoding_params;
        *length = 7u;
        host_detected++;
        result = USB_SUCCESS;
        break;

    case USB_CDC_GET_LINE_CODING:
        *buf = (uint8_t*)&g_linecoding_params;
        *length = 7u;
        result = USB_SUCCESS;
    break;

    case USB_CDC_SET_CONTROL_LINE_STATE:
        g_vcp_serial_state = (uint8_t)setup_pkt->value;
        result = USB_SUCCESS;
    break;

    case USB_CDC_SEND_BREAK:
        result = USB_FAIL;
    break;

    default:
        result = USB_FAIL;
    break;
    }
    return result;
}

/*******************************************************************************
 * Implementation of usb_cdc_tx_complete call-back needed by USBD-CDC driver.
 */
uint8_t
VCP_tx_cb
(
    uint8_t status
)
{
    if(status < 2 ) /*Ignore underrun error*/
    {
        g_vcptx_complete_status = 1u;
    }
    else
    {
        ASSERT(0);
    }
    return 1;

}

/*******************************************************************************
 * Implementation of usb_cdc_rx call-back needed by USBD-CDC class driver.
 */
uint8_t
VCP_rx_cb
(
    uint8_t status,
    uint32_t rx_count
)
{

    g_vcprx_complete_status = 1u;

    /*Call the Handler function provided by user with VCP_rx_prepare() function*/
    g_rx_complete_handler(rx_count, status);

    return 1;
}

/*******************************************************************************
 * Implementation of usb_cdc_tx_complete call-back needed by USBD-CDC driver.
 */
uint8_t
VCP_cep_tx_cb
(
    uint8_t status
)
{
    return 1;
}

/*******************************************************************************
 * Implementation of usb_cdc_rx call-back needed by USBD-CDC class driver.
 */
uint8_t
VCP_cep_rx_cb
(
    uint8_t status
)
{
    if(host_detected == 1)
    {
        g_vcp_config_state = VCP_HOST_APP_READY;
        host_detected =0;
    }
    return 1;
}

/*******************************************************************************
 * Implementation of usb_cdc_notification call-back needed by USBD-CDC class
 * driver.
 */
void
VCP_notification_cb
(
    uint8_t** buf_p,
    uint32_t* len_p
)
{
    *buf_p = (uint8_t*)0;
    *len_p = 0;
}

void
VCP_default_rx_complete_handler
(
    uint32_t rx_count,
    uint32_t rx_err_status
)
{
    /*No User handler function assigned.*/
    ASSERT(0);
}

#ifdef __cplusplus
}
#endif
