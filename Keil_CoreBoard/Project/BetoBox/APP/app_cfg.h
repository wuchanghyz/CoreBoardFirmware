/*
*********************************************************************************************************
*                                              EXAMPLE CODE
*
*                          (c) Copyright 2003-2012; Micrium, Inc.; Weston, FL
*
*               All rights reserved.  Protected by international copyright laws.
*               Knowledge of the source code may NOT be used to develop a similar product.
*               Please help us continue to provide the Embedded community with the finest
*               software available.  Your honesty is greatly appreciated.
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*
*                                      APPLICATION CONFIGURATION
*
*                                     ST Microelectronics STM32
*                                              on the
*
*                                           STM3220G-EVAL
*                                         Evaluation Board
*
* Filename      : app_cfg.h
* Version       : V1.00
* Programmer(s) : DC
*********************************************************************************************************
*/

#ifndef  __APP_CFG_H__
#define  __APP_CFG_H__

#include  <stdio.h>

/*
*********************************************************************************************************
*                                       MODULE ENABLE / DISABLE
*********************************************************************************************************
*/
//flag group
/*
#define I2C0_FLAG 	(OS_FLAGS)0x00000001;
#define I2C1_FLAG 	(OS_FLAGS)0x00000002;
#define I2C2_FLAG 	(OS_FLAGS)0x00000004;
#define I2C3_FLAG 	(OS_FLAGS)0x00000008;
#define I2C4_FLAG 	(OS_FLAGS)0x00000010;
#define I2C5_FLAG 	(OS_FLAGS)0x00000020;
#define I2C6_FLAG 	(OS_FLAGS)0x00000040;
#define I2C7_FLAG 	(OS_FLAGS)0x00000080;
#define I2C8_FLAG 	(OS_FLAGS)0x00000100;
#define I2C9_FLAG 	(OS_FLAGS)0x00000200;
#define SPI0_FLAG 	(OS_FLAGS)0x00000400;
#define SPI1_FLAG 	(OS_FLAGS)0x00000800;
#define SPI2_FLAG 	(OS_FLAGS)0x00001000;
#define SPI3_FLAG 	(OS_FLAGS)0x00002000;
#define SPI4_FLAG 	(OS_FLAGS)0x00004000;
#define SPI5_FLAG 	(OS_FLAGS)0x00008000;
#define SPI6_FLAG 	(OS_FLAGS)0x00010000;
#define SPI7_FLAG 	(OS_FLAGS)0x00020000;
#define UART0_FLAG 	(OS_FLAGS)0x00040000;
#define UART1_FLAG 	(OS_FLAGS)0x00080000;
#define UART2_FLAG 	(OS_FLAGS)0x00100000;
#define UART3_FLAG 	(OS_FLAGS)0x00200000;
#define UART4_FLAG 	(OS_FLAGS)0x00400000;
#define UART5_FLAG 	(OS_FLAGS)0x00800000;
#define UART6_FLAG 	(OS_FLAGS)0x01000000;
#define UART7_FLAG 	(OS_FLAGS)0x02000000;
*/
//buffer
#define MAX_FLOW 1

#define USB_BUFFER_SIZE    	0X2000
#define I2C_BUFFER_SIZE   	0X100
#define SPI_BUFFER_SIZE   	0X100
#define UART_BUFFER_SIZE   	0X100
/*
*********************************************************************************************************
*                                            TASK PRIORITIES
*********************************************************************************************************
*/

#define  APP_TASK_START_PRIO                             2u

#define APP_I2C0_PRIO	3u
#define APP_I2C1_PRIO	4u
#define APP_I2C2_PRIO	5u
#define APP_I2C3_PRIO	6u
#define APP_I2C4_PRIO	7u
#define APP_I2C5_PRIO	8u
#define APP_I2C6_PRIO	9u
#define APP_I2C7_PRIO	10u
#define APP_I2C8_PRIO	11u
#define APP_I2C9_PRIO	12u

#define APP_UART0_PRIO	13u
#define APP_UART1_PRIO	14u
#define APP_UART2_PRIO	15u
#define APP_UART3_PRIO	16u
#define APP_UART4_PRIO	17u
#define APP_UART5_PRIO	18u
#define APP_UART6_PRIO	10u
#define APP_UART7_PRIO	20u

#define APP_SPI0_PRIO	21u
#define APP_SPI1_PRIO	22u
#define APP_SPI2_PRIO	23u
#define APP_SPI3_PRIO	24u
#define APP_SPI4_PRIO	25u
#define APP_SPI5_PRIO	26u
#define APP_SPI6_PRIO	27u
#define APP_SPI7_PRIO	28u

#define APP_USB_PRIO	29u
/*
*********************************************************************************************************
*                                            TASK STACK SIZES
*                             Size of the task stacks (# of OS_STK entries)
*********************************************************************************************************
*/
#define MAX_I2C_CHANNEL 10
#define MAX_UART_CHANNEL 10
#define MAX_SPI_CHANNEL 8


#define I2C_BASE_ADDRESS	0x30000000
#define I2C_MASTER_BASE_ADDRESS 0x20

#define SPI_BASE_ADDRESS	0x3000A000
#define GPIO_BASE_ADDRESS	0x31002000
#define UART_BASE_ADDRESS	0x31003000
#define PWM_BASE_ADDRESS	0x3100D000
#define INT_BASE_ADDRESS	0x3100E000

#define  APP_TASK_START_STK_SIZE                       128u

#define APP_USB_STK_SIZE	128u
//#define APP_USB_TX_STK_SIZE	32u

#define APP_I2C0_STK_SIZE	128u

#define APP_I2C1_STK_SIZE	128u
#define APP_I2C2_STK_SIZE	128u
#define APP_I2C3_STK_SIZE	128u
#define APP_I2C4_STK_SIZE	128u
#define APP_I2C5_STK_SIZE	128u
#define APP_I2C6_STK_SIZE	128u
#define APP_I2C7_STK_SIZE	128u
#define APP_I2C8_STK_SIZE	128u
#define APP_I2C9_STK_SIZE	128u
/*
#define APP_UART0_STK_SIZE	32u
#define APP_UART1_STK_SIZE	32u
#define APP_UART2_STK_SIZE	32u
#define APP_UART3_STK_SIZE	32u
#define APP_UART4_STK_SIZE	32u
#define APP_UART5_STK_SIZE	32u
#define APP_UART6_STK_SIZE	32u
#define APP_UART7_STK_SIZE	32u

#define APP_SPI0_STK_SIZE	32u
#define APP_SPI1_STK_SIZE	32u
#define APP_SPI2_STK_SIZE	32u
#define APP_SPI3_STK_SIZE	32u
#define APP_SPI4_STK_SIZE	32u
#define APP_SPI5_STK_SIZE	32u
#define APP_SPI6_STK_SIZE	32u
#define APP_SPI7_STK_SIZE	32u

*/


/*
*********************************************************************************************************
*                                     TRACE / DEBUG CONFIGURATION
*********************************************************************************************************
*/
#if 0
#define  TRACE_LEVEL_OFF                                0
#define  TRACE_LEVEL_INFO                               1
#define  TRACE_LEVEL_DBG                                2
#endif

#define  APP_TRACE_LEVEL                                TRACE_LEVEL_INFO

#if (APP_CFG_SERIAL_EN == DEF_ENABLED)
#define  APP_TRACE                                      BSP_Ser_Printf
#else
#define  APP_TRACE                                      printf
#endif

#define  APP_TRACE_INFO(x)               ((APP_TRACE_LEVEL >= TRACE_LEVEL_INFO)  ? (void)(APP_TRACE x) : (void)0)
#define  APP_TRACE_DBG(x)                ((APP_TRACE_LEVEL >= TRACE_LEVEL_DBG)   ? (void)(APP_TRACE x) : (void)0)

#endif

