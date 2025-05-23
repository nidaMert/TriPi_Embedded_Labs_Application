/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2022 Efinix Inc. All rights reserved.
//
// Description:
// Example top file for EfxSapphireSoc
//
// Language:  Verilog 2001
//
// ------------------------------------------------------------------------------
// REVISION:
//  $Snapshot: $
//  $Id:$
//
// History:
// 1.0 Initial Release. 
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module top_soc (
input		jtag_inst1_TCK,
input		jtag_inst1_TDI,
output		jtag_inst1_TDO,
input		jtag_inst1_SEL,
input		jtag_inst1_CAPTURE,
input		jtag_inst1_SHIFT,
output		system_spi_0_io_sclk_write,
output		system_spi_0_io_data_0_writeEnable,
input		system_spi_0_io_data_0_read,
output		system_spi_0_io_data_0_write,
output		system_spi_0_io_data_1_writeEnable,
input		system_spi_0_io_data_1_read,
output		system_spi_0_io_data_1_write,
output		system_spi_0_io_ss,
output		system_uart_0_io_txd,
input		system_uart_0_io_rxd,

//output      memoryCheckerPass,
output      my_pll_rstn,
input       my_pll_locked,
input       io_systemClk,
input       io_asyncResetn

);
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
wire 		reset;
wire		io_systemReset;
wire 	    io_memoryReset;				
wire [1:0]  io_ddrA_b_payload_resp=2'b00;


/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
assign reset 	= ~( io_asyncResetn & my_pll_locked);
assign my_pll_rstn 	= 1'b1;


/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////

soc soc_inst
(
.system_spi_0_io_sclk_write(system_spi_0_io_sclk_write),
.system_spi_0_io_data_0_writeEnable(system_spi_0_io_data_0_writeEnable),
.system_spi_0_io_data_0_read(system_spi_0_io_data_0_read),
.system_spi_0_io_data_0_write(system_spi_0_io_data_0_write),
.system_spi_0_io_data_1_writeEnable(system_spi_0_io_data_1_writeEnable),
.system_spi_0_io_data_1_read(system_spi_0_io_data_1_read),
.system_spi_0_io_data_1_write(system_spi_0_io_data_1_write),
.system_spi_0_io_data_2_writeEnable(),
.system_spi_0_io_data_2_read(),
.system_spi_0_io_data_2_write(),
.system_spi_0_io_data_3_writeEnable(),
.system_spi_0_io_data_3_read(),
.system_spi_0_io_data_3_write(),
.system_spi_0_io_ss(system_spi_0_io_ss),
.system_uart_0_io_txd(system_uart_0_io_txd),
.system_uart_0_io_rxd(system_uart_0_io_rxd),
.jtagCtrl_tck(jtag_inst1_TCK),
.jtagCtrl_tdi(jtag_inst1_TDI),
.jtagCtrl_tdo(jtag_inst1_TDO),
.jtagCtrl_enable(jtag_inst1_SEL),
.jtagCtrl_capture(jtag_inst1_CAPTURE),
.jtagCtrl_shift(jtag_inst1_SHIFT),
.jtagCtrl_update(),
.jtagCtrl_reset(),

.io_systemClk(io_systemClk),
.io_asyncReset(reset),
.io_systemReset(io_systemReset)		
);

endmodule

//////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2022 Efinix Inc. All rights reserved.
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
/////////////////////////////////////////////////////////////////////////////