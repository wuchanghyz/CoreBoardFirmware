/*******************************************************************************
 * (c) Copyright 2012-2013 Microsemi SoC Products Group.  All rights reserved.
 *
 * USB CDC Class VCP Device example application to demonstrate the SmartFusion2
 * MSS USB operations in USB Device mode.
 *
 *
 * Header file for vcp_app.c
 *
 * SVN $Revision: 7858 $
 * SVN $Date: 2015-09-23 18:12:35 +0530 (Wed, 23 Sep 2015) $
 */

#ifndef VCP_APP_H_
#define VCP_APP_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

/*******************************************************************************
 * CDC VCP line coding paramenters definitions
 */
#define MSS_USB_VCP_110_BAUD                            110u
#define MSS_USB_VCP_300_BAUD                            300u
#define MSS_USB_VCP_1200_BAUD                           1200u
#define MSS_USB_VCP_2400_BAUD                           2400u
#define MSS_USB_VCP_4800_BAUD                           4800u
#define MSS_USB_VCP_9600_BAUD                           9600u
#define MSS_USB_VCP_19200_BAUD                          19200u
#define MSS_USB_VCP_38400_BAUD                          38400u
#define MSS_USB_VCP_57600_BAUD                          57600u
#define MSS_USB_VCP_115200_BAUD                         115200u
#define MSS_USB_VCP_230400_BAUD                         230400u
#define MSS_USB_VCP_460800_BAUD                         460800u
#define MSS_USB_VCP_921600_BAUD                         921600u

#define MSS_USB_VCP_ONE_STOP_BIT                        ((uint8_t) 0x00)
#define MSS_USB_VCP_ONEHALF_STOP_BIT                    ((uint8_t) 0x01)
#define MSS_USB_VCP_TWO_STOP_BITS                       ((uint8_t) 0x02)

#define MSS_USB_VCP_NO_PARITY                           ((uint8_t) 0x00)
#define MSS_USB_VCP_ODD_PARITY                          ((uint8_t) 0x01)
#define MSS_USB_VCP_EVEN_PARITY                         ((uint8_t) 0x02)
#define MSS_USB_VCP_MARK_PARITY                         ((uint8_t) 0x03)
#define MSS_USB_VCP_SPACE_PARITY                        ((uint8_t) 0x04)

#define MSS_USB_VCP_DATA_5_BITS                         ((uint8_t) 0x05)
#define MSS_USB_VCP_DATA_6_BITS                         ((uint8_t) 0x06)
#define MSS_USB_VCP_DATA_7_BITS                         ((uint8_t) 0x07)
#define MSS_USB_VCP_DATA_8_BITS                         ((uint8_t) 0x08)
#define MSS_USB_VCP_DATA_16_BITS                        ((uint8_t) 0x10)

/***************************************************************************//**
  The vcp_linecoding_params_t structure is used to store the line coding
  parameters configured by the host. After initialization, before the host
  application configures these parameters, VCP uses default parameters
  provided by user using VCP_init() function. When the parameters are received
  from the host, CP enters into VCP_HOST_APP_READY state.
  */
typedef struct vcp_linecoding_params_t {
    uint32_t bitrate;
    uint8_t  format;
    uint8_t  paritytype;
    uint8_t  datatype;
} vcp_linecoding_params_t;

/***************************************************************************//**
  The vcp_config_state_t is used to know the current state of the VCP driver.
  VCP_NOT_CONFIGURED -- USB Drivers are not configured and VCP can not perform
                        data transfers.
  VCP_CONFIGURED -- USB Drivers are configured by Host and VCP can perform data
                    data transfers.
  VCP_HOST_APP_READY -- USB drivers are configured by host and terminal
                        application on host is connected to COM port.
                        Host application can now process data transmitted from
                        this device.
 */
typedef enum vcp_config_state {
    VCP_NOT_CONFIGURED,
    VCP_CONFIGURED,
    VCP_HOST_APP_READY
} vcp_config_state_t;

/*******************************************************************************
 * Data reception event handler function Prototype.
 */
typedef void (*vcp_rx_complete_handler_t)( uint32_t rx_count, uint32_t rx_err_status );

/*******************************************************************************
 * Exported functions from CDC class driver.
 ******************************************************************************/

/***************************************************************************//**
  The VCP_init() function is used to Initialize USB drivers and to provide
  device descriptors to the USB drivers. The Parameters are used to set the default
  line coding parameters of the VCP. Since VCP works in USB device mode, the
  parameters set by USB host will override the default parameters set in this function
*/
void
VCP_init
(
    uint32_t baud_rate,
    uint8_t stop_bits,
    uint8_t parity,
    uint8_t data_bits
);

/***************************************************************************//**
  The VCP_tx() function is used to provide the data to be transmitted to the USB
  CDC driver. USB CDC driver can transmit data only if it is in configured state.
  This function returns error status when it detects that the configuration of
  the USB drivers is not yet taken place. It is recommended that to check the return
  value of this function to make sure that the function was executed successfully.
  This function is non-blocking. The data is not necessarily transmitted when this
  function returns. If you need to know the exact status of the completion then use
  VCP_tx_wait_complete() function.
*/
uint32_t
VCP_tx
(
    uint8_t* buf,
    uint32_t length
);

/***************************************************************************//**
  The VCP_rx_prepare() function is used to provide buffer to the USB CDC driver
  where it can put the received data.This function must be executed before data
  can be received on Virtual COM port. On receiving the data, this function calls
  the rx_handler_func function where the received data can be processed. The
  Parameters of this call-back function (rx_handler_func()) provide the count of
  received data bytes and error status.
*/
uint32_t
VCP_rx_prepare
(
    uint8_t* buf,
    uint32_t length,
    vcp_rx_complete_handler_t rx_handler_func
);

/***************************************************************************//**
  The VCP_tx_wait_complete() function provides the status of completion of transmit
  operation previously initiated using VCP_tx().
*/
void
VCP_tx_wait_complete
(
    void
);

/***************************************************************************//**
  The VCP_configuration_state() function provides the current state of the VCP
  application.
  VCP is serial port emulation on USB bus. The USB CDC device need to be configured by
  host (e.g. Windows PC) before it can start data exchange. This configuration
  happens at the end the enumeration process. This function returns the configuration
  status of the CDC driver.
  It is recommended that this function is used to make sure that the USB CDC class
  device is configured before any data transfer is initiated on VCP.
*/
vcp_config_state_t
VCP_configuration_state
(
    void
);

/***************************************************************************//**
*/
uint32_t
VCP_tx_done
(
    void
);

#ifdef __cplusplus
}
#endif

#endif /* VCP_APP_H_*/
