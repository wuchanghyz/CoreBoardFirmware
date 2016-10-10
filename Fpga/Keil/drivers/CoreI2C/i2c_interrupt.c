/*******************************************************************************
 * (c) Copyright 2009-2015 Microsemi SoC Products Group.  All rights reserved.
 * 
 * CoreI2C driver interrupt control.
 * 
 * SVN $Revision: 7984 $
 * SVN $Date: 2015-10-12 12:07:40 +0530 (Mon, 12 Oct 2015) $
 */
#include "hal.h"
#include "hal_assert.h"
#include "core_i2c.h"
#include "../CMSIS/m2sxxx.h"
/*------------------------------------------------------------------------------
 * This function must be modified to enable interrupts generated from the
 * CoreI2C instance identified as parameter.
 */
extern i2c_instance_t g_core_i2c[10];
void I2C_enable_irq( i2c_instance_t * this_i2c )
{
    if(this_i2c == &g_core_i2c[0])
    {
        NVIC_EnableIRQ( FabricIrq0_IRQn );
    }
    if(this_i2c == &g_core_i2c[1])
    {
        NVIC_EnableIRQ( FabricIrq1_IRQn );
    }
	if(this_i2c == &g_core_i2c[2])
    {
        NVIC_EnableIRQ( FabricIrq2_IRQn );
    }
    if(this_i2c == &g_core_i2c[3])
    {
        NVIC_EnableIRQ( FabricIrq3_IRQn );
    }
	if(this_i2c == &g_core_i2c[4])
    {
        NVIC_EnableIRQ( FabricIrq4_IRQn );
    }
    if(this_i2c == &g_core_i2c[5])
    {
        NVIC_EnableIRQ( FabricIrq5_IRQn );
    }
	if(this_i2c == &g_core_i2c[6])
    {
        NVIC_EnableIRQ( FabricIrq6_IRQn );
    }
    if(this_i2c == &g_core_i2c[7])
    {
        NVIC_EnableIRQ( FabricIrq7_IRQn );
    }
	if(this_i2c == &g_core_i2c[8])
    {
        NVIC_EnableIRQ( FabricIrq8_IRQn );
    }
	if(this_i2c == &g_core_i2c[9])
    {
        NVIC_EnableIRQ( FabricIrq9_IRQn );
    }
}

/*------------------------------------------------------------------------------
 * This function must be modified to disable interrupts generated from the
 * CoreI2C instance identified as parameter.
 */
void I2C_disable_irq( i2c_instance_t * this_i2c )
{
    if(this_i2c == &g_core_i2c[0])
    {
        NVIC_DisableIRQ( FabricIrq0_IRQn );
    }
    if(this_i2c == &g_core_i2c[1])
    {
        NVIC_DisableIRQ( FabricIrq1_IRQn );
    }
	if(this_i2c == &g_core_i2c[2])
    {
        NVIC_DisableIRQ( FabricIrq2_IRQn );
    }
    if(this_i2c == &g_core_i2c[3])
    {
        NVIC_DisableIRQ( FabricIrq3_IRQn );
    }
	if(this_i2c == &g_core_i2c[4])
    {
        NVIC_DisableIRQ( FabricIrq4_IRQn );
    }
    if(this_i2c == &g_core_i2c[5])
    {
        NVIC_DisableIRQ( FabricIrq5_IRQn );
    }
	if(this_i2c == &g_core_i2c[6])
    {
        NVIC_DisableIRQ( FabricIrq6_IRQn );
    }
    if(this_i2c == &g_core_i2c[7])
    {
        NVIC_DisableIRQ( FabricIrq7_IRQn );
    }
	if(this_i2c == &g_core_i2c[8])
    {
        NVIC_DisableIRQ( FabricIrq8_IRQn );
    }
	if(this_i2c == &g_core_i2c[9])
    {
        NVIC_DisableIRQ( FabricIrq9_IRQn );
    }
}
