# Use Efinity to build an Embedded System

After completing this lab, you will be able to:  
    
- Add additional IP to a hardware design
- Setup some of the compiler settings

# Steps
## Create Efinity Project
 
1. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
2. Click File > Create Project… to start the wizard. You will see Project Editor dialog box.
3. Click the Browse button of the Project location field of the New Project form, browse to C:/Efinity/Embedded/Lab5.
4. Enter Lab5 in the Project name field. Make sure that the Family field selected Trion and device field selected the T20Q144. Click Design tab.
        ![Project Name and Location entry](/image/lab5/1.png "Project Name and Location entry.")

5. Enter top_soc in the Top Module/Entity field. Select verilog_2k as the Target Language.
6. Click on the Add design file button and browse to the embedded-system-design-flow-master\sources\lab5 directory, select top.v.
        ![Project Name and Location entry](/image/lab5/2.png "Project Name and Location entry.")



## Add AXI4-LITE IP to the Project
1. In the Project pane, right-click the Design and select Add. Browse to the C:\Efinity\Embedded\sources\Lab5 directory, select axi4_lite.v and copy to project. Click open button.

## Creating the System Using the IP Manager

1.	In the Project pane, right-click the IP and click New IP to open IP Catalog.

    ![This is a alt text.](/image/lab5/3.png "This is a sample image.")

2.	Expand Installed IP > Efinix > Processors and Peripherals then select Sapphire SoC and click Next button.

    ![This is a alt text.](/image/lab5/4.png "This is a sample image.")

3.	 IP Configuration page will be opened. Enter the module name as *soc*. In SoC tab, deselect ‘Cache’ and set Frequency as 20 MHz.

4.	 Deselect include the external memory AXI interface option in Cache/Memory tab. On-Chip Ram size should be 4KB. 

5.	 In Debug tab select target board as custom and custom target board name must be *Quad RS232-HS* .
    ![This is a alt text.](/image/lab5/5.png "This is a sample image.")

6.	 On UART tab, only UART0 will be enabled and UART interrupt ID should be 1.

7.	 On I2C tab, deselect I2C 0 option.

8.	 On GPIO tab, deselect GPIO 0 option.

9.	 On AXI4 tab, select AXI Slave option and slave size must be 64KB.

10.	 And leave default other settings. After these configuration, ip will seen like this.
    ![This is a alt text.](/image/lab5/6.png "This is a sample image.")

11.	 Click generate and IP will be generated.




## Edit top.v Design File and Configure the Sapphire IP

1. Open top module and instantiate our AXI4-LITE signals.
2. Add these codes line 64.
    
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

3. Add these codes line 108.
        
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
        .leds(leds)  
        );

4. Add these codes line 175.

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

5. Add these codes line 52
    
        output [3:0] leds,

6. Save top.v module file.

## Create the lab5.pt.sdc Source.

1. Open Efinity Interface Designer.
        ![This is a alt text.](/image/lab5/7.png "This is a sample image.")

2. Right click to GPIO and select create block. Enter the instance name as

    **i.** system_uart_0_io_rxd and select mode as input and pull option weak pullup.  

    **ii.** system_uart_0_io_txd and select mode as output.                            

    **iii.** my_pll_refclk. Select mode as input and select Connection type as pll_clkin. Select Pull option weak pullup.  

    **iv.** system_spi_0_io_data_0. Select mode as inout. In the Input tab enter pin name as system_spi_0_io_data_0_read, select Register and enter clock name as io_systemClk. In the Output tab enter pin name as system_spi_0_io_data_0_write and enter clock name as io_systemClk. In the Output Enable tab enter pin name as system_spi_0_io_data_0_writeEnable and select register.  

    **v.** system_spi_0_io_data_1. Select mode as inout. In the Input tab enter pin name as system_spi_0_io_data_1_read, select Register and enter clock name as io_systemClk. In the Output tab enter pin name as system_spi_0_io_data_1_write, select Register and enter clock name as io_systemClk. In the Output Enable tab enter pin name as system_spi_0_io_data_1_writeEnable and select register.  

    **vi.** system_spi_0_io_sclk_write. Select mode as output. Select Register and enter clock name as io_systemClk.  

    **vii.** system_spi_0_io_ss. Select mode as output. Select Register and enter clock name as io_systemClk.
3. Right click to GPIO and select create bus. Enter the bus name as leds. Enter MSB as 3 and LSB as 0. Select mode as output.

4. Right click to PLL and select create block.For 20 MHz, enter the name as my_pll, PLL Resource must select PLL_BR0 and external clock must select External Clock 1. Click Automated clock calculation. Set input frequency as 50 MHz (for KuanTek Tri-Pi). Set clock 0 frequency as 20 MHz and enter the name as io_systemClk.

5. Click to enable reset pin and enter the name as my_pll_rstn. Click to enable locked pin and enter the name as io_asyncResetn. Click finish.


6. Right click to GPIO and select create block. Enter the Instance name as jtag_inst1. Select JTAG Resource JTAG_USER1.  
        ![This is a alt text.](/image/lab5/8.png "This is a sample image.")

7. Click show/hide GPIO Resource Assigner. Enter the resource part according to the datasheet [(KuanTek Tri-Pi User Guide)](link).
        ![This is a alt text.](/image/lab5/9.png "This is a sample image.")

8. Click right constraint and click add. In outflow folder, SDC file will be generated. Select {projectname}.pt.sdc,select copy to project and click open.

## Run Software Flow the Design

1. Click Synthesis under the dashboard for start software flow.

2. After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.
        ![This is a alt text.](/image/lab5/10.png "This is a sample image.")



## Opening the SDK Project with Efinity RISC-V IDE

1.	Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab5/embedded_sw. Click Launch.
2.	From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse lab5 > embedded_sw > soc and select bsp folder then click next. Select ‘axi4Demo’ and finish.    

3. Open main.c file in src folder and  add these codes to line 50.  

        #define MY_LED_IP_S00_AXI_SLV_REG0_OFFSET 0
        #define MY_LED_IP_S00_AXI_SLV_REG1_OFFSET 4
        #define MY_LED_IP_S00_AXI_SLV_REG2_OFFSET 8
        #define MY_LED_IP_S00_AXI_SLV_REG3_OFFSET 12

        #define MY_LED_IP_mWriteReg(Data,BaseAddress, RegOffset) \
        write_u32((u32)(Data),(BaseAddress) + (RegOffset))

4. Delete the all lines codes in main function.  
5. Add these codes to main function.

        MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG0_OFFSET );
        bsp_uDelay(5000000);
        MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG1_OFFSET );
        bsp_uDelay(5000000);
        MY_LED_IP_mWriteReg(0x0, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG2_OFFSET );
        bsp_uDelay(5000000);
        MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG3_OFFSET );
  
6. You can build your code with CTRL+B. If there is not exist error , our code is correct.
7. Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B.
8. Click run button and select run configuration.  
9. In the open window expand  GBD OpenOCD Debugging and select axi4Demo_trion and click Run. Program will be running.    

10. After the running the program, KuanTek Tri-Pi card should look like this.:  
        ![This is a alt text.](/image/lab5/11.jpg "This is a sample image.")


# 
# 
