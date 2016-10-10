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
i2c_instance_t g_core_i2c[MAX_I2C_CHANNEL];

gpio_instance_t g_gpio;
//spi
//char gSPI_Buffer[MAX_SPI_CHANNEL][SPI_BUFFER_SIZE];
//SPI_instance_t g_core_spi[MAX_SPI_CHANNEL];
//uart
char gUART_Buffer[MAX_UART_CHANNEL][UART_BUFFER_SIZE];
UART_instance_t g_core_uart[MAX_UART_CHANNEL];

gpio_instance_t g_gpio;
 /* ----------------- APPLICATION GLOBALS ------------------ */
static  OS_TCB   AppTaskStartTCB;
static  CPU_STK  AppTaskStartStk[APP_TASK_START_STK_SIZE];

//static  OS_TCB   AppTaskUSBRxTCB;
//static  CPU_STK  AppTaskUSBRxStk[APP_USB_RX_STK_SIZE];

static  OS_TCB   AppTaskUSBTCB;
static  CPU_STK  AppTaskUSBStk[APP_USB_STK_SIZE];

static  OS_TCB   AppTaskI2CTCB[MAX_I2C_CHANNEL];
static  CPU_STK  AppTaskI2CStk[MAX_I2C_CHANNEL][APP_I2C0_STK_SIZE];


//static  OS_TCB   AppTaskUARTTCB[MAX_UART_CHANNEL];
//static  CPU_STK  AppTaskUARTStk[MAX_UART_CHANNEL][APP_UART0_STK_SIZE];

//static  OS_TCB   AppTaskSPITCB[MAX_SPI_CHANNEL];
//static  CPU_STK  AppTaskSPIStk[MAX_SPI_CHANNEL][APP_SPI0_STK_SIZE];

/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/
int String2Char(char *InputData);
void receive_data_handler( uint32_t rx_count, uint32_t rx_err_status );
int StringCmp(char * String);
uint8_t Char2String(uint8_t *InputData, uint8_t InLen, uint8_t *OutputData);
//task

static  void  AppTaskStart          (void *p_arg);

static  void  AppTaskCreate         (void);
static  void  AppObjCreate          (void);

//static  void  AppTaskUSBRx   (void  *p_arg);
static  void  AppTaskUSB   (void  *p_arg);

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
/*
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
*/
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
//	CIC_set_irq_handler(0,I2C0_Irq);
//	CIC_set_irq_handler(1,I2C1_Irq);
//	CIC_set_irq_handler(2,I2C2_Irq);
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
//	CIC_set_irq_handler(13, SPI3_Irq);
//	CIC_set_irq_handler(14, SPI4_Irq);
	CIC_enable_irq(3);
	CIC_enable_irq(4);
	CIC_enable_irq(5);
	CIC_enable_irq(6);
	CIC_enable_irq(7);
	CIC_enable_irq(8);
	CIC_enable_irq(9);
	CIC_enable_irq(10);
	CIC_enable_irq(1);
	CIC_enable_irq(12);
	
	GPIO_init(&g_gpio,GPIO_BASE_ADDRESS,GPIO_APB_32_BITS_BUS);
	GPIO_config(&g_gpio, GPIO_0,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_1,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_2,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_3,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_4,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_5,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_6,GPIO_OUTPUT_MODE);
	GPIO_config(&g_gpio, GPIO_7,GPIO_OUTPUT_MODE);
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
//8
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
	OSTaskCreate((OS_TCB     *)&AppTaskI2CTCB[7],
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
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	I2C_init(&g_core_i2c[0], I2C_BASE_ADDRESS, I2C_MASTER_BASE_ADDRESS, I2C_PCLK_DIV_256);
	
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,0,");
			Len = String2Char(gI2C_Buffer[0]);
			if((gI2C_Buffer[0][0] == 0)&&(gI2C_Buffer[0][1] == 3)&&(gI2C_Buffer[0][2] == 1)&&(gI2C_Buffer[0][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(0, gI2C_Buffer[0][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[0][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(0, gI2C_Buffer[0][0], &gI2C_Buffer[0][4], gI2C_Buffer[0][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[0][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(0, gI2C_Buffer[0][0],(uint8_t *)&gI2C_Buffer[0][4],gI2C_Buffer[0][3],
														temp_i2c, gI2C_Buffer[0][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[0][2],(uint8_t *)&gI2C_Buffer[0]);
					strncat(gTx_Buffer,gI2C_Buffer[0],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[0],'\0',sizeof(gI2C_Buffer[0]));
		}
    }
}	
static  void  AppTaskI2C1   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[1], I2C_BASE_ADDRESS+0x1000, I2C_MASTER_BASE_ADDRESS+1, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{	
			strcat(gTx_Buffer,"[],I2C,1,");
			Len = String2Char(gI2C_Buffer[1]);
			if((gI2C_Buffer[1][0] == 0)&&(gI2C_Buffer[1][1] == 3)&&(gI2C_Buffer[1][2] == 1)&&(gI2C_Buffer[1][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(1, gI2C_Buffer[1][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[1][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(1, gI2C_Buffer[1][0], &gI2C_Buffer[1][4], gI2C_Buffer[1][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[1][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(1, gI2C_Buffer[1][0],(uint8_t *)&gI2C_Buffer[1][4],gI2C_Buffer[1][3],
														temp_i2c, gI2C_Buffer[1][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[1][2],(uint8_t *)&gI2C_Buffer[1]);
					strncat(gTx_Buffer,gI2C_Buffer[1],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[1],'\0',sizeof(gI2C_Buffer[1]));
		}
    }
}
static  void  AppTaskI2C2   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[2], I2C_BASE_ADDRESS+0x2000, I2C_MASTER_BASE_ADDRESS+2, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,2,");
			Len = String2Char(gI2C_Buffer[2]);
			if((gI2C_Buffer[2][0] == 0)&&(gI2C_Buffer[2][1] == 3)&&(gI2C_Buffer[2][2] == 1)&&(gI2C_Buffer[2][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(2, gI2C_Buffer[2][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[2][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(2, gI2C_Buffer[2][0], &gI2C_Buffer[2][4], gI2C_Buffer[2][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[2][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(2, gI2C_Buffer[2][0],(uint8_t *)&gI2C_Buffer[2][4],gI2C_Buffer[2][3],
														temp_i2c, gI2C_Buffer[2][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[2][2],(uint8_t *)&gI2C_Buffer[2]);
					strncat(gTx_Buffer,gI2C_Buffer[2],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[2],'\0',sizeof(gI2C_Buffer[2]));
		}
    }
}
static  void  AppTaskI2C3   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[3], I2C_BASE_ADDRESS+0x3000, I2C_MASTER_BASE_ADDRESS+3, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,3,");
			Len = String2Char(gI2C_Buffer[3]);
			if((gI2C_Buffer[3][0] == 0)&&(gI2C_Buffer[3][1] == 3)&&(gI2C_Buffer[3][2] == 1)&&(gI2C_Buffer[3][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(3, gI2C_Buffer[3][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[3][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(3, gI2C_Buffer[3][0], &gI2C_Buffer[3][4], gI2C_Buffer[3][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[3][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(3, gI2C_Buffer[3][0],(uint8_t *)&gI2C_Buffer[3][4],gI2C_Buffer[3][3],
														temp_i2c, gI2C_Buffer[3][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[3][2],(uint8_t *)&gI2C_Buffer[3]);
					strncat(gTx_Buffer,gI2C_Buffer[3],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[3],'\0',sizeof(gI2C_Buffer[3]));
		}
    }
}
static  void  AppTaskI2C4   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[4], I2C_BASE_ADDRESS+0x4000, I2C_MASTER_BASE_ADDRESS+4, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,4,");
			Len = String2Char(gI2C_Buffer[4]);
			if((gI2C_Buffer[4][0] == 0)&&(gI2C_Buffer[4][1] == 3)&&(gI2C_Buffer[4][2] == 1)&&(gI2C_Buffer[4][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(4, gI2C_Buffer[4][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[4][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(4, gI2C_Buffer[4][0], &gI2C_Buffer[4][4], gI2C_Buffer[4][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[4][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(4, gI2C_Buffer[4][0],(uint8_t *)&gI2C_Buffer[4][4],gI2C_Buffer[4][3],
														temp_i2c, gI2C_Buffer[4][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[4][2],(uint8_t *)&gI2C_Buffer[4]);
					strncat(gTx_Buffer,gI2C_Buffer[4],Len);
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[4],'\0',sizeof(gI2C_Buffer[4]));
		}
    }
}	
static  void  AppTaskI2C5   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	I2C_init(&g_core_i2c[5], I2C_BASE_ADDRESS+0x5000, I2C_MASTER_BASE_ADDRESS+5, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,5,");
			Len = String2Char(gI2C_Buffer[5]);
			if((gI2C_Buffer[5][0] == 0)&&(gI2C_Buffer[5][1] == 3)&&(gI2C_Buffer[5][2] == 1)&&(gI2C_Buffer[5][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(5, gI2C_Buffer[5][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[5][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(5, gI2C_Buffer[5][0], &gI2C_Buffer[5][4], gI2C_Buffer[5][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[5][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(5, gI2C_Buffer[5][0],(uint8_t *)&gI2C_Buffer[5][4],gI2C_Buffer[5][3],
														temp_i2c, gI2C_Buffer[5][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[5][2],(uint8_t *)&gI2C_Buffer[5]);
					strncat(gTx_Buffer,gI2C_Buffer[5],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}
			memset(gI2C_Buffer[5],'\0',sizeof(gI2C_Buffer[5]));
		}
    }
}
static  void  AppTaskI2C6   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[6], I2C_BASE_ADDRESS+0x6000, I2C_MASTER_BASE_ADDRESS+6, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,6,");
			Len = String2Char(gI2C_Buffer[6]);
			if((gI2C_Buffer[6][0] == 0)&&(gI2C_Buffer[6][1] == 3)&&(gI2C_Buffer[6][2] == 1)&&(gI2C_Buffer[6][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(6, gI2C_Buffer[6][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[6][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(6, gI2C_Buffer[6][0], &gI2C_Buffer[6][4], gI2C_Buffer[6][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[6][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(6, gI2C_Buffer[6][0],(uint8_t *)&gI2C_Buffer[6][4],gI2C_Buffer[6][3],
														temp_i2c, gI2C_Buffer[6][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[6][2],(uint8_t *)&gI2C_Buffer[6]);
					strncat(gTx_Buffer,gI2C_Buffer[6],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[6],'\0',sizeof(gI2C_Buffer[6]));
		}
    }
}
static  void  AppTaskI2C7   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[7], I2C_BASE_ADDRESS+0x7000, I2C_MASTER_BASE_ADDRESS+7, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,7,");
			Len = String2Char(gI2C_Buffer[7]);
			if((gI2C_Buffer[7][0] == 0)&&(gI2C_Buffer[7][1] == 3)&&(gI2C_Buffer[7][2] == 1)&&(gI2C_Buffer[7][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(7, gI2C_Buffer[7][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[7][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(7, gI2C_Buffer[7][0], &gI2C_Buffer[7][4], gI2C_Buffer[7][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[7][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(7, gI2C_Buffer[7][0],(uint8_t *)&gI2C_Buffer[7][4],gI2C_Buffer[7][3],
														temp_i2c, gI2C_Buffer[7][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[7][2],(uint8_t *)&gI2C_Buffer[7]);
					strncat(gTx_Buffer,gI2C_Buffer[7],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[7],'\0',sizeof(gI2C_Buffer[7]));
		}
    }
}
static  void  AppTaskI2C8   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	char pData1[3] ={0x06, 0x00, 0x00};
	char pData2[3] ={0x02, 0x24, 0x0c};
	char pData3[3] ={0x02, 0x6d, 0x0c};
	//char InitData[3] = {0x10, 0x45, 0xd3};
/*	OSTimeDlyHMSM(0,0,5,0,OS_OPT_TIME_HMSM_STRICT,&err);
	I2C_init(&g_core_i2c[8], I2C_BASE_ADDRESS+0x8000, I2C_MASTER_BASE_ADDRESS+8, I2C_PCLK_DIV_256);
	OSTimeDlyHMSM(0,0,1,0,OS_OPT_TIME_HMSM_STRICT,&err);
	CoreI2cxWrite(8, 0x20, pData1, 3);
	OSTimeDlyHMSM(0,0,1,0,OS_OPT_TIME_HMSM_STRICT,&err);
	CoreI2cxWrite(8, 0x20, pData2, 3);
	OSTimeDlyHMSM(0,0,1,0,OS_OPT_TIME_HMSM_STRICT,&err);
	CoreI2cxWrite(8, 0x4e, InitData, 3);
*/	I2C_init(&g_core_i2c[8], I2C_BASE_ADDRESS+0x8000, I2C_MASTER_BASE_ADDRESS+8, I2C_PCLK_DIV_256);
	CoreI2cxWrite(8, 0x20, pData1, 3);
	CoreI2cxWrite(8, 0x20, pData2, 3);
	OSTimeDlyHMSM(0,0,2,0,OS_OPT_TIME_HMSM_STRICT,&err);
	CoreI2cxWrite(8, 0x20, pData3, 3);
    while (DEF_TRUE)
	{
		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,8,");
			Len = String2Char(gI2C_Buffer[8]);
			if((gI2C_Buffer[8][0] == 0)&&(gI2C_Buffer[8][1] == 3)&&(gI2C_Buffer[8][2] == 1)&&(gI2C_Buffer[8][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(8, gI2C_Buffer[8][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[8][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(8, gI2C_Buffer[8][0], &gI2C_Buffer[8][4], gI2C_Buffer[8][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[8][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(8, gI2C_Buffer[8][0],(uint8_t *)&gI2C_Buffer[8][4],gI2C_Buffer[8][3],
														temp_i2c, gI2C_Buffer[8][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[8][2],(uint8_t *)&gI2C_Buffer[8]);
					strncat(gTx_Buffer,gI2C_Buffer[8],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[8],'\0',sizeof(gI2C_Buffer[8]));
		}
    }
}
static  void  AppTaskI2C9   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	
	I2C_init(&g_core_i2c[9], I2C_BASE_ADDRESS+0x9000, I2C_MASTER_BASE_ADDRESS+9, I2C_PCLK_DIV_256);
    while (DEF_TRUE) 
	{

		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],I2C,9,");
			Len = String2Char(gI2C_Buffer[9]);
			if((gI2C_Buffer[9][0] == 0)&&(gI2C_Buffer[9][1] == 3)&&(gI2C_Buffer[9][2] == 1)&&(gI2C_Buffer[9][3] <= (uint8_t)I2C_BCLK_DIV_8))
			{
				ErrorStatue = CoreI2cxInit(9, gI2C_Buffer[9][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[9][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(9, gI2C_Buffer[9][0], &gI2C_Buffer[9][4], gI2C_Buffer[9][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[9][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(9, gI2C_Buffer[9][0],(uint8_t *)&gI2C_Buffer[9][4],gI2C_Buffer[9][3],
														temp_i2c, gI2C_Buffer[9][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[9][2],(uint8_t *)&gI2C_Buffer[9]);
					strncat(gTx_Buffer,gI2C_Buffer[9],Len);
					strcat(gTx_Buffer,"\r\n");
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[9],'\0',sizeof(gI2C_Buffer[9]));
		}
    }
}

static  void  AppTaskSPI0   (void  *p_arg)
{}	
static  void  AppTaskSPI1   (void  *p_arg)
{}
static  void  AppTaskSPI2   (void  *p_arg)
{}
static  void  AppTaskSPI3   (void  *p_arg)
{}
static  void  AppTaskSPI4   (void  *p_arg)
{}	
static  void  AppTaskSPI5   (void  *p_arg)
{}
static  void  AppTaskSPI6   (void  *p_arg)
{}
static  void  AppTaskSPI7   (void  *p_arg)
{}
	
static  void  AppTaskUART0   (void  *p_arg)
{
	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	//baud rate is 115200 clock=25m,
	UART_init(&g_core_uart[0], UART_BASE_ADDRESS,13, (DATA_8_BITS | NO_PARITY));
    while (DEF_TRUE) 
	{
		OSTaskSemPend(0,OS_OPT_PEND_BLOCKING,&ts,&err);
		if(err == OS_ERR_NONE)
		{
			strcat(gTx_Buffer,"[],UART,0,");
			Len = String2Char(gI2C_Buffer[0]);
			if((gI2C_Buffer[0][0] == 0)&&(gI2C_Buffer[0][1] == 3)&&(gI2C_Buffer[0][2] == 1))
			{
				ErrorStatue = CoreUartInit(0, gI2C_Buffer[0][3], gI2C_Buffer[0][4]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gI2C_Buffer[0][1] == 0x10)
			{
				ErrorStatue = CoreI2cxWrite(0, gI2C_Buffer[0][0], &gI2C_Buffer[0][4], gI2C_Buffer[0][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[0],'\0',sizeof(gI2C_Buffer[0]));
		}
    }
}	
static  void  AppTaskUART1   (void  *p_arg)
{}
static  void  AppTaskUART2   (void  *p_arg)
{}
static  void  AppTaskUART3   (void  *p_arg)
{}
static  void  AppTaskUART4   (void  *p_arg)
{}	
static  void  AppTaskUART5   (void  *p_arg)
{}
static  void  AppTaskUART6   (void  *p_arg)
{}
static  void  AppTaskUART7   (void  *p_arg)
{}
/******************************************************************************
*/
//functions	
void UartLoop(uint8_t channel)
{
/*	int Len;
	OS_ERR err;
	CPU_TS ts;
	ErrorData_t ErrorStatue = NoError;
	//100m clk 115200,BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
	UART_init(&g_core_uart[channel], UART_BASE_ADDRESS+(channel<<12),53,(DATA_8_BITS | NO_PARITY));
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
			Len = String2Char(gUART_Buffer[channel]);
			if((gUART_Buffer[channel][0] == 0)&&(gUART_Buffer[channel][1] == 3)&&(gUART_Buffer[channel][2] == 1))
			{
				UART_init(&g_core_uart[channel],UART_BASE_ADDRESS+(channel<<12),gUART_Buffer[4][3],(DATA_8_BITS | NO_PARITY));
				strcat(gTx_Buffer,g_StringTaseDone);
			}
			else if(gUART_Buffer[4][1] == 0x10)
			{
				UART_send(&g_core_uart[channel], (uint8_t *)&gUART_Buffer[4][4], gUART_Buffer[4][3]);
				if(ErrorStatue == NoError)
					strcat(gTx_Buffer,g_StringTaseDone);
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else if(gUART_Buffer[4][1] == 0x11)
			{
				uint8_t temp_i2c[256] = {0};
				ErrorStatue = CoreI2cxRead(4, gUART_Buffer[4][0],(uint8_t *)&gUART_Buffer[4][4],gUART_Buffer[4][3],
														temp_i2c, gUART_Buffer[4][2]);
				if(ErrorStatue == NoError)
				{
					Len = Char2String(temp_i2c, gI2C_Buffer[4][2],(uint8_t *)&gI2C_Buffer[4]);
					strncat(gTx_Buffer,gI2C_Buffer[4],Len);
				}
				else
					strcat(gTx_Buffer,g_StringDeviceError);
			}
			else
			{
				strcat(gTx_Buffer,g_StringParError);
			}

			memset(gI2C_Buffer[4],'\0',sizeof(gI2C_Buffer[4]));
		}
    }
*/
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
