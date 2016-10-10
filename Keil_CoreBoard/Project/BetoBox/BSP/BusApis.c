#include "includes.h"


extern i2c_instance_t g_core_i2c[8];
//extern SPI_instance_t g_core_spi[8];
extern UART_instance_t g_core_uart[8];
//extern gpio_instance_t g_gpio;
//Spi
/*
ErrorData_t CoreSpixInit(uint8_t SpiNum, uint8_t Mode, uint8_t Divede)
{
	if((SpiNum<SUM_OF_SPI) && ((Mode == SPI_MODE0)||(Mode == SPI_MODE1) || (Mode == SPI_MODE2)
		|| (Mode == SPI_MODE3)) &&(Divede < 8))
	{
		SPI_init(&g_core_spi[SpiNum], SPI_BASE_ADDRESS+(SpiNum<<8), SPI_MODE_MASTER, (SPI_protocol_mode_t)Mode, (SPI_pclk_div_t)Divede);
		return NoError;
	}
	else
	{
		return ParError;
	}

}

ErrorData_t CoreSpixWrite(uint8_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *SendData, uint8_t SendLen)
{
	GPIO_set_output(&g_gpio,(gpio_id_t)SpiNum, 0);
	SPI_slave_select(&g_core_spi[SpiNum], SPI_SLAVE_0 );
	SPI_block_write(&g_core_spi[SpiNum],pData, CmdLen, SendData, SendLen);
	GPIO_set_output(&g_gpio,(gpio_id_t)SpiNum, 1);
	return NoError;
}
ErrorData_t CoreSpixRead(uint8_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *RevData, uint8_t RevLen)
{
	GPIO_set_output(&g_gpio,(gpio_id_t)SpiNum, 0);
	SPI_slave_select(&g_core_spi[SpiNum], SPI_SLAVE_0 );
	SPI_block_read(&g_core_spi[SpiNum],pData, CmdLen, RevData, RevLen);
//	SPI_transfer(&g_core_spi[SpiNum],pData,RevData,Len);
	GPIO_set_output(&g_gpio,(gpio_id_t)SpiNum, 1);
	return NoError;
}
	
//Uart
ErrorData_t CoreUartxInit(uint8_t UartNum, uint16_t Divede)
{
	if(UartNum<SUM_OF_UART)
	{
		UART_init(&g_core_uart[UartNum], UART_BASE_ADDRESS+(UartNum<<8), 
                  Divede, DATA_8_BITS | NO_PARITY);
		return NoError;
	}
	else
	{
		return ParError;
	}
}
ErrorData_t CoreUartxWrite(uint8_t UartNum, uint8_t *pData, uint16_t Len)
{
	UART_send(&g_core_uart[UartNum], pData, Len);
	return NoError;
}
ErrorData_t CoreUartxRead(uint8_t UartNum, uint8_t *pData, uint8_t *Len)
{
	*Len = UART_get_rx(&g_core_uart[UartNum], pData, BUFFER_SIZE_S);
	return NoError;
		
}
*/
//I2c
ErrorData_t CoreI2cxInit(uint8_t I2cNum, uint8_t Divede)
{
	if((I2cNum<SUM_OF_I2C) && (Divede < 8))
	{
		I2C_init(&g_core_i2c[I2cNum], I2C_BASE_ADDRESS+(I2cNum<<12), I2C_MASTER_BASE_ADDRESS+I2cNum, (i2c_clock_divider_t)Divede);
		return NoError;
	}
	else
	{
		return ParError;
	}
}
ErrorData_t CoreI2cxWrite(char I2cNum, char DeviceAdd, char *pData, char Len)
{
	 OS_ERR      err;
	
	I2C_write(&g_core_i2c[I2cNum], DeviceAdd, (uint8_t *)pData, Len, I2C_RELEASE_BUS);
	while( I2C_IN_PROGRESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
	{
		OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
	}
    if( I2C_SUCCESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
    {
		return NoError;
    }
	else
	{
		return DeviceError;
	}
	
}
ErrorData_t CoreI2cxRead(uint8_t I2cNum, uint8_t DeviceAdd, uint8_t *pSendData, uint8_t SendLen,
			uint8_t *pRevData, uint8_t RevLen)
{
	 OS_ERR      err;
	
	if(SendLen == 0)
	{
		I2C_read(&g_core_i2c[I2cNum], DeviceAdd, pRevData, RevLen, I2C_RELEASE_BUS);
	}
	else
	{
		I2C_write_read(&g_core_i2c[I2cNum], DeviceAdd, pSendData, SendLen, pRevData, RevLen, I2C_RELEASE_BUS);
	}
	
	while( I2C_IN_PROGRESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
	{
		OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
	}
    if( I2C_SUCCESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
    {
		return NoError;
    }
	else
	{
		return DeviceError;
	}
}
ErrorData_t CoreI2cxWriteRead(	uint8_t I2cNum, uint8_t DeviceAdd, uint8_t *Offset, uint8_t OffsetSize,
								uint8_t *pData, uint16_t Len)
{
	I2C_write_read(&g_core_i2c[I2cNum], DeviceAdd, Offset, OffsetSize, pData, Len, I2C_RELEASE_BUS);
	while( I2C_IN_PROGRESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
	{}
    if( I2C_SUCCESS == I2C_get_status( &g_core_i2c[I2cNum] ) )
    {
		return NoError;
    }
	else
	{
		return DeviceError;
	}
}

//uart
ErrorData_t CoreUartInit(uint8_t I2cNum, uint8_t Divede, uint8_t Config)
{
	if(I2cNum<SUM_OF_UART)
	{
		UART_init(&g_core_uart[I2cNum], UART_BASE_ADDRESS+(I2cNum<<12),Divede, Config);
		return NoError;
	}
	else
	{
		return ParError;
	}
}
ErrorData_t CoreUartWrite(uint8_t UartNum, uint8_t *pData, uint16_t Len)
{
	OS_ERR      err;
	UART_send(&g_core_uart[UartNum], pData, Len);
    NVIC_EnableIRQ(FabricIrq3_IRQn);
	while( I2C_IN_PROGRESS == UART_get_rx_status( &g_core_uart[UartNum] ) )
	{
		OSTimeDlyHMSM(0,0,0,10,OS_OPT_TIME_HMSM_STRICT,&err);
	}
    if( I2C_SUCCESS == UART_get_rx_status( &g_core_uart[UartNum] ) )
    {
		return NoError;
    }
	else
	{
		return DeviceError;
	}
	
}

