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
*                                            EXAMPLE CODE
*
*                                     ST Microelectronics STM32
*                                              on the
*
*                                           STM3220G-EVAL
*                                         Evaluation Board
*
* Filename      : app.c
* Version       : V1.00
* Programmer(s) : EHS
*                 DC
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                             INCLUDE FILES
*********************************************************************************************************
*/

#include  <includes.h>
/*
*********************************************************************************************************
*                                            LOCAL DEFINES
*********************************************************************************************************
*/

char g_StringTaskBusy[] = ".The Task Is Busy.,\r\n";
char g_StringParError[] = ".The Param Is Error.,\r\n";
char g_StringDeviceError[] = ".The Device Is Error.,\r\n";
char g_StringTaseDone[] = ".The Task Is Done.,\r\n";
char gDataNotComplete[] = ".The Data Conv Is Not Complete.,\r\n";
/*
*********************************************************************************************************
*                                       LOCAL GLOBAL VARIABLES
*********************************************************************************************************
*/
volatile uint16_t g_rx_count=0;
volatile uint16_t g_rx2_count=0;
//USB
char gRev1_Buffer[2048];
char gRev2_Buffer[USB_BUFFER_SIZE];
char gRx_Buffer[USB_BUFFER_SIZE];
char gTx_Buffer[USB_BUFFER_SIZE];
uint8_t atox(char * String);
//OS_FLAG_GRP UsbRevFlagGrp;
//i2c
char gI2C_Buffer[MAX_I2C_CHANNEL][I2C_BUFFER_SIZE];

char gGPIO_Buffer[32];
i2c_instance_t g_core_i2c[MAX_I2C_CHANNEL];

gpio_instance_t g_gpio;
//spi
char gSPI_Buffer[MAX_SPI_CHANNEL][SPI_BUFFER_SIZE];
SPI_instance_t g_core_spi[MAX_SPI_CHANNEL];
//uart
char gUART_Buffer[MAX_UART_CHANNEL][UART_BUFFER_SIZE];
UART_instance_t g_core_uart[MAX_UART_CHANNEL];

 /* ----------------- APPLICATION GLOBALS ------------------ */
static  OS_TCB   AppTaskStartTCB;
static  CPU_STK  AppTaskStartStk[APP_TASK_START_STK_SIZE];

//static  OS_TCB   AppTaskUSBRxTCB;
//static  CPU_STK  AppTaskUSBRxStk[APP_USB_RX_STK_SIZE];

static  OS_TCB   AppTaskGPIOTCB;
static  CPU_STK  AppTaskGPIOStk[APP_USB_STK_SIZE];

static  OS_TCB   AppTaskUSBTCB;
static  CPU_STK  AppTaskUSBStk[APP_USB_STK_SIZE];

static  OS_TCB   AppTaskI2CTCB[MAX_I2C_CHANNEL];
static  CPU_STK  AppTaskI2CStk[MAX_I2C_CHANNEL][APP_I2C0_STK_SIZE];


static  OS_TCB   AppTaskUARTTCB[MAX_UART_CHANNEL];
static  CPU_STK  AppTaskUARTStk[MAX_UART_CHANNEL][APP_UART0_STK_SIZE];

static  OS_TCB   AppTaskSPITCB[MAX_SPI_CHANNEL];
static  CPU_STK  AppTaskSPIStk[MAX_SPI_CHANNEL][APP_SPI0_STK_SIZE];

/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/
int String2Char(char *InputData);
void receive_data_handler( uint32_t rx_count, uint32_t rx_err_status );
int StringCmp(char * String);
uint8_t Char2String(uint8_t *InputData, uint8_t InLen, uint8_t *OutputData);
void UartLoop(uint8_t channel);
void SpiLoop(uint8_t channel);
void I2cLoop(uint8_t channel);
//task

static  void  AppTaskStart          (void *p_arg);

static  void  AppTaskCreate         (void);
static  void  AppObjCreate          (void);

//static  void  AppTaskUSBRx   (void  *p_arg);
static  void  AppTaskUSB   (void  *p_arg);
static  void  AppTaskGPIO   (void *p_arg);
static  void  AppTaskI2C0   (void  *p_arg);                        
static  void  AppTaskI2C1   (void  *p_arg);
static  void  AppTaskI2C2   (void  *p_arg);
static  void  AppTaskI2C3   (void  *p_arg);
static  void  AppTaskI2C4   (void  *p_arg);  
static  void  AppTaskI2C5   (void  *p_arg);
static  void  AppTaskI2C6   (void  *p_arg);
static  void  AppTaskI2C7   (void  *p_arg);
static  void  AppTaskI2C8   (void  *p_arg);
static  void  AppTaskI2C9   (void  *p_arg);

static  void  AppTaskSPI0   (void  *p_arg);                        
static  void  AppTaskSPI1   (void  *p_arg);
static  void  AppTaskSPI2   (void  *p_arg);
static  void  AppTaskSPI3   (void  *p_arg);
static  void  AppTaskSPI4   (void  *p_arg);  
static  void  AppTaskSPI5   (void  *p_arg);
static  void  AppTaskSPI6   (void  *p_arg);
static  void  AppTaskSPI7   (void  *p_arg);

static  void  AppTaskUART0   (void  *p_arg);                        
static  void  AppTaskUART1   (void  *p_arg);
static  void  AppTaskUART2   (void  *p_arg);
static  void  AppTaskUART3   (void  *p_arg);
static  void  AppTaskUART4   (void  *p_arg);  
static  void  AppTaskUART5   (void  *p_arg);
static  void  AppTaskUART6   (void  *p_arg);
static  void  AppTaskUART7   (void  *p_arg);
static  void  AppTaskUART8   (void  *p_arg);
static  void  AppTaskUART9   (void  *p_arg);
/*
*********************************************************************************************************
*                                                main()
*
* Description : This is the standard entry point for C code.  It is assumed that your code will call
*               main() once you have performed all necessary initialization.
*
* Arguments   : none
*
* Returns     : none
*********************************************************************************************************
*/

int main(void)
{
    OS_ERR  err;


    CPU_IntDis();                                            /* Disable all interrupts.                                  */

    CPU_Init();                                                 /* Initialize uC/CPU services.                              */

    OSInit(&err);                                               /* Init OS.                                                 */
	App_OS_SetAllHooks();

	
	
    OSTaskCreate((OS_TCB     *)&AppTaskStartTCB,
                 (CPU_CHAR   *)"App Task Start",
                 (OS_TASK_PTR ) AppTaskStart,
                 (void       *) 0,
                 (OS_PRIO     ) APP_TASK_START_PRIO,
                 (CPU_STK    *)&AppTaskStartStk[0],
                 (CPU_STK     )(APP_TASK_START_STK_SIZE / 10u),
                 (CPU_STK_SIZE) APP_TASK_START_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);

    OSStart(&err);

    while (DEF_ON) {                                            /* Should Never Get Here                                    */
    };
}


/*
*********************************************************************************************************
*                                          STARTUP TASK
*
* Description : This is an example of a startup task.  As mentioned in the book's text, you MUST
*               initialize the ticker only once multitasking has started.
*
* Arguments   : p_arg   is the argument passed to 'AppTaskStart()' by 'OSTaskCreate()'.
*
* Returns     : none
*
* Notes       : 1) The first line of code is used to prevent a compiler warning because 'p_arg' is not
*                  used.  The compiler should not generate any code for this statement.
*********************************************************************************************************
*/

static  void  AppTaskStart (void *p_arg)
{
    OS_ERR      os_err;


   (void)p_arg;
	SYSREG->WDOG_CR = 0x00000000;
	
    BSP_Init();                                                 /* Init BSP fncts.                                          */

    CPU_Init();                                                 /* Init CPU name & int. dis. time measuring fncts.          */

    Mem_Init();                                                 /* Initialize Memory managment                              */

    BSP_CPU_TickInit();                                         /* Start Tick Initialization                                */

	//IST INIT
	
	CIC_init(INT_BASE_ADDRESS);
	//CIC_set_irq_handler(0,SPI5_Irq);
	//CIC_set_irq_handler(1,SPI6_Irq);
	//CIC_set_irq_handler(2,SPI7_Irq);
	CIC_set_irq_handler(3,UART0_Irq);
	CIC_set_irq_handler(4,UART1_Irq);
	CIC_set_irq_handler(5,UART2_Irq);
	CIC_set_irq_handler(6,UART3_Irq);
	CIC_set_irq_handler(7,UART4_Irq);
	CIC_set_irq_handler(8,UART5_Irq);
	CIC_set_irq_handler(9,UART6_Irq);
	CIC_set_irq_handler(10,UART7_Irq);
	CIC_set_irq_handler(11, UART8_Irq);
	CIC_set_irq_handler(12, UART9_Irq);
	//CIC_set_irq_handler(13, SPI3_Irq);
	//CIC_set_irq_handler(14, SPI4_Irq);
	CIC_enable_irq(3);
	CIC_enable_irq(4);
	CIC_enable_irq(5);
	CIC_enable_irq(6);
	CIC_enable_irq(7);
	CIC_enable_irq(8);
	CIC_enable_irq(9);
	CIC_enable_irq(10);
	CIC_enable_irq(11);
	CIC_enable_irq(12);
	GPIO_init(&g_gpio,GPIO_BASE_ADDRESS,GPIO_APB_32_BITS_BUS);
	GPIO_config(&g_gpio, GPIO_0,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_1,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_2,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_3,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_4,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_5,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_6,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_7,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_8,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_9,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_10,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_11,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_12,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_13,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_14,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_15,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_16,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_17,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_18,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_19,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_20,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_21,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_22,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_23,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_24,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_25,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_26,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_27,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_28,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_29,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_30,GPIO_INPUT_MODE);
	GPIO_config(&g_gpio, GPIO_31,GPIO_OUTPUT_MODE);
	
	
#if (OS_TASK_STAT_EN > 0)
    OSStatInit();                                               /* Determine CPU capacity                                   */
#endif

#if (APP_CFG_SERIAL_EN == DEF_ENABLED)
 //   BSP_Ser_Init(115200);                                       /* Initialize Serial Interface                              */
#endif

//    APP_TRACE_INFO(("Creating Application Objects... \n\r"));
    AppObjCreate();                                             /* Create Application Kernel Objects                        */

//    APP_TRACE_INFO(("Creating Application Tasks... \n\r"));
    AppTaskCreate();                                            /* Create Application Tasks                                 */

    while (DEF_TRUE) {                                          /* Task body, always written as an infinite loop.           */
        OSTimeDlyHMSM(0, 0, 2, 0,
                      OS_OPT_TIME_HMSM_STRICT, &os_err);
    }
}


/*
*********************************************************************************************************
*                                          AppTaskCreate()
*
* Description : Create application tasks.
*
* Argument(s) : none
*
* Return(s)   : none
*
* Caller(s)   : AppTaskStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/

static  void  AppTaskCreate (void)
{
	OS_ERR  err;
//GPIO
	OSTaskCreate((OS_TCB     *)&AppTaskGPIOTCB,
                 (CPU_CHAR   *)"AppTaskGPIO",
                 (OS_TASK_PTR ) AppTaskGPIO,
                 (void       *) 0,
                 (OS_PRIO     ) APP_GPIO_PRIO,
                 (CPU_STK    *)&AppTaskGPIOStk[0],
                 (CPU_STK     )(AppTaskGPIOStk[APP_USB_STK_SIZE / 10u]),
                 (CPU_STK_SIZE) APP_GPIO_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
//usb
	OSTaskCreate((OS_TCB     *)&AppTaskUSBTCB,
                 (CPU_CHAR   *)"AppTaskUSB",
                 (OS_TASK_PTR ) AppTaskUSB,
                 (void       *) 0,
                 (OS_PRIO     ) APP_USB_PRIO,
                 (CPU_STK    *)&AppTaskUSBStk[0],
                 (CPU_STK     )(AppTaskUSBStk[APP_USB_STK_SIZE / 10u]),
                 (CPU_STK_SIZE) APP_USB_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
//i2c
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[0],
                 (CPU_CHAR   *)"AppTaskI2C0",
                 (OS_TASK_PTR ) AppTaskI2C0,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C0_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[0][0],
                 (CPU_STK     )( AppTaskI2CStk[0][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C0_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
				 
	 OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[1],
                 (CPU_CHAR   *)"AppTaskI2C1",
                 (OS_TASK_PTR ) AppTaskI2C1,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C1_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[1][0],
                 (CPU_STK     )( AppTaskI2CStk[1][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C1_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[2],
                 (CPU_CHAR   *)"AppTaskI2C2",
                 (OS_TASK_PTR ) AppTaskI2C2,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C2_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[2][0],
                 (CPU_STK     )( AppTaskI2CStk[2][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C2_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[3],
                 (CPU_CHAR   *)"AppTaskI2C3",
                 (OS_TASK_PTR ) AppTaskI2C3,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C3_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[3][0],
                 (CPU_STK     )( AppTaskI2CStk[3][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C3_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[4],
                 (CPU_CHAR   *)"AppTaskI2C4",
                 (OS_TASK_PTR ) AppTaskI2C4,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C4_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[4][0],
                 (CPU_STK     )( AppTaskI2CStk[4][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C4_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[5],
                 (CPU_CHAR   *)"AppTaskI2C5",
                 (OS_TASK_PTR ) AppTaskI2C5,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C5_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[5][0],
                 (CPU_STK     )( AppTaskI2CStk[5][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C5_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[6],
                 (CPU_CHAR   *)"AppTaskI2C6",
                 (OS_TASK_PTR ) AppTaskI2C6,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C6_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[6][0],
                 (CPU_STK     )( AppTaskI2CStk[6][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C6_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
/*	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[7],
                 (CPU_CHAR   *)"AppTaskI2C7",
                 (OS_TASK_PTR ) AppTaskI2C7,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C7_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[7][0],
                 (CPU_STK     )( AppTaskI2CStk[7][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C7_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[8],
                 (CPU_CHAR   *)"AppTaskI2C8",
                 (OS_TASK_PTR ) AppTaskI2C8,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C8_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[8][0],
                 (CPU_STK     )( AppTaskI2CStk[8][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C8_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[9],
                 (CPU_CHAR   *)"AppTaskI2C9",
                 (OS_TASK_PTR ) AppTaskI2C9,
                 (void       *) 0,
                 (OS_PRIO     ) APP_I2C9_PRIO,
                 (CPU_STK    *)&AppTaskI2CStk[9][0],
                 (CPU_STK     )( AppTaskI2CStk[9][APP_I2C0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_I2C9_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err); 
//UART				 
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[0],
                 (CPU_CHAR   *)"AppTaskUART0",
                 (OS_TASK_PTR ) AppTaskUART0,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART0_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[0][0],
                 (CPU_STK     )( AppTaskUARTStk[0][APP_UART0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART0_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[1],
                 (CPU_CHAR   *)"AppTaskUART1",
                 (OS_TASK_PTR ) AppTaskUART1,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART1_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[1][0],
                 (CPU_STK     )( AppTaskUARTStk[1][APP_UART1_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART1_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[2],
                 (CPU_CHAR   *)"AppTaskUART2",
                 (OS_TASK_PTR ) AppTaskUART2,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART2_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[2][0],
                 (CPU_STK     )( AppTaskUARTStk[2][APP_UART2_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART2_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[3],
                 (CPU_CHAR   *)"AppTaskUART3",
                 (OS_TASK_PTR ) AppTaskUART3,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART3_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[3][0],
                 (CPU_STK     )( AppTaskUARTStk[3][APP_UART3_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART3_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[4],
                 (CPU_CHAR   *)"AppTaskUART4",
                 (OS_TASK_PTR ) AppTaskUART4,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART4_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[4][0],
                 (CPU_STK     )( AppTaskUARTStk[4][APP_UART4_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART4_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[5],
                 (CPU_CHAR   *)"AppTaskUART5",
                 (OS_TASK_PTR ) AppTaskUART5,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART5_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[5][0],
                 (CPU_STK     )( AppTaskUARTStk[5][APP_UART5_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART5_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[6],
                 (CPU_CHAR   *)"AppTaskUART6",
                 (OS_TASK_PTR ) AppTaskUART6,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART6_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[6][0],
                 (CPU_STK     )( AppTaskUARTStk[6][APP_UART6_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART6_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[7],
                 (CPU_CHAR   *)"AppTaskUART7",
                 (OS_TASK_PTR ) AppTaskUART7,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART7_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[7][0],
                 (CPU_STK     )( AppTaskUARTStk[7][APP_UART7_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART7_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[8],
                 (CPU_CHAR   *)"AppTaskUART8",
                 (OS_TASK_PTR ) AppTaskUART8,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART8_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[8][0],
                 (CPU_STK     )( AppTaskUARTStk[8][APP_UART8_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART8_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskUARTTCB[9],
                 (CPU_CHAR   *)"AppTaskUART9",
                 (OS_TASK_PTR ) AppTaskUART9,
                 (void       *) 0,
                 (OS_PRIO     ) APP_UART9_PRIO,
                 (CPU_STK    *)&AppTaskUARTStk[9][0],
                 (CPU_STK     )( AppTaskUARTStk[9][APP_UART9_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_UART9_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
//spi					
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[0],
                 (CPU_CHAR   *)"AppTaskSPI0",
                 (OS_TASK_PTR ) AppTaskSPI0,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI0_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[0][0],
                 (CPU_STK     )( AppTaskSPIStk[0][APP_SPI0_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI0_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[1],
                 (CPU_CHAR   *)"AppTaskSPI1",
                 (OS_TASK_PTR ) AppTaskSPI1,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI1_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[1][0],
                 (CPU_STK     )( AppTaskSPIStk[1][APP_SPI1_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI1_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[2],
                 (CPU_CHAR   *)"AppTaskSPI2",
                 (OS_TASK_PTR ) AppTaskSPI2,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI2_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[2][0],
                 (CPU_STK     )( AppTaskSPIStk[2][APP_SPI2_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI2_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[3],
                 (CPU_CHAR   *)"AppTaskSPI3",
                 (OS_TASK_PTR ) AppTaskSPI3,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI3_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[3][0],
                 (CPU_STK     )( AppTaskSPIStk[3][APP_SPI3_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI3_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[4],
                 (CPU_CHAR   *)"AppTaskSPI4",
                 (OS_TASK_PTR ) AppTaskSPI4,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI4_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[4][0],
                 (CPU_STK     )( AppTaskSPIStk[4][APP_SPI4_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI4_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[5],
                 (CPU_CHAR   *)"AppTaskSPI5",
                 (OS_TASK_PTR ) AppTaskSPI5,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI5_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[5][0],
                 (CPU_STK     )( AppTaskSPIStk[5][APP_SPI5_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI5_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[6],
                 (CPU_CHAR   *)"AppTaskSPI6",
                 (OS_TASK_PTR ) AppTaskSPI6,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI6_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[6][0],
                 (CPU_STK     )( AppTaskSPIStk[6][APP_SPI6_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI6_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
	OSTaskCreate((OS_TCB     *)&AppTaskSPITCB[7],
                 (CPU_CHAR   *)"AppTaskSPI7",
                 (OS_TASK_PTR ) AppTaskSPI7,
                 (void       *) 0,
                 (OS_PRIO     ) APP_SPI7_PRIO,
                 (CPU_STK    *)&AppTaskSPIStk[7][0],
                 (CPU_STK     )( AppTaskSPIStk[7][APP_SPI7_STK_SIZE / 10u]),
                 (CPU_STK_SIZE)  APP_SPI7_STK_SIZE,
                 (OS_MSG_QTY  ) 0,
                 (OS_TICK     ) 0,
                 (void       *) 0,
                 (OS_OPT      )(OS_OPT_TASK_STK_CHK | OS_OPT_TASK_STK_CLR),
                 (OS_ERR     *)&err);
*/
}


/*
*********************************************************************************************************
*                                          AppObjCreate()
*
* Description : Create application kernel objects tasks.
*
* Argument(s) : none
*
* Return(s)   : none
*
* Caller(s)   : AppTaskStart()
*
* Note(s)     : none.
*********************************************************************************************************
*/
static  void  AppObjCreate (void)
{
//	OS_ERR err;
//	OSFlagCreate(&UsbRevFlagGrp,"USB Rev Flag Group",(OS_FLAGS)1, &err);
}

/*
*********************************************************************************************************
*                                         AppTase
*
* Description : Create application tasks.

*********************************************************************************************************
*/
static  void  AppTaskUSB   (void  *p_arg)
{
	char *Result[32] = {NULL};
	char del1[]="\n";
	char del2 = '\r';
	char i,j;
	CPU_SR      cpu_sr;
	OS_ERR err;
//	CPU_TS ts;
	
	VCP_init(MSS_USB_VCP_9600_BAUD,
             MSS_USB_VCP_ONE_STOP_BIT,
             MSS_USB_VCP_NO_PARITY,
             MSS_USB_VCP_DATA_8_BITS);
	
	VCP_rx_prepare((uint8_t *)gRev1_Buffer, sizeof(gRev1_Buffer), receive_data_handler);
	GPIO_set_output(&g_gpio,GPIO_31,0);
    while(DEF_TRUE)
	{
		if(VCP_HOST_APP_READY == VCP_configuration_state())
		{
			if(g_rx2_count)
			{	
				CPU_CRITICAL_ENTER();
				memcpy(gRx_Buffer,gRev2_Buffer,g_rx2_count);
				g_rx_count=g_rx2_count;
				g_rx2_count = 0;
				CPU_CRITICAL_EXIT();
				i=0;	
				Result[i] = strtok(gRx_Buffer,del1);
				while(Result[i] != NULL)
				{
					i++;
					Result[i] = strtok(NULL,del1);
				}
				j=0;
				for(j=0;j<i;j++)
				{
					if(j == (i-1))
					{
						if(strcmp(strchr(Result[j],del2),&del2) !=0)
						{
							strcat(gTx_Buffer,gDataNotComplete);
						}
						else
						{
							StringCmp(Result[j]);
						}
					}
					else
					{
						StringCmp(Result[j]);
					}
					
				}
				memset(gRx_Buffer,'\0',sizeof(gTx_Buffer));
				g_rx_count = 0;
			}
			if(VCP_tx_done() == 1)
			{
				if((strlen(gTx_Buffer) != 0)&&(strchr(gTx_Buffer,'\n') != 0))
				{
					VCP_tx((uint8_t *)gTx_Buffer, strlen(gTx_Buffer));
					while(VCP_tx_done() != 1)
					{
						OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
					}
					memset(gTx_Buffer,'\0',sizeof(gTx_Buffer));
					//VCP_rx_prepare((uint8_t *)gRev1_Buffer, sizeof(gRev1_Buffer), receive_data_handler);
				}
				
			}	
		}
		else
		{
			//init when usb plug in again
			while(VCP_HOST_APP_READY != VCP_configuration_state())
			{
				OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
			}
			VCP_rx_prepare((uint8_t *)gRev1_Buffer, sizeof(gRev1_Buffer), receive_data_handler);
		}
		OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
    }
}
/*
static void AppTaskUSBTx(void  *p_arg)
{
	OS_ERR err;
	CPU_TS ts;
    while(DEF_TRUE)
	{
		if(strlen(gTx_Buffer) != 0)
		{
			VCP_tx((uint8_t *)gTx_Buffer, strlen(gTx_Buffer));
		}
		OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
    }

}
*/
static  void  AppTaskI2C0   (void  *p_arg)
{
	I2cLoop(0);
}	
static  void  AppTaskI2C1   (void  *p_arg)
{
	I2cLoop(1);
}
static  void  AppTaskI2C2   (void  *p_arg)
{
	I2cLoop(2);
}
static  void  AppTaskI2C3   (void  *p_arg)
{
	I2cLoop(3);
}
static  void  AppTaskI2C4   (void  *p_arg)
{
	I2cLoop(4);
}	
static  void  AppTaskI2C5   (void  *p_arg)
{
	I2cLoop(5);
}
static  void  AppTaskI2C6   (void  *p_arg)
{
	I2cLoop(6);
}
static  void  AppTaskI2C7   (void  *p_arg)
{
	I2cLoop(7);
}
static  void  AppTaskI2C8   (void  *p_arg)
{
	I2cLoop(8);
}
static  void  AppTaskI2C9   (void  *p_arg)
{
	I2cLoop(9);
}

static  void  AppTaskSPI0   (void  *p_arg)
{
	SpiLoop(0);
}	
static  void  AppTaskSPI1   (void  *p_arg)
{
	SpiLoop(1);
}
static  void  AppTaskSPI2   (void  *p_arg)
{
	SpiLoop(2);
}
static  void  AppTaskSPI3   (void  *p_arg)
{
	SpiLoop(3);
}
static  void  AppTaskSPI4   (void  *p_arg)
{
	SpiLoop(4);
}	
static  void  AppTaskSPI5   (void  *p_arg)
{
	SpiLoop(5);
}
static  void  AppTaskSPI6   (void  *p_arg)
{
	SpiLoop(6);
}
static  void  AppTaskSPI7   (void  *p_arg)
{
	SpiLoop(7);
}
static  void  AppTaskUART0   (void  *p_arg)
{
	UartLoop(0);
}	
static  void  AppTaskUART1   (void  *p_arg)
{
	UartLoop(1);
}
static  void  AppTaskUART2   (void  *p_arg)
{
	UartLoop(2);
}
static  void  AppTaskUART3   (void  *p_arg)
{
	UartLoop(3);
}
static  void  AppTaskUART4   (void  *p_arg)
{
	UartLoop(4);
}	
static  void  AppTaskUART5   (void  *p_arg)
{
	UartLoop(5);
}
static  void  AppTaskUART6   (void  *p_arg)
{
	UartLoop(6);
}
static  void  AppTaskUART7   (void  *p_arg)
{
	UartLoop(7);
}

static  void  AppTaskUART8   (void  *p_arg)
{
	UartLoop(8);
}
static  void  AppTaskUART9   (void  *p_arg)
{
	UartLoop(9);
}
static void AppTaskGPIO(void *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	uint32_t temp = 0;
	
	
	while(DEF_TRUE)
	{
		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		strcat(gTx_Buffer,"[],GPIO,0,");
		Len = String2Char(gGPIO_Buffer);
		//if((gI2C_Buffer[channel][0] == 3)&&(gI2C_Buffer[channel][1] == 1)&&(gI2C_Buffer[channel][2] == 0)&&(gI2C_Buffer[channel][3] <= (uint8_t)I2C_BCLK_DIV_8))
		//{
		//	ErrorStatue = CoreI2cxInit(channel, gI2C_Buffer[channel][3]);
		//	if(ErrorStatue == NoError)
		//		strcat(gTx_Buffer,g_StringTaseDone);
		//	else
		//		strcat(gTx_Buffer,g_StringDeviceError);
		//}
		if(gGPIO_Buffer[0] == 0x10)
		{
			//bit31 is usb reset must set 0;
			temp = (*(uint32_t *)&gGPIO_Buffer[1]);
			GPIO_set_outputs(&g_gpio,(temp&0x7fffffff));
			strcat(gTx_Buffer,g_StringTaseDone);
		}
		else if(gGPIO_Buffer[0] == 0x11)
		{
			temp = GPIO_get_outputs(&g_gpio);
			Len = Char2String((uint8_t*)&temp, 4,(uint8_t *)&gGPIO_Buffer[0]);
			strncat(gTx_Buffer,gGPIO_Buffer,Len);
		}
		memset(gGPIO_Buffer,'\0',sizeof(gGPIO_Buffer));
	
	}

}
/******************************************************************************
*/
//functions	
void I2cLoop(uint8_t channel)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	uint8_t temp_i2c[64] = {0};
	
	I2C_init(&g_core_i2c[channel], I2C_BASE_ADDRESS+(channel<<12), I2C_MASTER_BASE_ADDRESS+channel, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{
		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			switch(channel)
			{
				case 0:
					strcat(gTx_Buffer,"[],I2C,0,");
					break;
				case 1:
					strcat(gTx_Buffer,"[],I2C,1,");
					break;
				case 2:
					strcat(gTx_Buffer,"[],I2C,2,");
					break;
				case 3:
					strcat(gTx_Buffer,"[],I2C,3,");
					break;
				case 4:
					strcat(gTx_Buffer,"[],I2C,4,");
					break;
				case 5:
					strcat(gTx_Buffer,"[],I2C,5,");
					break;
				case 6:
					strcat(gTx_Buffer,"[],I2C,6,");
					break;
				case 7:
					strcat(gTx_Buffer,"[],I2C,7,");
					break;
				case 8:
					strcat(gTx_Buffer,"[],I2C,8,");
					break;
				case 9:
					strcat(gTx_Buffer,"[],I2C,9,");
					break;
				default:
					break;
			}
			Len = String2Char(gI2C_Buffer[channel]);
			if((gI2C_Buffer[channel][0] == 3)&&(gI2C_Buffer[channel][1] == 1)&&(gI2C_Buffer[channel][2] == 0)&&(gI2C_Buffer[channel][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(channel, gI2C_Buffer[channel][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if((gI2C_Buffer[channel][0] == 0x10)&&(gI2C_Buffer[channel][2] == 0))
			{
				ErrorStatue = CoreI2cxWrite(channel, gI2C_Buffer[channel][3], &gI2C_Buffer[channel][4], gI2C_Buffer[channel][1]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[channel][0] == 0x11)
			{
				//	0		1		2		3		4		5		6		7		8		9		10
				//	cmd		SenLen 	RevLen	Add		pSend   
				ErrorStatue = CoreI2cxRead(channel, gI2C_Buffer[channel][3],(uint8_t *)&gI2C_Buffer[channel][4],gI2C_Buffer[channel][1],
														temp_i2c, gI2C_Buffer[channel][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[channel][2],(uint8_t *)&gI2C_Buffer[channel]);
					strncat(gTx_Buffer,gI2C_Buffer[channel],Len);
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}
			memset(gI2C_Buffer[channel],'\0',sizeof(gI2C_Buffer[0]));
		}
    }
}
void UartLoop(uint8_t channel)
{
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	//baud rate is 115200 clock=25m,
	UART_init(&g_core_uart[channel], UART_BASE_ADDRESS+(channel<<12),13, (DATA_8_BITS | NO_PARITY));
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			switch(channel)
			{
				case 0:
					strcat(gTx_Buffer,"[],UART,0,");
					break;
				case 1:
					strcat(gTx_Buffer,"[],UART,1,");
					break;
				case 2:
					strcat(gTx_Buffer,"[],UART,2,");
					break;
				case 3:
					strcat(gTx_Buffer,"[],UART,3,");
					break;
				case 4:
					strcat(gTx_Buffer,"[],UART,4,");
					break;
				case 5:
					strcat(gTx_Buffer,"[],UART,5,");
					break;
				case 6:
					strcat(gTx_Buffer,"[],UART,6,");
					break;
				case 7:
					strcat(gTx_Buffer,"[],UART,7,");
					break;
				case 8:
					strcat(gTx_Buffer,"[],UART,8,");
					break;
				case 9:
					strcat(gTx_Buffer,"[],UART,9,");
					break;
				default:
					break;
			}
//			Len = String2Char(gUART_Buffer[channel]);
			String2Char(gUART_Buffer[channel]);
			if((gUART_Buffer[channel][0] == 3)&&(gUART_Buffer[channel][1] == 2)&&(gUART_Buffer[channel][2] == 0))
			{
				ErrorStatue = CoreUartInit(channel, gUART_Buffer[channel][3], gUART_Buffer[channel][4]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if((gUART_Buffer[channel][1] == 0x10)&&(gUART_Buffer[channel][2] == 0))
			{
				ErrorStatue = CoreUartWrite(channel, (uint8_t*)&gUART_Buffer[channel][3], gUART_Buffer[channel][1]);
				//if(ErrorStatue == NoError)
				//	strcat(gTx_Buffer,g_StringTaseDone);
				//else
				//	strcat(gTx_Buffer,g_StringDeviceError);
			}
			//receive via interrupt
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gUART_Buffer[channel],'\0',sizeof(gUART_Buffer[channel]));
		}
    }
}
	
	
void SpiLoop(uint8_t channel)
{
	uint8_t Len;
	uint8_t temp_spi[64] = {0};
//	uint8_t i;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	GPIO_set_output(&g_gpio,(gpio_id_t)channel,1);
	//baud rate is 115200 clock=25m,
	SPI_init(&g_core_spi[channel], SPI_BASE_ADDRESS+(channel<<12), SPI_MODE_MASTER, SPI_MODE3, PCLK_DIV_32);
	SPI_set_port(&g_core_spi[channel],SPI_BASE_ADDRESS+(channel<<12));   /*  select SPI Core0  */             
	SPI_set_mode(&g_core_spi[channel],SPI_MODE_MASTER);  /*  master mode       */
	SPI_enable(&g_core_spi[channel]);                    /*  enable SPI Core0  */
	/* configure the appropriate parameters for accessing slave0 (eeprom) */
	SPI_configure (&g_core_spi[channel], SPI_SLAVE_0, SPI_MODE3, PCLK_DIV_32, SPI_MSB_FIRST); 
    while (DEF_TRUE) 
	{
		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			switch(channel)
			{
				case 0:
					strcat(gTx_Buffer,"[],SPI,0,");
					break;
				case 1:
					strcat(gTx_Buffer,"[],SPI,1,");
					break;
				case 2:
					strcat(gTx_Buffer,"[],SPI,2,");
					break;
				case 3:
					strcat(gTx_Buffer,"[],SPI,3,");
					break;
				case 4:
					strcat(gTx_Buffer,"[],SPI,4,");
					break;
				case 5:
					strcat(gTx_Buffer,"[],SPI,5,");
					break;
				case 6:
					strcat(gTx_Buffer,"[],SPI,6,");
					break;
				case 7:
					strcat(gTx_Buffer,"[],SPI,7,");
					break;
				default:
					break;
			}
			Len = String2Char(gSPI_Buffer[channel]);
//			String2Char(gSPI_Buffer[channel]);
			if((gSPI_Buffer[channel][0] == 3)&&(gSPI_Buffer[channel][1] == 2)&&(gSPI_Buffer[channel][2] == 0))
			{
				ErrorStatue = CoreSpixInit(channel, *(uint8_t *)&gSPI_Buffer[channel][3], *(uint8_t *)&gSPI_Buffer[channel][4]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if((gSPI_Buffer[channel][0] == 0x10)&&(gSPI_Buffer[channel][2] == 0))
			{
				ErrorStatue = CoreSpixWrite(channel, (uint8_t *)&gSPI_Buffer[channel][3],1,(uint8_t *)&gSPI_Buffer[channel][4],(uint8_t )gSPI_Buffer[channel][1]-1);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gSPI_Buffer[channel][0] == 0x11)
			{
				ErrorStatue = CoreSpixRead(channel, (uint8_t *)&gSPI_Buffer[channel][3], gSPI_Buffer[channel][1], temp_spi, gSPI_Buffer[channel][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_spi, gSPI_Buffer[channel][2],(uint8_t *)&gSPI_Buffer[channel]);
					strncat(gTx_Buffer,gSPI_Buffer[channel],Len);
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}
			memset(gSPI_Buffer[channel],'\0',sizeof(gSPI_Buffer[channel]));
		}
    }
}
void receive_data_handler(uint32_t rx_count, uint32_t rx_err_status)
{
    if(rx_err_status == 0)
    {
        if(rx_count)
        {
			memcpy(&gRev2_Buffer[g_rx2_count], gRev1_Buffer, rx_count);
			g_rx2_count += rx_count;
        }
        else
        {
            g_rx2_count = 0;
            ASSERT(0);
        }
    }
    else
    {
        ASSERT(0);
    }
}

int StringCmp(char * String)
{
	OS_ERR err;
//	CPU_TS ts;
	char del1[]= ",";
	char * Result[5]= {NULL};
	char i;
	char ret = 0;
	i = 0;
	Result[i] = strtok(String,del1);
	while(Result[i] != NULL)
	{
		i++;
		Result[i] = strtok(NULL,del1);
	}
	if((strcmp(Result[0],"[]") == 0)&&(i ==5))
	{
		i = atox(Result[2]);
		if(strcmp(Result[1],"I2C") == 0)
		{
			if(i < MAX_I2C_CHANNEL)
			{
				strcat(gI2C_Buffer[i], Result[3]);
				OSTaskSemPost(&AppTaskI2CTCB[i],OS_OPT_POST_NONE,&err);
			}
			else
			{
				ret = 1;
			}
			
		}
		else if(strcmp(Result[1],"GPIO") == 0)
		{
			if(i == 0)
			{
				strcat(gGPIO_Buffer, Result[3]);
				OSTaskSemPost(&AppTaskGPIOTCB,OS_OPT_POST_NONE,&err);
			}
			else
			{
				ret = 1;
			}
		}
		/*
		else if(strcmp(Result[1],"SPI") == 0)
		{
			if(i < MAX_SPI_CHANNEL)
			{
				strcat(gSPI_Buffer[i], Result[3]);
			}
			else
			{
				ret = -1;
			}
			
		}
		else if(strcmp(Result[1],"UART") == 0)
		{
			if(i < MAX_UART_CHANNEL)
			{
				strcat(gUART_Buffer[i], Result[3]);
			}
			else
			{
				ret = -1;
			}
			
		}
		*/
		else
		{
			ret =  1;
		}
	}
	else
	{
		ret =  1;
	}
	if(ret == 1)
	{
		strcat(gTx_Buffer,g_StringParError);
	}
	else
	{}
	return 0;
}
//conv function

const char ConvTable[16]=
{
	'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
};
uint8_t atox(char * String)
{
	uint8_t i;
	if(strlen(String) == 2)
	{
		if((String[0] > 0x2f)&&(String[0] <0x3a))
		{
			i = (String[0]-0x30)<<4;
		}
		else if((String[0] > 0x40)&&(String[0] <0x47))
		{
			i = (String[0]-0x37)<<4;
		}
		else if((String[0] > 0x60)&&(String[0] <0x67))
		{
			i = (String[0]-0x57)<<4;
		}
		else
		{}
		if((String[1] > 0x2f)&&(String[1] <0x3a))
		{
			i += (String[1]-0x30);
		}
		else if((String[1] > 0x40)&&(String[1] <0x47))
		{
			i += (String[1]-0x37);
		}
		else if((String[1] > 0x60)&&(String[1] <0x67))
		{
			i += (String[1]-0x57);
		}
		else
		{}
	}
	else if(strlen(String) == 1)
	{
		if((String[0] > 0x2f)&&(String[0] <0x3a))
		{
			i = (String[0]-0x30);
		}
		else if((String[0] > 0x40)&&(String[0] <0x47))
		{
			i = (String[0]-0x37);
		}
		else if((String[0] > 0x60)&&(String[0] <0x67))
		{
			i = (String[0]-0x57);
		}
	}
	else
	{}
	return i;
}
int String2Char(char *InputData)
{
	char del1[]=" ";
	char * String;
	int i = 0;
	char *p = InputData;
	String = strtok(InputData,del1);
	while(String != NULL)
	{
		*p++ = (uint8_t)atox(String);
		String = strtok(NULL,del1);
		i++;
	}
	return i;
}
uint8_t Char2String(uint8_t *InputData, uint8_t InLen, uint8_t *OutputData)
{
	uint8_t i;
	uint8_t cnt = 0;
	for(i=0;i<InLen;i++)
	{
		*OutputData++ = ConvTable[(InputData[i]>>4)&0x0f];
		*OutputData++ = ConvTable[InputData[i]&0x0f];
		cnt += 2;
		if(i == (InLen-1))
		{
			*OutputData++ = ',';
			*OutputData++ = '\r';
			*OutputData++ = '\n';
			*OutputData++ = '\0';
			cnt += 4;
		}
		else
		{
			*OutputData++ = ' ';
			cnt++;
		}
		
	}
	return cnt;
}
