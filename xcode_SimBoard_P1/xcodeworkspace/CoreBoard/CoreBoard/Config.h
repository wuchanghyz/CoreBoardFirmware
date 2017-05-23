//
//  Config.h
//  PowerDebugBoard
//
//  Created by AndersonHan on 16/5/4.
//  Copyright © 2016年 IvanGan. All rights reserved.
//

#ifndef Config_h
#define Config_h

//i2c
typedef enum I2cChannel
{
    I2C0 = 0u,
    I2C1,
    I2C2,
    I2C3,
    I2C4,
    I2C5,
    I2C6,
    I2C7
} I2cChannel_t;
typedef enum i2c_clock_divider {
    I2C_PCLK_DIV_256 = 0u,
    I2C_PCLK_DIV_224,
    I2C_PCLK_DIV_192,
    I2C_PCLK_DIV_160,
    I2C_PCLK_DIV_960,
    I2C_PCLK_DIV_120,
    I2C_PCLK_DIV_60,
    I2C_BCLK_DIV_8
} i2c_clock_divider_t;
//spi
typedef enum SpiChannel
{
    SPI0 = 0u,
    SPI1,
    SPI2,
    SPI3,
    SPI4,
    SPI5,
    SPI6,
    SPI7
} SpiChannel_t;
typedef enum SPI_mode_t
{
    /** When enabled, the CoreSPI will be in SLAVE mode: */
    SPI_MODE_SLAVE		= 0,
    
    /** When enabled, the CoreSPI will be in MASTER mode: */
    SPI_MODE_MASTER		= 1
} SPI_mode_t;
typedef enum __SPI_protocol_mode_t
{
    SPI_MODE0 = 0x00,
    SPI_MODE1 = 0x10,
    SPI_MODE2 = 0x08,
    SPI_MODE3 = 0x18
} SPI_protocol_mode_t;
typedef enum __SPI_pclk_div_t
{
    PCLK_DIV_2		= 0,
    PCLK_DIV_4		= 1,
    PCLK_DIV_8		= 2,
    PCLK_DIV_16		= 3,
    PCLK_DIV_32		= 4,
    PCLK_DIV_64		= 5,
    PCLK_DIV_128	= 6,
    PCLK_DIV_256	= 7
} SPI_pclk_div_t;

//uart
typedef enum UartChannel
{
    UART0 = 0u,
    UART1,
    UART2,
    UART3,
    UART4,
    UART5,
    UART6,
    UART7
} UartChannel_t;


//#include "SerialPort.hpp"

//serial port path
#define MATCH_PATH "/dev/cu.usbmodemVCP1231"
//cat9555
#define CAT9555_1_I2C_NUMBER (I2cChannel_t) 2
#define Cat9555_1_ADDRESS (uint8_t)0x20
#define CAT9555_2_I2C_NUMBER (I2cChannel_t) I2C2
#define Cat9555_2_ADDRESS (uint8_t)0x21

//dac_ad5667
#define DAC_LDAC_NUMBER 11
#define DAC_CLR_NUMBER  10
#define DAC_I2C_NUMBER (I2cChannel_t)I2C3
#define DAC_ADDRESS (uint8_t)0x0c

//dmm
#define DMM_BIT1 13
#define DMM_BIT2 14
#define DMM_BIT3 15
#define DMM_EEPROM_ADDRESS (uint8_t)0x50
#define DMM_I2C_NUMBER (I2cChannel_t)I2C0
#define DMM_SPI_NUMBER (SpiChannel_t)SPI0

//POWER BOARD
#define POW_BRD_BAT_EN 11
#define POW_BRD_VRECT_EN 9
#define POW_BRD_MAIN_EN 10
#define POW_BRD_EEPROM_ADDRESS (uint8_t)0x53
#define POW_BRD_I2C_NUMBER (I2cChannel_t)I2C1

#endif /* Config_h */
