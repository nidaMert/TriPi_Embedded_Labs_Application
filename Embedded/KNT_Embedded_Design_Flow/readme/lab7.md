# Debugging Using Open Debugger

After completing this lab, you will be able to:  
    
- Add a VIO core in the design
- Use a VIO core to inject stimulus to the design and monitor the response
- Add an ILA core in Efinity
- Perform hardware debugging using the Open Debugger


# Steps
## Copy Lab5 Project as Lab7
 
1. Open your previous lab folder.
2. Copy your ‘lab5’ project and paste as lab7. 
3. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
4. Click Open Project from File > Open Project and search lab7 project location.
5. Select lab5.xml file in lab7 folder. Click open.



## Add VIO/ILA Ports

1. Open top.v design file.
2. Add these codes to line 31.

        input           jtag_inst2_TCK,
        input           jtag_inst2_TDI,
        output          jtag_inst2_TDO,
        input           jtag_inst2_SEL,
        input           jtag_inst2_CAPTURE,
        input           jtag_inst2_SHIFT,
        input           jtag_inst2_UPDATE,
        input           jtag_inst2_RESET,

3. Delete these codes line 60.

        output  [3:0] leds,

4. Add these codes line 60.

        output  reg [3:0]    result,
        output  wire [3:0]   ain,
        output  wire [3:0]   bin,
        output  wire         select,

5. Add these codes line 71.

        wire [3:0]         ain_vio;
        wire [3:0]         bin_vio;
        wire               select;

6. Delete these codes in line 144.

        .leds(leds),
        

7. And add these codes line 144.

        .ain(ain),
        .bin(bin)

8. Then add these codes line 235. (Before the endmodule)

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

9. Save the file and open axi4_lite design file.
10. Delete lines 18-21 and replace with these codes.

        output wire  [3:0]   ain,
        output wire  [3:0]   bin,
        output wire          select,

11. Delete lines:

+ 113, (slv_reg3 registers)

     ![Project Name and Location entry](/image/lab7/1.png "Project Name and Location entry.")

+ 229, (slv_reg3< =0)

     ![Project Name and Location entry](/image/lab7/2.png "Project Name and Location entry.")

+ 256, (2’h3 case) 

     ![Project Name and Location entry](/image/lab7/3.png "Project Name and Location entry.")

+ 260, ( slv_reg3 <= slv_reg3;)

     ![Project Name and Location entry](/image/lab7/4.png "Project Name and Location entry.")

+ 371, ( 2'h3 : reg_data_out <= slv_reg3;), 

     ![Project Name and Location entry](/image/lab7/5.png "Project Name and Location entry.")



12. Delete these line 398:

    ![Project Name and Location entry](/image/lab7/6.png "Project Name and Location entry.")

13. Add these line 397.

        assign ain          = slv_reg0[3:0];
        assign bin          = slv_reg1[3:0];
        assign select       = slv_reg2 ;

## Set Debug Settings

1. Open debugger.  
        ![Project Name and Location entry](/image/lab7/7.png "Project Name and Location entry.")

2. Add ILA core and add these probes like below.  
        ![Project Name and Location entry](/image/lab7/8.png "Project Name and Location entry.") 

3. Add VIO core and add these sources like below.  
        ![Project Name and Location entry](/image/lab7/9.png "Project Name and Location entry.")  

4. Then click generate and close window.

## Add Debug Design File and Edit top.v File.

1. Click right Design then add , select debug_top.v file from source folder. Select Copy to Project and click open.  
        ![Project Name and Location entry](/image/lab7/11.png "Project Name and Location entry.") 

2. Open top.v and add these codes line 120.(These codes generated from debugger and it is included debug_TEMPLATE.v file.)  

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

3. Code must be look like this.  
        ![Project Name and Location entry](/image/lab7/10.png "Project Name and Location entry.") 

## Update .sdc File with Inteface Designer.

1. Open interface designer and right click JTAG User Tap and create block and select USER2.   
        ![Project Name and Location entry](/image/lab7/13.png "Project Name and Location entry.") 

2. Delete leds pins. 

3. Then click check design. If there is no problem after checking , for generate constraint file click generate efinity constraint files button.  
        ![Project Name and Location entry](/image/lab7/14.png "Project Name and Location entry.")

4. Click right constraint and click add. In outflow folder, SDC file will be generated. Select {projectname}.pt.sdc,select copy to project and click open. 

## Run Software Flow the Design

1. Click Synthesis under the dashboard for start software flow. If you get *instantiating unkown module 'soc'* error you have to regenerate soc IP.

2. After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.  

## Debug the Hardware

1. After generated bitstream open Open Debugger and load bit file in configuration window. Then select USER2 and connect debugger.   
        ![Project Name and Location entry](/image/lab7/15.png "Project Name and Location entry.")  

2. In the Vio tab, our source bits should be selected as 0 and you can give any number you want for ain_vio and bin_vio.
        ![Project Name and Location entry](/image/lab7/16.png "Project Name and Location entry.")    
3. In ila tab , add select bit and trigger value should be Rise(0-to-1) and click run.   
        ![Project Name and Location entry](/image/lab7/17.png "Project Name and Location entry.")      

4. After clicking run , go vio tab and change select 0 to 1. Output signal wave should be like this.   
        ![Project Name and Location entry](/image/lab7/18.png "Project Name and Location entry.")      
5. After then, close gtkwave.

## Opening the SDK Project with Efinity RISC-V IDE

1. Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab7/embedded_sw. Click Launch.
2. Delete old axi4Demo project.
3. From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse ,lab7 > embedded_sw > soc and select bsp folder then click next. Select ‘axi4Demo’ and finish.  

4. Open main.c file in src folder and Delete lines between 131-133.  
        ![Project Name and Location entry](/image/lab7/19.png "Project Name and Location entry.")        

5. Then copy these codes.

         u32 data;
	        bsp_init();
	        while(1){
	        MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG0_OFFSET);
	        MY_LED_IP_mWriteReg(0x2, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG1_OFFSET);
	}
6. Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B

6. Run the program. After the running , terminate program from console.Turn back to debugger and connect debugger again. On ILA tab , change trigger value of select as 0, add *axi_wready* signals and value should be 1. On vio tab, first select bit set as 1.When select bit go from 1 to 0 then ila will be triggered.

5. Then go VIO tab , change value of select 1. Then click Run. 
        ![Project Name and Location entry](/image/lab7/21.png "Project Name and Location entry.") 
        ![Project Name and Location entry](/image/lab7/22.png "Project Name and Location entry.") 

6. After the running, change value of select 1 to 0. Then trigger will be triggered. Open waveform.vcd file and output should be like this :
        ![Project Name and Location entry](/image/lab7/20.png "Project Name and Location entry.") 
  

# 
# 
