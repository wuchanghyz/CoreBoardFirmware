
#ifndef BUS_APIS_H_
#define BUS_APIS_H_

#include <stdint.h>

#define MAX_TRY_TIME 3

#define SUM_OF_I2C		10
#define SUM_OF_SPI		8
#define SUM_OF_UART		10


#define BUFFER_SIZE_L 64//2048
#define BUFFER_SIZE_S 32//512
#define I2C_MASTER_BASE_ADDRESS 0x20

typedef enum ErrorData
{
    NoError = 0,
	ParError,
	FormatError,
	DeviceError
} ErrorData_t;
//Spi
ErrorData_t CoreSpixInit(uint8_t SpiNum, uint8_t Mode, uint8_t Divede);
ErrorData_t CoreSpixWrite(uint8_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *SendData, uint8_t SendLen);
ErrorData_t CoreSpixRead(uint8_t SpiNum, uint8_t *pData, uint8_t CmdLen, uint8_t *RevData, uint8_t RevLen);
//Uart
ErrorData_t CoreUartInit(uint8_t I2cNum, uint8_t Divede, uint8_t Config);
ErrorData_t CoreUartWrite(uint8_t UartNum, uint8_t *pData, uint16_t Len);
//ErrorData_t CoreUartRead(uint8_t UartNum, uint8_t *pData, uint8_t *Len);
//I2c
ErrorData_t CoreI2cxInit(uint8_t I2cNum, uint8_t Divede);
ErrorData_t CoreI2cxWrite(char I2cNum, char DeviceAdd, char *pData, char Len);
ErrorData_t CoreI2cxRead(uint8_t I2cNum, uint8_t DeviceAdd, uint8_t *pSendData, uint8_t SendLen,
			uint8_t *pRevData, uint8_t RevLen);
ErrorData_t CoreI2cxWriteRead(uint8_t I2cNum, uint8_t DeviceAdd, uint8_t *Offset, uint8_t OffsetSize,
								uint8_t *pData, uint16_t Len);
#endif
