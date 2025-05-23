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

module top_soc(
output   	my_pll_rstn,
input	    io_asyncResetn,
input		jtag_inst1_TCK,
input		jtag_inst1_TDI,
output		jtag_inst1_TDO,
input		jtag_inst1_SEL,
input		jtag_inst1_CAPTURE,
input		jtag_inst1_SHIFT,
input       jtag_inst1_UPDATE,
input       jtag_inst1_RESET,
 input           jtag_inst2_TCK,
 input           jtag_inst2_TDI,
 output          jtag_inst2_TDO,
 input           jtag_inst2_SEL,
 input           jtag_inst2_CAPTURE,
 input           jtag_inst2_SHIFT,
 input           jtag_inst2_UPDATE,
 input           jtag_inst2_RESET,
output		system_spi_0_io_sclk_write,
output		system_spi_0_io_data_0_writeEnable,
input		system_spi_0_io_data_0_read,
output		system_spi_0_io_data_0_write,
output		system_spi_0_io_data_1_writeEnable,
input		system_spi_0_io_data_1_read,
output		system_spi_0_io_data_1_write,
output		system_spi_0_io_data_2_writeEnable,
input		system_spi_0_io_data_2_read,
output		system_spi_0_io_data_2_write,
output		system_spi_0_io_data_3_writeEnable,
input		system_spi_0_io_data_3_read,
output		system_spi_0_io_data_3_write,
output		system_spi_0_io_ss,

output		system_uart_0_io_txd,
input		system_uart_0_io_rxd,



////////////////////////LEDS/////////////////////////////////////////////////
 output  reg [3:0]    result,
 output  wire [3:0]   ain,
 output  wire [3:0]   bin,
 output  wire         select,
/////////////////////////////////////////////////////////////////////////////

input       io_systemClk
//input       io_asyncResetn
);
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
wire 		reset;
 wire [3:0]         ain_vio;
 wire [3:0]         bin_vio;
 wire               select;
wire		io_systemReset;	
wire        userInterruptA;
////////////////AXI4-LITE SIGNALS////////////////////////////////////////////
 wire        io_peripheralReset;  
 wire        axi4Interrupt;  
 wire [7:0]  axi_awid;  
 wire [31:0]	axi_awaddr;  
 wire [7:0]	axi_awlen;  
 wire [2:0]	axi_awsize;  
 wire [1:0]	axi_awburst;  
 wire		axi_awlock;  
 wire [3:0]	axi_awcache;  
 wire [2:0]	axi_awprot;  
 wire [3:0]	axi_awqos;  
 wire [3:0]	axi_awregion;  
 wire		axi_awvalid;  
 wire		axi_awready;  
 wire [31:0]	axi_wdata;  
 wire [3:0]  axi_wstrb;  
 wire		axi_wvalid;  
 wire		axi_wlast;  
 wire		axi_wready;  
 wire [7:0]  axi_bid;  
 wire [1:0]  axi_bresp;  
 wire		axi_bvalid;  
 wire		axi_bready;  
 wire [7:0]	axi_arid;  
 wire [31:0]	axi_araddr;  
 wire [7:0]	axi_arlen;  
 wire [2:0]	axi_arsize;  
 wire [1:0]	axi_arburst;  
 wire		axi_arlock;   
 wire [3:0]	axi_arcache;  
 wire [2:0]	axi_arprot;  
 wire [3:0]	axi_arqos;  
 wire [3:0]	axi_arregion;  
 wire		axi_arvalid;  
 wire		axi_arready;  
 wire [7:0]	axi_rid;  
 wire [31:0]	axi_rdata;  
 wire [1:0]	axi_rresp;  
 wire		axi_rlast;  
 wire		axi_rvalid;  
 wire		axi_rready;  
/////////////////////////////////////////////////////////////////////////////
 edb_top edb_top_inst(
 .bscan_CAPTURE      ( jtag_inst2_CAPTURE ),
 .bscan_DRCK         ( jtag_inst2_DRCK ),
 .bscan_RESET        ( jtag_inst2_RESET ),
 .bscan_RUNTEST      ( jtag_inst2_RUNTEST ),
 .bscan_SEL          ( jtag_inst2_SEL ),
 .bscan_SHIFT        ( jtag_inst2_SHIFT ),
 .bscan_TCK          ( jtag_inst2_TCK ),
 .bscan_TDI          ( jtag_inst2_TDI ),
 .bscan_TMS          ( jtag_inst2_TMS ),
 .bscan_UPDATE       ( jtag_inst2_UPDATE ),
 .bscan_TDO          ( jtag_inst2_TDO ),
 .la0_clk            ( io_systemClk ),
 .la0_ain            ( ain ),
 .la0_bin            ( bin ),
 .la0_ain_vio        ( ain_vio ),
 .la0_bin_vio        ( bin_vio ),
 .la0_result         ( result ),
 .la0_select         ( select ),
 .la0_axi_awvalid    ( axi_awvalid ),
 .la0_axi_awready    ( axi_awready ),
 .la0_axi_wready     ( axi_wready ),
 .la0_axi_wvalid     ( axi_wvalid ),
 .vio0_clk           ( io_systemClk ),
 .vio0_ain_vio       ( ain_vio ),
 .vio0_bin_vio       ( bin_vio ),
 .vio0_select        ( select )
 );
/////////////////////AXI4-LITE IP DESIGN/////////////////////////////////////
 axi4_lite led_buton_axi4(  
 .S_AXI_ACLK(io_systemClk),  
 .S_AXI_ARESETN(~io_systemReset),  
 .S_AXI_AWADDR(axi_awaddr),  
 .S_AXI_AWPROT(axi_awprot),  
 .S_AXI_AWVALID(axi_awvalid),  
 .S_AXI_AWREADY(axi_awready),  
 .S_AXI_WDATA(axi_wdata),  
 .S_AXI_WSTRB(axi_wstrb),  
 .S_AXI_WVALID(axi_wvalid),  
 .S_AXI_WREADY(axi_wready),  
 .S_AXI_BRESP(axi_bresp),  
 .S_AXI_BVALID(axi_bvalid),  
 .S_AXI_BREADY(axi_bready),  
 .S_AXI_ARADDR(axi_araddr),  
 .S_AXI_ARPROT(axi_arprot),  
 .S_AXI_ARVALID(axi_arvalid),  
 .S_AXI_ARREADY(axi_arready),  
 .S_AXI_RDATA(axi_rdata),  
 .S_AXI_RRESP(axi_rresp),  
 .S_AXI_RVALID(axi_rvalid),  
 .S_AXI_RREADY(axi_rready),  
 .ain(ain),
 .bin(bin)
 );
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
//assign reset 	= ~( io_asyncResetn & my_pll_locked);
assign reset 	= ~(io_asyncResetn);
assign my_pll_rstn 	= 1'b1;


 /////////////////////////////////////////////////////////////////////////
soc u_soc(
.system_spi_0_io_sclk_write(system_spi_0_io_sclk_write),
.system_spi_0_io_data_0_writeEnable(system_spi_0_io_data_0_writeEnable),
.system_spi_0_io_data_0_read(system_spi_0_io_data_0_read),
.system_spi_0_io_data_0_write(system_spi_0_io_data_0_write),
.system_spi_0_io_data_1_writeEnable(system_spi_0_io_data_1_writeEnable),
.system_spi_0_io_data_1_read(system_spi_0_io_data_1_read),
.system_spi_0_io_data_1_write(system_spi_0_io_data_1_write),
.system_spi_0_io_data_2_writeEnable(system_spi_0_io_data_2_writeEnable),
.system_spi_0_io_data_2_read(system_spi_0_io_data_2_read),
.system_spi_0_io_data_2_write(system_spi_0_io_data_2_write),
.system_spi_0_io_data_3_writeEnable(system_spi_0_io_data_3_writeEnable),
.system_spi_0_io_data_3_read(system_spi_0_io_data_3_read),
.system_spi_0_io_data_3_write(system_spi_0_io_data_3_write),
.system_spi_0_io_ss(system_spi_0_io_ss),

.system_uart_0_io_txd(system_uart_0_io_txd),
.system_uart_0_io_rxd(system_uart_0_io_rxd),


.jtagCtrl_tck(jtag_inst1_TCK),
.jtagCtrl_tdi(jtag_inst1_TDI),
.jtagCtrl_tdo(jtag_inst1_TDO),
.jtagCtrl_enable(jtag_inst1_SEL),
.jtagCtrl_capture(jtag_inst1_CAPTURE),
.jtagCtrl_shift(jtag_inst1_SHIFT),
.jtagCtrl_update(jtag_inst1_UPDATE),
.jtagCtrl_reset(jtag_inst1_RESET),

.userInterruptA(userInterruptA),
.io_systemClk(io_systemClk),
.io_asyncReset(reset),
.io_systemReset(io_systemReset),

///////////////AXI4-LITE SIGNALS FOR Sapphire SoC////////////////////////////
 .axiA_awvalid(axi_awvalid),  
 .axiA_awready(axi_awready),  
 .axiA_awaddr(axi_awaddr),  
 .axiA_awid(),  
 .axiA_awregion(),  
 .axiA_awlen(),  
 .axiA_awsize(),  
 .axiA_awburst(),  
 .axiA_awlock(),  
 .axiA_awcache(),  
 .axiA_awqos(),  
 .axiA_awprot(axi_awprot),  
 .axiA_wvalid(axi_wvalid),  
 .axiA_wready(axi_wready),  
 .axiA_wdata(axi_wdata),  
 .axiA_wstrb(axi_wstrb),  
 .axiA_wlast(),  
 .axiA_bvalid(axi_bvalid),  
 .axiA_bready(axi_bready),   
 .axiA_bid({8{1'b0}}),  
 .axiA_bresp(axi_bresp),  
 .axiA_arvalid(axi_arvalid),  
 .axiA_arready(axi_arready),  
 .axiA_araddr(axi_araddr),  
 .axiA_arid(),  
 .axiA_arregion(),  
 .axiA_arlen(),  
 .axiA_arsize(),  
 .axiA_arburst(),  
 .axiA_arlock(),  
 .axiA_arcache(),  
 .axiA_arqos(),  
 .axiA_arprot(axi_arprot),  
 .axiA_rvalid(axi_rvalid),  
 .axiA_rready(axi_rready),  
 .axiA_rdata(axi_rdata),  
 .axiA_rid({8{1'b0}}),  
 .axiA_rresp(axi_rresp),  
 .axiA_rlast(1'b1),  
 .axiAInterrupt(1'b0)  

/////////////////////////////////////////////////////////////////////////////

);
 always@(posedge io_systemClk)begin
 if(io_systemReset)begin
 result = 0;
 end
 else if (select) begin
 result <= ain_vio + bin_vio;
 end
 else begin
 result <= ain + bin;
 end
 end

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