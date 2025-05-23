//////////////////////////////////////////////////////////////////////////////////
//// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.
////
//// This   document  contains  proprietary information  which   is
//// protected by  copyright. All rights  are reserved.  This notice
//// refers to original work by Efinix, Inc. which may be derivitive
//// of other work distributed under license of the authors.  In the
//// case of derivative work, nothing in this notice overrides the
//// original author's license agreement.  Where applicable, the
//// original license agreement is included in it's original
//// unmodified form immediately below this header.
////
//// WARRANTY DISCLAIMER.
////     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND
////     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH
////     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,
////     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF
////     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR
////     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED
////     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.
////
//// LIMITATION OF LIABILITY.
////     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY
////     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT
////     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY
////     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,
////     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY
////     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF
////     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR
////     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN
////     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER
////     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE
////     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO
////     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR
////     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT
////     APPLY TO LICENSEE.
////
//////////////////////////////////////////////////////////////////////////////////

/******************************************************************************
*
* @file main.c: semihostingDemo
*
* @brief The semihostingDemo illustrates how to leverage semihosting in the
*        Sapphire SoC by printing message through the console. 
*
* @note Please ensure that the ENABLE_SEMIHOSTING_PRINT is set to 1 in the bsp.h header file. 
*       This enables the seamless output of debug messages. All UART printing calls, e.g., 
*       bsp_print, bsp_printf, and other printing APIs, that are available in the bsp.h file 
*       is directed to the console.
*
******************************************************************************/
#include "bsp.h"

/******************************************************************************
*
* @brief This function demonstrates the use of semihosting to print messages
*        and echo back a string entered through the console.
*
******************************************************************************/
void main() {
#if (ENABLE_SEMIHOSTING_PRINT == 1)
    uint8_t dat;
    uint8_t string[100];
    uint8_t counter = 0;

    bsp_init();
    bsp_printf("Semihosting Demo ! \n\r");
    bsp_printf("You should see this printing in your console...\n\r");
    bsp_printf("Echo demo. Key in your string and press enter...\n\r");
    while (1){
        dat=sh_readc();
        if (dat != '\n'){
            string[counter]=dat;
            counter++;
        }
        else {
            string[counter]='\0'; //null termination
            bsp_printf("Echo string: %s \r\n", string);
            counter = 0;
        }
    }

#else
    #error "Set ENABLE_SEMIHOSTING_PRINT to 1 in bsp.h for the program to work as expected..."
#endif //#if (ENABLE_SEMIHOSTING_PRINT == 1)


}
