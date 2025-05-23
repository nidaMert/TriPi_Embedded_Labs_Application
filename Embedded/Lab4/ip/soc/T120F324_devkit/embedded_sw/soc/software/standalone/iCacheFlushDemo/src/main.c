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

/*******************************************************************************
*
* @file main.c : iCacheFlushDemo
*
* @brief  This demo illustrates how to invalidate the instruction cache. 
*         The instruction cache invalidation is critical to ensure the coherency between the
*         cache and the main memory, ensuring that the CPU fetches the most up-to-date instructions.
*
******************************************************************************/

#include <string.h>
#include "bsp.h"

const char* funcA(){
    return "funcA\r\n";
}

const char* funcB(){
    return "funcB\r\n";
}

uint32_t array[64]  __attribute__ ((aligned (64)));

/*******************************************************************************
*
* @brief This main function demonstrate function pointer behavior after memcpy operations.
*        It uses memcpy to copy functions into an array and checks the behavior of a function pointer.
*
******************************************************************************/
void main() {
    const char* (*funcPtr)() = (const char* (*)())array;
    memcpy(array, funcA, 64*4);
    asm("fence.i"); //Just to be sure the cache is not getting some preloaded values
    bsp_printf("Expected 'funcA', Obtained : ");
    bsp_putString(funcPtr()); //funcA expected

    memcpy(array, funcB, 64*4);
    bsp_printf("Expected 'funcA', Obtained : ");
    bsp_putString(funcPtr()); //funcA expected, as no cache flush was done

    asm("fence.i"); // flush instruction cache
    bsp_printf("Expected 'funcB', Obtained : ");
    bsp_putString(funcPtr()); //funcB expected, as we flushed the cache, and had the funcB copied
    bsp_printf("Test Complete\r\n");
}
