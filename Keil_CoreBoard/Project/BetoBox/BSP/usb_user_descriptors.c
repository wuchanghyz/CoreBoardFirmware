/*******************************************************************************
 * (c) Copyright 2012-2015 Microsemi SoC Products Group.  All rights reserved.
 *
 * USB CDC Class VCP Device Example application to demonstrate the SmartFusion2
 * MSS USB operations in USB Device mode.
 * This file provides the Device Descriptor used by VCP Device.
 * This file implements Application call-back Interface structure type provided
 * by USBD driver.
 *
 * SVN $Revision: 7858 $
 * SVN $Date: 2015-09-23 18:12:35 +0530 (Wed, 23 Sep 2015) $
 */

#include "mss_usb_device.h"
#include "mss_usb_std_def.h"

#ifdef __cplusplus
extern "C" {
#endif

/*******************************************************************************
 * Constant definitions
 */
#define  USB_MAX_STRING_DESCRIPTOR_SIZE                        64u

/* String Descriptor Indexes */
#define  USB_STRING_DESCRIPTOR_IDX_LANGID                   0x00
#define  USB_STRING_DESCRIPTOR_IDX_MANUFACTURER             0x01
#define  USB_STRING_DESCRIPTOR_IDX_PRODUCT                  0x02
#define  USB_STRING_DESCRIPTOR_IDX_SERIAL                   0x03
#define  USB_STRING_DESCRIPTOR_IDX_CONFIG                   0x04
#define  USB_STRING_DESCRIPTOR_IDX_INTERFACE                0x05

/* String Descriptor Indexes */
#define  USB_STRING_MANUFACTURER                            "Intelligent Group"
#define  USB_STRING_PRODUCT                                 "IA Core Board"
#define  USB_STRING_SERIAL                                  "Ver10"
#define  USB_STRING_CONFIG                                  "CFG-HS"
#define  USB_STRING_INTERFACE                               "Interface-CDC"

/*******************************************************************************
 * Local functions.
 */
uint8_t* vcp_device_descriptor(uint32_t* length);
uint8_t* vcp_device_qual_descriptor(mss_usb_device_speed_t speed, uint32_t* length);
uint8_t* vcp_string_descriptor( uint8_t index, uint32_t* length);
uint8_t vcp_get_string(uint8_t* string, uint8_t* dest);

/***************************************************************************//**
  Device descriptor.
 */
uint8_t device_descriptor[USB_STD_DEVICE_DESCR_LEN] =
{
    USB_STD_DEVICE_DESCR_LEN,                            /* bLength */
    USB_DEVICE_DESCRIPTOR_TYPE,                         /* bDescriptorType */
    0x00u,                                              /* bcdUSB LSB */
    0x02u,                                              /* bcdUSB MSB */
    0xEFu,                                              /* bDeviceClass */
    0x02u,                                              /* bDeviceSubClass */
    0x01u,                                              /* bDeviceProtocol */
    0x40u,                                              /* bMaxPacketSize0 */
    0x15u,                                              /* idVendor LSB */
    0x16u,                                              /* idVendor MSB */
    0x03u,                                              /* idProduct LSB */
    0x01u,                                              /* idProduct MSB */
    0x00u,                                              /* bcdDevice LSB */
    0x30u,                                              /* bcdDevice MSB */
    USB_STRING_DESCRIPTOR_IDX_MANUFACTURER,             /* iManufacturer */
    USB_STRING_DESCRIPTOR_IDX_PRODUCT,                  /* iProduct */
    USB_STRING_DESCRIPTOR_IDX_SERIAL,                   /* iSerialNumber */
    0x01u                                               /* bNumConfigurations */
};

/***************************************************************************//**
  Device qualifiers.
 */
uint8_t hs_dev_qualifier_descriptor[USB_STD_DEV_QUAL_DESCR_LENGTH] =
{
    USB_STD_DEV_QUAL_DESCR_LENGTH,                         /* bLength */
    USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE,                /* bDescriptorType */
    0x00u,                                              /* bcdUSB LSB */
    0x02u,                                              /* bcdUSB MSB */
    0x00u,                                              /* bDeviceClass */
    0x00u,                                              /* bDeviceSubClass */
    0x00u,                                              /* bDeviceProtocol */
    0x40u,                                              /* bMaxPacketSize0 */
    0x01u,                                              /* bNumConfigurations */
    0x00u                                               /* Reserved */
};

uint8_t fs_dev_qualifier_descriptor[USB_STD_DEV_QUAL_DESCR_LENGTH] =
{
    USB_STD_DEV_QUAL_DESCR_LENGTH,                         /* bLength */
    USB_DEVICE_QUALIFIER_DESCRIPTOR_TYPE,                /* bDescriptorType */
    0x00u,                                              /* bcdUSB LSB */
    0x02u,                                              /* bcdUSB MSB */
    0x00u,                                              /* bDeviceClass */
    0x00u,                                              /* bDeviceSubClass */
    0x00u,                                              /* bDeviceProtocol */
    0x40u,                                              /* bMaxPacketSize0 */
    0x01u,                                              /* bNumConfigurations */
    0x00u                                               /* Reserved */
};

uint8_t lang_string_descriptor[] =
{
    0x04u,                                              /* bLength */
    USB_STRING_DESCRIPTOR_TYPE,                          /* bDescriptorType */
    0x09u,                                              /* LangID-LSB */
    0x04u                                                /* LangID-MSB */
};

mss_usbd_user_descr_cb_t vcp_descriptors_cb = {
 vcp_device_descriptor,
 vcp_device_qual_descriptor,
 vcp_string_descriptor,
};

uint8_t g_string_descriptor[USB_MAX_STRING_DESCRIPTOR_SIZE];

uint8_t*
vcp_device_descriptor
(
    uint32_t* length
)
{
   *length = sizeof(device_descriptor);
   return(device_descriptor);
}

uint8_t*
vcp_device_qual_descriptor
(
    mss_usb_device_speed_t speed,
    uint32_t* length
)
{
    if(speed == MSS_USB_DEVICE_HS)
    {
        *length = sizeof(fs_dev_qualifier_descriptor);
         return(fs_dev_qualifier_descriptor);
    }
    else
    {
        *length = sizeof(hs_dev_qualifier_descriptor);
         return(hs_dev_qualifier_descriptor);
    }
}

uint8_t*
vcp_string_descriptor
(
    uint8_t index,
    uint32_t* length
)
{
    switch(index)
    {
        case USB_STRING_DESCRIPTOR_IDX_LANGID:
            *length = sizeof(lang_string_descriptor);
        break;

        case USB_STRING_DESCRIPTOR_IDX_MANUFACTURER:
            *length = vcp_get_string((uint8_t*)USB_STRING_MANUFACTURER,
                                     g_string_descriptor);
        break;

        case USB_STRING_DESCRIPTOR_IDX_PRODUCT:
            *length = vcp_get_string((uint8_t*)USB_STRING_PRODUCT,
                                     g_string_descriptor);
        break;

        case USB_STRING_DESCRIPTOR_IDX_SERIAL:
            *length = vcp_get_string((uint8_t*)USB_STRING_SERIAL,
                                     g_string_descriptor);
        break;

        case USB_STRING_DESCRIPTOR_IDX_CONFIG:
            *length = vcp_get_string((uint8_t*)USB_STRING_CONFIG,
                                     g_string_descriptor);
        break;

        case USB_STRING_DESCRIPTOR_IDX_INTERFACE:
            *length = vcp_get_string((uint8_t*)USB_STRING_INTERFACE,
                                     g_string_descriptor);
        break;

        default:
           /*Raise error*/
          *length = 0u;
        break;
    }

    if(USB_STRING_DESCRIPTOR_IDX_LANGID == index)
    {
        return(lang_string_descriptor);
    }
    {
        return(g_string_descriptor);
    }
}

uint8_t
vcp_get_string
(
    uint8_t* string,
    uint8_t* dest
)
{
    const uint8_t *idx = string ;
    uint8_t *cp_dest;

    cp_dest = dest;

    if((dest != 0) && (string != 0))
    {
        for (; *(idx); ++idx)
        {
            *(dest + 2) = *(idx);
            dest++;
            *(dest + 2) = 0x00;
            dest++;
        }
        *cp_dest = ((idx - string) * 2) + 2;                /*bLength*/
        *(cp_dest + 1) = USB_STRING_DESCRIPTOR_TYPE;        /*bDesriptorType*/
    }

    return(((idx - string) * 2) + 2);
}

#ifdef __cplusplus
}
#endif
