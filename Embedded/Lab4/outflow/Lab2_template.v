
// Efinity Top-level template
// Version: 2024.1.163
// Date: 2025-04-04 20:27

// Copyright (C) 2013 - 2024 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as C:\Efinity\Embedded\Lab4\Lab2.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  Lab2
//     #4)  Insert design content.


module Lab2
(
  (* syn_peri_port = 0 *) input [1:0] butons,
  (* syn_peri_port = 0 *) input my_pll_refclk,
  (* syn_peri_port = 0 *) input system_spi_0_io_data_0_read,
  (* syn_peri_port = 0 *) input system_spi_0_io_data_1_read,
  (* syn_peri_port = 0 *) input system_uart_0_io_rxd,
  (* syn_peri_port = 0 *) input io_asyncResetn,
  (* syn_peri_port = 0 *) input io_systemClk,
  (* syn_peri_port = 0 *) input jtag_inst1_CAPTURE,
  (* syn_peri_port = 0 *) input jtag_inst1_DRCK,
  (* syn_peri_port = 0 *) input jtag_inst1_RESET,
  (* syn_peri_port = 0 *) input jtag_inst1_RUNTEST,
  (* syn_peri_port = 0 *) input jtag_inst1_SEL,
  (* syn_peri_port = 0 *) input jtag_inst1_SHIFT,
  (* syn_peri_port = 0 *) input jtag_inst1_TCK,
  (* syn_peri_port = 0 *) input jtag_inst1_TDI,
  (* syn_peri_port = 0 *) input jtag_inst1_TMS,
  (* syn_peri_port = 0 *) input jtag_inst1_UPDATE,
  (* syn_peri_port = 0 *) output [3:0] leds,
  (* syn_peri_port = 0 *) output system_spi_0_io_data_0_write,
  (* syn_peri_port = 0 *) output system_spi_0_io_data_0_writeEnable,
  (* syn_peri_port = 0 *) output system_spi_0_io_data_1_write,
  (* syn_peri_port = 0 *) output system_spi_0_io_data_1_writeEnable,
  (* syn_peri_port = 0 *) output system_spi_0_io_sclk_write,
  (* syn_peri_port = 0 *) output system_spi_0_io_ss,
  (* syn_peri_port = 0 *) output system_uart_0_io_txd,
  (* syn_peri_port = 0 *) output my_pll_rstn,
  (* syn_peri_port = 0 *) output jtag_inst1_TDO
);


endmodule

