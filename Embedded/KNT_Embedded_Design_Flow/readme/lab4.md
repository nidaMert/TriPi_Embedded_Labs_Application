# Use Efinity to build an Embedded System

After completing this lab, you will be able to:  
    
- Add additional IP to a hardware design
- Setup some of the compiler settings

# Steps
## Copy Lab3 Project as Lab4
 
1. Open your previous lab folder.
2. Copy your ‘Lab3’ project and paste as Lab4. 
3. Open Efinity by selecting Start > Efinity 2023.1 > Efinity 2023.1
4. Click Open Project from File > Open Project and search lab4 project location.
5. Select lab2.xml file in lab4 folder. Click open.

      ![This is a alt text.](/image/lab4/1.png "This is a sample image.")  

## Run Software Flow the Design

1. Click Synthesis under the dashboard for start software flow.

2. After the generated bitstream files, open programmer from tools toolbar. Connect KuanTek Tri-Pi with USB to your computer and click refresh. Device will be connect automatically.Then on image menu, click ‘select image file’ and select {projectname}.bit file. Programming mode will be JTAG and JTAG options will be default. Click start program. You can check programming process from console.    
        ![This is a alt text.](/image/lab4/2.png "This is a sample image.")  

## Opening the SDK Project with Efinity RISC-V IDE

1. Open Efinity RISC-V IDE program. Click browse and select project folder as C:/Efinity/Embedded/Lab4/embedded_sw. Click Launch.
2. Delete old apb3Demo project.
3. From project explorer click import project. Efinix Projects > Efinix Makefile Project> BSP location  and click browse ,lab4 > embedded_sw > soc  and select bsp folder then click next. Select ‘apb3Demo’ and finish.    
        ![This is a alt text.](/image/lab4/3.png "This is a sample image.")
4. Open main.c file in src folder and  add these codes to line 43 and 52.  

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

5. Turn comment lines void error_state function.
6. Turn comment lines all codes in main function.  
7. Add these codes to main function.

        bsp_init();
        uint8_t dat;
        bsp_printf("LEDS OFF\r\n");
        while(1){
                while(uart_readOccupancy(BSP_UART_TERMINAL)){
                        dat=uart_read(BSP_UART_TERMINAL);
                        if(dat==0x30){
                                write_u32(0x0,IO_APB_SLAVE_0_INPUT + LED_REG);
                                bsp_uDelay(5000);
                                bsp_printf("LEDS OFF\r\n");}
                        if(dat==0x31){
                                write_u32(0x1,IO_APB_SLAVE_0_INPUT + LED_REG);
                                bsp_uDelay(5000);
                                bsp_printf("LED1 ON\r\n");}
                        if(dat==0x32){
                                write_u32(0x2,IO_APB_SLAVE_0_INPUT + LED_REG);
                                bsp_uDelay(5000);
                                bsp_printf("LED2 ON\r\n");}
                        if(dat==0x33){
                                write_u32(0x4,IO_APB_SLAVE_0_INPUT + LED_REG);
                                bsp_uDelay(5000);
                                bsp_printf("LED3 ON\r\n");}
                        if(dat==0x34){
                                write_u32(0x8,IO_APB_SLAVE_0_INPUT + LED_REG);
                                bsp_uDelay(5000);
                                bsp_printf("LED4 ON\r\n");}
            }
        }

    
8. After this step main codes should be shown like this :    
        ![This is a alt text.](/image/lab4/4.png "This is a sample image.")

9. You can build your code with CTRL+B. If there is not exist error , our code is correct.
10. Then open ftdi.cfg in folder /Embedded\Lab2\embedded_sw\soc\bsp\efinix\EfxSapphireSoc\openocd and change value of vid_pid, 0x6010 to 0x6011. Then right click uartEchoDemo on Project Explorer and click Clean Project. After that rebuild project with CTRL+B.

11. Open terminal and select Serial Terminal on choose terminal menu.  
Terminal settings :

        Serial Port = Serial port is the defined communication port on your computer.  
        Baud Rate = 115200  
        Data Size = 8  
        Parity = None  
        Stop bits = 1  
        Encoding = Default  

12. Click run button and select run configuration.  
        ![This is a alt text.](/image/lab4/5.png "This is a sample image.")
13. In the open window expand  GBD OpenOCD Debugging and select apb3Demo_trion and click Run. Program will be running. 
14. You can control the leds with 0-1-2-3-4 numbers in the keyboard. Terminal output must be like :  
![This is a alt text.](/image/lab4/6.png "This is a sample image.")


# 
# 
