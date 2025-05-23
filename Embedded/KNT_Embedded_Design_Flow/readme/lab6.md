# Use Efinity to build an Embedded System

After completing this lab, you will be able to:  
    
- Create an embedded system design using Efinity and Efinity RISC-V IDE flow
- Add Efinity standard IP in the Programmable Logic section
- Configure the Processing System
- Use Efinity RISC-V IDE to build a software project and verify the design functionality in hardware.


# Steps
## Copy Lab5 Project as Lab6
 
1. Open your previous lab folder.
2. Copy your ‘lab5’ project and paste as lab6. 
3. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
4. Click Open Project from File > Open Project and search lab6 project location.
5. Select lab5.xml file in lab6 folder. Click open.

## Add New AXI4-LITE IP to the Project
1. In the Project pane, right-click the Design and select Add. Browse to the C:\Efinity\Embedded\sources\Lab6 directory, select axi4_lite_led_button.v and copy to project. Click open button.
2. Delete old axi4_lite.v file.

## Edit top.v Design File
1. Open top module and instantiate our AXI4-LITE signals.
2. Delete this code line 52.

        output [3:0] leds,

3. And add these to instead.

        input   [1:0] buttons,
        output [3:0] leds,      

4. Delete the 109 to 132.
5. Add these codes line 109.

        axi4_lite_led_button led_button_axi4(
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
        .leds(leds),
        .buttons(buttons)
        );
        

## Update .sdc File with Inteface Designer.

1. Open interface designer.  

2. Add buttons bus. Enter their GPIO Resources.

   ![Project Name and Location entry](/image/lab6/1.png "Project Name and Location entry.")    

3. Then click check design. If there is no problem after checking , for generate constraint file click generate efinity constraint files button.

4. Click right constraint and click add. In outflow folder, SDC file will be generated. Select {projectname}.pt.sdc,select copy to project and click open. 
  

## Run Software Flow the Design

1. Click Synthesis under the dashboard for start software flow.

2. After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.  


## Opening the SDK Project with Efinity RISC-V IDE

1. Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab6/embedded_sw. Click Launch.

2. Delete old axi4Demo project.

3. From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse ,lab6 > embedded_sw > soc and select bsp folder then click next. Select ‘axi4Demo’ and finish.
        ![Project Name and Location entry](/image/lab6/2.png "Project Name and Location entry.")  


4. Delete the all lines codes in main function.

5. Add these codes to main function.

        while(1){  
		uint8_t status = read_u32(SYSTEM_AXI_A_BMB +   MY_LED_IP_S00_AXI_SLV_REG0_OFFSET);  
		write_u32 (status,SYSTEM_AXI_A_BMB +   MY_LED_IP_S00_AXI_SLV_REG1_OFFSET);  }

     ![Project Name and Location entry](/image/lab6/3.png "Project Name and Location entry.") 

6. You can build your code with CTRL+B. If there is not exist error , our code is correct.

7. Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B.

8. Click run button and select run configuration. 

9. In the open window expand  GBD OpenOCD Debugging and select axi4Demo_trion and click Run for verify the functionality.
10. Then you can press buttons for verify functionality.     

  

# 
# 
