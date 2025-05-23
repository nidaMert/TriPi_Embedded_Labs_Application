///////////////////////////////////////////////////////////////////////////////////
//  MIT License
//  
//  Copyright (c) 2023 SaxonSoc contributors
//  
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
///////////////////////////////////////////////////////////////////////////////////

/******************************************************************************
*
* @file main.c: memTest
*
* @brief  This demo performs memory test on the external memory module and reports
*         the results on a UART terminal. 
*
******************************************************************************/

#include <stdint.h>
#include "bsp.h"
#include "io.h"

//memory start address
#define mem ((volatile uint32_t*)0x00010000) 
#define MAX_WORDS (4 * 1024 * 1024)

/******************************************************************************
*
* @brief  This main function performs a memory test by writing ascending values 
*         to a memory array and then reading and checking each value. 
*         If a mismatch is found between the expected and read values, 
*         it prints an error message and enters an infinite loop.
*
******************************************************************************/
void main() {

    bsp_printf("memory test ! \r\n");
    for(int i=0;i<MAX_WORDS;i++) mem[i] = i;

    for(int i=0;i<MAX_WORDS;i++) {
        if (mem[i] != i) {
        bsp_printf("Failed at address 0x%x with value of 0x%x \r\n", i, mem[i]);
        while(1){
            }
        }
    }
    bsp_printf("Passed \r\n");
    while(1){}
}

