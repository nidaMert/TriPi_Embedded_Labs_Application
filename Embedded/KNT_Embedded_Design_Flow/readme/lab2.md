# Use Efinity to build an Embedded System

After completing this lab, you will be able to:  
    
- Add additional IP to a hardware design
- Setup some of the compiler settings

# Steps
## Create Efinity Project 
 
1. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
2. Click File > Create Project… to start the wizard. You will see Project Editor dialog box.
3. Click the Browse button of the Project location field of the New Project form, browse to C:/Efinity/Embedded/Lab2.
4. Enter lab2 in the Project name field. Make sure that the Family field selected Trion and device field selected the T20Q144. Click Design tab.
        ![Project Name and Location entry](/image/lab2/1.png "Project Name and Location entry.")

5. Enter top_soc in the Top Module/Entity field. Select verilog_2k as the Target Language.
6. Click on the Add design file button and browse to the embedded-system-design-flow-master\sources\lab2 directory, select top.v and select copy to project. Then click OK and create project.
        ![Project Name and Location entry](/image/lab2/2.png "Project Name and Location entry.")

## Creating the System Using the IP Manager

1.	In the Project pane, right-click the IP and click New IP to open IP Catalog.

    ![This is a alt text.](/image/lab2/4.png "This is a sample image.")

2.	Expand Installed IP > Efinix > Processors and Peripherals then select Sapphire SoC and click Next button.

    ![This is a alt text.](/image/lab2/5.png "This is a sample image.")

3.	 IP Configuration page will be opened. Enter the module name as *soc*. In SoC tab, deselect ‘Cache’ and set Frequency as 20 MHz.

4.	 Deselect include the external memory AXI interface option in Cache/Memory tab. On-Chip Ram size should be 4KB. 

5.	 In Debug tab select target board as custom and custom target board name must be *Quad RS232-HS* .
    ![This is a alt text.](/image/lab1/5_a.png "This is a sample image.")

6.	 On UART tab, only UART0 will be enabled and UART interrupt ID should be 1.

7.	 On I2C tab, deselect I2C 0 option.

8.	 On GPIO tab, deselect GPIO 0 option.

9.	 On AXI4 tab, deselect AXI Slave option.

10.	 And leave default other settings. After these configuration, ip will seen like this.
    ![This is a alt text.](/image/lab1/5.png "This is a sample image.")

11.	 Click generate and IP will be generated.

## Add APB3 IP to the Project

1.	In the Project pane, right-click the Design and select Add. Browse to the C:\Efinity\Embedded\sources\Lab2 directory, select apb3_gpio.v design file and copy to project. Click open button.  
![This is a alt text.](/image/lab2/3.png "This is a sample image.")

## Create the lab2.pt.sdc source

1. Open Efinity Interface Designer.

    ![This is a alt text.](/image/lab2/7.png "This is a sample image.")

2. Right click to GPIO and select create block. Enter the instance name as

    **i.** system_uart_0_io_rxd and select mode as input and pull option weak pullup.  

    **ii.** system_uart_0_io_txd and select mode as output.                            

    **iii.** my_pll_refclk. Select mode as input and select Connection type as pll_clkin. Select Pull option weak pullup.  

    **iv.** system_spi_0_io_data_0. Select mode as inout. In the Input tab enter pin name as system_spi_0_io_data_0_read, select Register and enter clock name as io_systemClk. In the Output tab enter pin name as system_spi_0_io_data_0_write and enter clock name as io_systemClk. In the Output Enable tab enter pin name as system_spi_0_io_data_0_writeEnable and select register.  

    **v.** system_spi_0_io_data_1. Select mode as inout. In the Input tab enter pin name as system_spi_0_io_data_1_read, select Register and enter clock name as io_systemClk. In the Output tab enter pin name as system_spi_0_io_data_1_write, select Register and enter clock name as io_systemClk. In the Output Enable tab enter pin name as system_spi_0_io_data_1_writeEnable and select register.  

    **vi.** system_spi_0_io_sclk_write. Select mode as output. Select Register and enter clock name as io_systemClk.  

    **vii.** system_spi_0_io_ss. Select mode as output. Select Register and enter clock name as io_systemClk.

3. Right click to GPIO and select create bus. Enter the bus name as butons. Enter MSB as 1 and LSB as 0. Select mode as input and Pull Option as weak pullup.

4. Right click to GPIO and select create bus. Enter the bus name as leds. Enter MSB as 3 and LSB as 0. Select mode as output.


5. Right click to PLL and select create block.For 20 MHz, enter the name as my_pll, PLL Resource must select PLL_BR0 and external clock must select External Clock 1. Click Automated clock calculation. Set input frequency as 50 MHz (for KuanTek Tri-Pi). Set clock 0 frequency as 20 MHz and enter the name as io_systemClk.

6. Click to enable reset pin and enter the name as my_pll_rstn. Click to enable locked pin and enter the name as io_asyncResetn. Click finish.


7.	Right click to GPIO and select create block. Enter the Instance name as jtag_inst1. Select JTAG Resource JTAG_USER1.  
![This is a alt text.](/image/lab2/8.png "This is a sample image.")

8.	Click show/hide GPIO Resource Assigner. Enter the resource part according to the datasheet [(KuanTek Tri-Pi User Guide)](link).
![This is a alt text.](/image/lab2/9.png "This is a sample image.")

9.	Save and check the design then click Generate Efinity constraint file.  

    ![This is a alt text.](/image/lab2/10.png "This is a sample image.")

10.	Click right constraint and click add. In outflow folder, SDC file will be generated. Select {projectname}.pt.sdc,select copy to project and click open.

## Run Software Flow the Design

1. Click Synthesis under the dashboard for start software flow.

2. After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.  


## Opening the SDK Project with Efinity RISC-V IDE

1.	Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab2/embedded_sw. Click Launch.
2.	From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse ,embedded_sw > soc  and select bsp folder then click next. Select ‘apb3Demo’ and finish.  
![This is a alt text.](/image/lab2/11.png "This is a sample image.")
3.	Open main.c file in src folder and  add these codes to line 63 and 64.  

        cfg0.lfsr_stop = 0;  
        apb3_ctrl_write(APB0, &cfg0);
4.	Add while loop to line 61-75 and codes always be in loop. Main is shown be like this : 
![This is a alt text.](/image/lab2/12.png "This is a sample image.")  

5.	Expand  src folder and open main.c file. This is our main code. You can build your code with CTRL+B. If there is not exist error , our code is correct.
6. Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B.
![This is a alt text.](/image/lab2/13.png "This is a sample image.")  
7.	Open terminal and select Serial Terminal on choose terminal menu.  
Terminal settings :

        Serial Port = Serial port is the defined communication port on your computer.  
        Baud Rate = 115200  
        Data Size = 8  
        Parity = None  
        Stop bits = 1  
        Encoding = Default  

8. Click run button and select run configuration.  

9. In the open window expand  GBD OpenOCD Debugging and select apb3Demo_trion and click Run. Program will be running. 
10. Terminal output must be like :  
![This is a alt text.](/image/lab2/14.png "This is a sample image.")


# 
# 
