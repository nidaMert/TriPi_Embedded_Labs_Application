# Adding Custom IP to the System

After completing this lab, you will be able to:  
    
- Modify the functionality of the IP
- Use RISC-V SDK to create an apb3Demo project
- Run the test application on the board and hence verify hardware functionality

# Steps
## Copy Lab2 Project as Lab3
 
1. Open your previous lab folder.
2. Copy your ‘Lab2’ project and paste as Lab3. 
3. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
4. Click Open Project from File > Open Project and search lab3 project location.
5. Select Lab2.xml file in lab3 folder. Click open. 

    ![Project Name and Location entry](/image/lab3/1.png "Project Name and Location entry.")


## Edit top.v and apb3_gpio Design Files 

1.	Open apb3_gpio.v file . 
2.	Remove the comment from line 25 to line 148 and add comments between line 150 to line 332.
3.	Open top.v file and add these codes to top.v file :
    + Change apb3_slave module name to apb3_gpio. (Line 84.)  
    + Add APB3 module (Lines 85-86):  
        + .leds_control(leds),  
        + .butons(butons),  
        + and change .resetn(~io_systemReset)   —>  .resetn(1'b1)

    ![This is a alt text.](/image/lab3/2.png "This is a sample image.")

## Run Software Flow the Design

1.	Click Synthesis under the dashboard for start software flow.

2.	After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.  


## Opening the SDK Project with Efinity RISC-V IDE

1.	Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab3/embedded_sw. Click Launch.
2.  Delete old abp3Demo project.
3.	From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse ,Lab3>embedded_sw > soc and select bsp folder then click next. Select ‘apb3Demo’ and finish.  
![This is a alt text.](/image/lab3/3.png "This is a sample image.")
4.	Open main.c file in src folder and  add these codes to line 43.  

        // Led Address Offset (R/W)
        #define LED_1 		0x1
        #define LED_2		0x2
        #define LED_3		0x3
        #define LED_4		0x4
        // Button Address Offset (R/W)
        #define BTN_1 		0x1
        #define BTN_2 		0x2
        #define BTN_REG 		0x4
        #define LED_REG 		0x0

5.	Turn comment lines void error_state function.  
6.	Turn comment lines all codes in main function.     
7.	Add these codes to main function.  

        bsp_init();
        while (1){	 

        if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == (BTN_2 + BTN_1) ){
                write_u32(0x8,IO_APB_SLAVE_0_INPUT + LED_REG);}
            if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == BTN_1 ){
                write_u32(0x2,IO_APB_SLAVE_0_INPUT + LED_REG);}
            if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == BTN_2 ){
                write_u32(0x1,IO_APB_SLAVE_0_INPUT + LED_REG);}
            if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == 0 ){
                write_u32(0x4,IO_APB_SLAVE_0_INPUT + LED_REG);}

        } 

8.	After this step main codes should be shown like this :      
![This is a alt text.](/image/lab3/4.png "This is a sample image.")  

9.	You can build your code with CTRL+B. If there is not exist error , our code is correct.
10.  Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B.

11.	Click run button and select run configuration.  

12.	In the open window expand  GBD OpenOCD Debugging and select apb3Demo_trion and click Run. Program will be running. 
13.	Compare the functionality of the program with the given truth table.  

    The T20Q144 bank 2A I/O signals connected to these switches have a pull-up resistor. When you
    press the switch, the signal drives low, indicating user input. You can configure working options of leds your choice.  
![This is a alt text.](/image/lab3/5.png "This is a sample image.")


# 
# 
