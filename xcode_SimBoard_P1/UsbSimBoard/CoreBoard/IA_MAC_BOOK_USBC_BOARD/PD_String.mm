//
//  PD_String.c
//  CoreBoard
//
//  Created by anderson on 17/10/13.
//  Copyright © 2017年 AndersonHan. All rights reserved.
//

#include "PD_String.h"
#include <string>
#include <iostream>
#import "CRS232.h"

char * s_Disable={"Disable\r\n"};
char * s_Unattached={"Unattached SNK\r\n"};
char * s_attached={"Attached SNK\\r\n"};
char * s_Reserved={"Reserved\r\n"};
char * s_AttachedWait={"Attach Wait SNK\r\n"};
char * s_AttachedWaitDRP={"Attach Wait SNK DRP\r\n"};

char * s_NotConnected={"Not Connected\r\n"};
char * s_STD_Advertisement={"STD Advertisement Detected\r\n"};
char * s_15_Advertisement={"1.5A Advertisement Detected\r\n"};
char * s_30_Advertisement={"3.0A Advertisement Detected\r\n"};

char * s_CC1_ForPD={"C_CC1 is CC for PD communication"};
char * s_CC2_ForPD={"C_CC2 is CC for PD communication"};


static uint8_t atox(char * String)
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

char * PD_Version(char * Inputdata, unsigned char Channel)
{
    std::string Input=Inputdata;
    static char temp[11];
    
    temp[3] = atox((char *)Input.substr(12,2).c_str());
    temp[2] = atox((char *)Input.substr(15,2).c_str());
    temp[1] = atox((char *)Input.substr(18,2).c_str());
    temp[0] = atox((char *)Input.substr(21,2).c_str());
    temp[4] = ' ';
    temp[9] = atox((char *)Input.substr(24,2).c_str());
    temp[8] = atox((char *)Input.substr(27,2).c_str());
    temp[7] = '.';
    temp[6] = atox((char *)Input.substr(30,2).c_str());
    temp[5] = atox((char *)Input.substr(33,2).c_str());
    temp[10] = 0x00;
    LogWrite([NSString stringWithFormat:@"CH%d Version: %s\r\n",Channel,temp]);
    return temp;
}
char * PD_Mode(char * Inputdata)
{
    return (char *)"...";
}
char * CC_State(char * Inputdata, unsigned char Channel)
{
    std::string Input=Inputdata;
    std::string temp;
    static std::string Return;
    LogWrite([NSString stringWithFormat:@"CH%d CC Statue is:\r\n",Channel]);
    printf(Inputdata);
    if((Input.substr(0,7) =="[],I2C,")&&(Input.substr(9,2) =="04"))
    {
        temp = Input.substr(12,2);
        if(temp == "xxxxx")
            LogWrite([NSString stringWithFormat:@"  CC Pin For PD: %s\r\n",s_NotConnected]);
        else if(temp == "01")
            LogWrite([NSString stringWithFormat:@"  CC Pin For PD: %s\r\n",s_CC1_ForPD]);
        else if(temp == "02")
            LogWrite([NSString stringWithFormat:@"  CC Pin For PD: %s\r\n",s_CC2_ForPD]);
        else
            LogWrite([NSString stringWithFormat:@"  CC Pin For PD: %s\r\n",s_Reserved]);
        Return.append("  CC1 Pin Statue:");
        temp = Input.substr(15,2);
        if(temp == "00")
            LogWrite([NSString stringWithFormat:@"  CC1 Pin Statue: %s\r\n",s_NotConnected]);
        else if(temp == "03")
            LogWrite([NSString stringWithFormat:@"  CC1 Pin Statue: %s\r\n",s_STD_Advertisement]);
        else if(temp == "04")
            LogWrite([NSString stringWithFormat:@"  CC1 Pin Statue: %s\r\n",s_15_Advertisement]);
        else if(temp == "05")
            LogWrite([NSString stringWithFormat:@"  CC1 Pin Statue: %s\r\n",s_30_Advertisement]);
        else
            LogWrite([NSString stringWithFormat:@"  CC1 Pin Statue: %s\r\n",s_Reserved]);
        
        temp = Input.substr(18,2);
        if(temp == "00")
            LogWrite([NSString stringWithFormat:@"  CC2 Pin Statue: %s\r\n",s_NotConnected]);
        else if(temp == "03")
            LogWrite([NSString stringWithFormat:@"  CC2 Pin Statue: %s\r\n",s_STD_Advertisement]);
        else if(temp == "04")
            LogWrite([NSString stringWithFormat:@"  CC2 Pin Statue: %s\r\n",s_15_Advertisement]);
        else if(temp == "05")
            LogWrite([NSString stringWithFormat:@"  CC2 Pin Statue: %s\r\n",s_30_Advertisement]);
        else
            LogWrite([NSString stringWithFormat:@"  CC2 Pin Statue: %s\r\n",s_Reserved]);
              
        Return.append("  TypeC port Statue:");
        temp = Input.substr(20,2);
        if(temp == "20")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_Disable]);
        else if(temp == "21")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_Unattached]);
        else if(temp == "22")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_attached]);
        else if(temp == "23")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_Reserved]);
        else if(temp == "2A")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_AttachedWait]);
        else if(temp == "4C")
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_AttachedWaitDRP]);
        else
            LogWrite([NSString stringWithFormat:@"  TypeC port Statue: %s\r\n",s_Reserved]);
    return (char *)"Done";
    }
    else
    {
        return (char *)"Error";
    }
}
char * ActiveRDO(char * Inputdata)
{
    return (char *)"...";
}
char * ActivePDO(char * Inputdata)
{
    return (char *)"...";
}
char * GPIO_State(char * Inputdata)
{
    std::string Input=Inputdata;
    std::string temp;
    std::string Return ="GPIO Statue is:\r\n  Data is:";
    
    if((Input.substr(0,7) =="[],I2C,")&&(Input.substr(8,10) =="08"))
    {
        temp = Input.substr(12,2);
        if(temp == "00")
            Return.append(s_NotConnected);
        else if(temp == "01")
            Return.append(s_CC1_ForPD);
        else if(temp == "02")
            Return.append(s_CC2_ForPD);
        else
            Return.append(s_Reserved);
        
        Return.append("  CC1 Pin Statue:");
        temp = Input.substr(15,2);
        if(temp == "00")
            Return.append(s_NotConnected);
        else if(temp == "03")
            Return.append(s_STD_Advertisement);
        else if(temp == "04")
            Return.append(s_15_Advertisement);
        else if(temp == "05")
            Return.append(s_30_Advertisement);
        else
            Return.append(s_Reserved);
        
        Return.append("  CC2 Pin Statue:");
        temp = Input.substr(18,19);
        if(temp == "00")
            Return.append(s_NotConnected);
        else if(temp == "03")
            Return.append(s_STD_Advertisement);
        else if(temp == "04")
            Return.append(s_15_Advertisement);
        else if(temp == "05")
            Return.append(s_30_Advertisement);
        else
            Return.append(s_Reserved);
        
        Return.append("  TypeC port Statue:");
        temp = Input.substr(20,21);
        if(temp == "20")
            Return.append(s_Disable);
        else if(temp == "21")
            Return.append(s_Unattached);
        else if(temp == "22")
            Return.append(s_attached);
        else if(temp == "23")
            Return.append(s_Reserved);
        else if(temp == "2A")
            Return.append(s_AttachedWait);
        else
            Return.append(s_Reserved);
        return (char *)Return.c_str();
    }
    else
    {
        return "Error";
    }
}
