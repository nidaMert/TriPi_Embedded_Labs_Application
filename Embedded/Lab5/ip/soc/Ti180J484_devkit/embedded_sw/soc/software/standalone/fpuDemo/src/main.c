////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.              
//
// This   document  contains  proprietary information  which   is        
// protected by  copyright. All rights  are reserved.  This notice       
// refers to original work by Efinix, Inc. which may be derivitive       
// of other work distributed under license of the authors.  In the       
// case of derivative work, nothing in this notice overrides the         
// original author's license agreement.  Where applicable, the           
// original license agreement is included in it's original               
// unmodified form immediately below this header.                        
//                                                                       
// WARRANTY DISCLAIMER.                                                  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND        
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH               
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,  
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF          
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR    
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED       
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.           
//                                                                       
// LIMITATION OF LIABILITY.                                              
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY       
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT    
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY   
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,      
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY    
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF      
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR   
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN    
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER    
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR            
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT   
//     APPLY TO LICENSEE.                                                
//
////////////////////////////////////////////////////////////////////////////////

/******************************************************************************
*
* @file main.c: Floating-Point Unit Arithmetic Demo
*
* @brief This demo performs various floating-point arithmetic operations and 
*        measures the processing time for each operation. It also checks if 
*        the Floating Point Unit (FPU) is enabled and provides information 
*        accordingly.
*
******************************************************************************/

#include <stdlib.h>
#include <stdint.h>
#include "bsp.h"
#include "riscv.h"
#include "clint.h"
#include "soc.h"
#include <math.h>
#include "print.h"


/*******************************************************************************
*
* @brief This function print processing time between two timestamps
*
* @param ts1 First timestamp.
* @param ts2 Second timestamp.
* @param s Character  
*
******************************************************************************/
void printPTime(uint64_t ts1, uint64_t ts2, char *s) {
    uint64_t rts;
    rts=ts2-ts1;
    bsp_printf("%s %d \n\n\r",s, rts );
}


/******************************************************************************
*
* @brief This main function demonstrates various floating-point calculations using
*        the FPU (Floating Point Unit). Additionally, it measures the clock cycles
*        taken for each calculation and prints the results along with the 
*        processing times.
*
******************************************************************************/
void main() {
    double i,j,k,l;
    double x,y,z;
    uint64_t timerCmp0, timerCmp1;

    bsp_init();
    bsp_printf("fpu demo ! \r\n");
#if (SYSTEM_CORES_0_FPU == 0) // If FPU extension is disabled in SOC
    bsp_printf("FPU is disabled, more processing time required for following calculation \r\n");
    bsp_printf("FPU is disabled, please expect bigger size compiled binary \r\n");
#endif

    /* Calculation */
    i=0.5820;      

    timerCmp0 = clint_getTime(BSP_CLINT);
    j=sin(i);
    timerCmp1 = clint_getTime(BSP_CLINT);
    printPTime(timerCmp0,timerCmp1,"sine processing clock cycles:");

    timerCmp0 = clint_getTime(BSP_CLINT);
    k=cos(i);
    timerCmp1 = clint_getTime(BSP_CLINT);
    printPTime(timerCmp0,timerCmp1,"cosine processing clock cycles:");

    timerCmp0 = clint_getTime(BSP_CLINT);
    l=tan(i);
    timerCmp1 = clint_getTime(BSP_CLINT);
    printPTime(timerCmp0,timerCmp1,"tangent processing clock cycles:");

    timerCmp0 = clint_getTime(BSP_CLINT);
    x=3828.1234;
    y=sqrt(x);
    timerCmp1 = clint_getTime(BSP_CLINT);
    printPTime(timerCmp0,timerCmp1,"square root processing clock cycles:");

    timerCmp0 = clint_getTime(BSP_CLINT);
    z=x/3.6789;
    timerCmp1 = clint_getTime(BSP_CLINT);
    printPTime(timerCmp0,timerCmp1,"division processing clock cycles:");
    bsp_printf("\r\n");
    bsp_printf("Input i (in rad): %f \r\n", i);
    bsp_printf("Sine result: %f \r\n", j);
    bsp_printf("Cosine result: %f \r\n", k);
    bsp_printf("Tangent result: %f \r\n", l);
    bsp_printf("Input x: %f \r\n", x);
    bsp_printf("Square root result: %f \r\n", y);
    bsp_printf("Divsion result: %f \r\n", z);
}
