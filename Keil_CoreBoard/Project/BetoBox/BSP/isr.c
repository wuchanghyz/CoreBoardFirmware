#include "includes.h"

extern i2c_instance_t g_core_i2c[MAX_I2C_CHANNEL];
extern UART_instance_t g_core_uart[MAX_UART_CHANNEL];
void FabricIrq0_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[0]);
}

void FabricIrq1_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[1]);
}
void FabricIrq2_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[2]);
}

void FabricIrq3_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[3]);
}
void FabricIrq4_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[4]);
}
void FabricIrq5_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[5]);
}
void FabricIrq6_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[6]);
}
void FabricIrq7_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[7]);
}
void FabricIrq8_IRQHandler(void)
{
	I2C_isr(&g_core_i2c[8]);
}
void FabricIrq9_IRQHandler(void)
 {
	I2C_isr(&g_core_i2c[9]);
}
void FabricIrq10_IRQHandler(void)
{
}
void FabricIrq11_IRQHandler(void)
{

}
void FabricIrq12_IRQHandler(void)
{

}
void FabricIrq13_IRQHandler(void)
{

}
void FabricIrq14_IRQHandler(void)
{

}
void FabricIrq15_IRQHandler(void)
{
	CIC_irq_handler();
}

uint8_t gUartRxBuffer[10][64];
void UART0_Irq(void)
{
    size_t rx_size;
	static uint16_t i = 0;
    if(UART_APB_NO_ERROR == UART_get_rx_status( &g_core_uart[0] ))
    {  
        rx_size = UART_get_rx( &g_core_uart[0], &gUartRxBuffer[0][i], sizeof(gUartRxBuffer[0]) );
        i += rx_size;
    }

}
void UART1_Irq(void)
{
//	UartIrqLoop(1);
}
void UART2_Irq(void)
{
//	UartIrqLoop(2);
}
void UART3_Irq(void)
{

}
void UART4_Irq(void)
{

}
void UART5_Irq(void)
{

}
void UART6_Irq(void)
{

}
void UART7_Irq(void)
{

}
void UART8_Irq(void)
{

}
void UART9_Irq(void)
{

}
void SPI0_Irq(void)
{}
void SPI1_Irq(void)
{}
void SPI2_Irq(void)
{}
void SPI3_Irq(void)
{}
void SPI4_Irq(void)
{}
