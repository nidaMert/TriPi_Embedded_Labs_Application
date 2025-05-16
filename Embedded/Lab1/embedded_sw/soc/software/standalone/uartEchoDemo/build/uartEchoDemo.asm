
build/uartEchoDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	df818193          	addi	gp,gp,-520 # f9000df8 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	a2818113          	addi	sp,gp,-1496 # f9000820 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	52850513          	addi	a0,a0,1320 # f9000534 <_data>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	52058593          	addi	a1,a1,1312 # f9000534 <_data>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f9000614 <__bss_start>
	bgeu a1, a2, 2f
f9000020:	00c5fc63          	bgeu	a1,a2,f9000038 <init+0x30>
1:
	lw t0, (a0)
f9000024:	00052283          	lw	t0,0(a0)
	sw t0, (a1)
f9000028:	0055a023          	sw	t0,0(a1)
	addi a0, a0, 4
f900002c:	00450513          	addi	a0,a0,4
	addi a1, a1, 4
f9000030:	00458593          	addi	a1,a1,4
	bltu a1, a2, 1b
f9000034:	fec5e8e3          	bltu	a1,a2,f9000024 <init+0x1c>
2:

	/* Clear bss section */
	la a0, __bss_start
f9000038:	81c18513          	addi	a0,gp,-2020 # f9000614 <__bss_start>
	la a1, _end
f900003c:	82018593          	addi	a1,gp,-2016 # f9000618 <_end>
	bgeu a0, a1, 2f
f9000040:	00b57863          	bgeu	a0,a1,f9000050 <init+0x48>
1:
	sw zero, (a0)
f9000044:	00052023          	sw	zero,0(a0)
	addi a0, a0, 4
f9000048:	00450513          	addi	a0,a0,4
	bltu a0, a1, 1b
f900004c:	feb56ce3          	bltu	a0,a1,f9000044 <init+0x3c>
2:

#ifndef NO_LIBC_INIT_ARRAY
	call __libc_init_array
f9000050:	010000ef          	jal	ra,f9000060 <__libc_init_array>
#endif

	call main
f9000054:	494000ef          	jal	ra,f90004e8 <main>

f9000058 <mainDone>:
mainDone:
    j mainDone
f9000058:	0000006f          	j	f9000058 <mainDone>

f900005c <_init>:


	.globl _init
_init:
    ret
f900005c:	00008067          	ret

Disassembly of section .text:

f9000060 <__libc_init_array>:
f9000060:	ff010113          	addi	sp,sp,-16
f9000064:	00812423          	sw	s0,8(sp)
f9000068:	01212023          	sw	s2,0(sp)
f900006c:	00000417          	auipc	s0,0x0
f9000070:	4c840413          	addi	s0,s0,1224 # f9000534 <_data>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	4c090913          	addi	s2,s2,1216 # f9000534 <_data>
f900007c:	40890933          	sub	s2,s2,s0
f9000080:	00112623          	sw	ra,12(sp)
f9000084:	00912223          	sw	s1,4(sp)
f9000088:	40295913          	srai	s2,s2,0x2
f900008c:	00090e63          	beqz	s2,f90000a8 <__libc_init_array+0x48>
f9000090:	00000493          	li	s1,0
f9000094:	00042783          	lw	a5,0(s0)
f9000098:	00148493          	addi	s1,s1,1
f900009c:	00440413          	addi	s0,s0,4
f90000a0:	000780e7          	jalr	a5
f90000a4:	fe9918e3          	bne	s2,s1,f9000094 <__libc_init_array+0x34>
f90000a8:	00000417          	auipc	s0,0x0
f90000ac:	48c40413          	addi	s0,s0,1164 # f9000534 <_data>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	48490913          	addi	s2,s2,1156 # f9000534 <_data>
f90000b8:	40890933          	sub	s2,s2,s0
f90000bc:	40295913          	srai	s2,s2,0x2
f90000c0:	00090e63          	beqz	s2,f90000dc <__libc_init_array+0x7c>
f90000c4:	00000493          	li	s1,0
f90000c8:	00042783          	lw	a5,0(s0)
f90000cc:	00148493          	addi	s1,s1,1
f90000d0:	00440413          	addi	s0,s0,4
f90000d4:	000780e7          	jalr	a5
f90000d8:	fe9918e3          	bne	s2,s1,f90000c8 <__libc_init_array+0x68>
f90000dc:	00c12083          	lw	ra,12(sp)
f90000e0:	00812403          	lw	s0,8(sp)
f90000e4:	00412483          	lw	s1,4(sp)
f90000e8:	00012903          	lw	s2,0(sp)
f90000ec:	01010113          	addi	sp,sp,16
f90000f0:	00008067          	ret

f90000f4 <uart_writeAvailability>:
*          so the 'volatile' keyword is used to prevent the compiler from
*          optimizing away or reordering the read operation.
*
******************************************************************************/
    static inline u32 read_u32(u32 address){
        return *((volatile u32*) address);
f90000f4:	00452503          	lw	a0,4(a0)
*          of available spaces for writing data from bits 23 to 16. It then
*          returns this value after masking with 0xFF.
*
******************************************************************************/
    static u32 uart_writeAvailability(u32 reg){
        return (read_u32(reg + UART_STATUS) >> 16) & 0xFF;
f90000f8:	01055513          	srli	a0,a0,0x10
    }
f90000fc:	0ff57513          	andi	a0,a0,255
f9000100:	00008067          	ret

f9000104 <uart_readOccupancy>:
f9000104:	00452503          	lw	a0,4(a0)
*          of occupied spaces for reading data from bits 31 to 24.
*
******************************************************************************/
    static u32 uart_readOccupancy(u32 reg){
        return read_u32(reg + UART_STATUS) >> 24;
    }
f9000108:	01855513          	srli	a0,a0,0x18
f900010c:	00008067          	ret

f9000110 <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
f9000110:	ff010113          	addi	sp,sp,-16
f9000114:	00112623          	sw	ra,12(sp)
f9000118:	00812423          	sw	s0,8(sp)
f900011c:	00912223          	sw	s1,4(sp)
f9000120:	00050413          	mv	s0,a0
f9000124:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f9000128:	00040513          	mv	a0,s0
f900012c:	fc9ff0ef          	jal	ra,f90000f4 <uart_writeAvailability>
f9000130:	fe050ce3          	beqz	a0,f9000128 <uart_write+0x18>
*          optimizing away or reordering the write operation.
*
******************************************************************************/

    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f9000134:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f9000138:	00c12083          	lw	ra,12(sp)
f900013c:	00812403          	lw	s0,8(sp)
f9000140:	00412483          	lw	s1,4(sp)
f9000144:	01010113          	addi	sp,sp,16
f9000148:	00008067          	ret

f900014c <uart_read>:
* @note    The function waits until there is data available in the UART buffer
*          for reading. Once data is available, it reads the character data from
*          the UART data register and returns it.
*
******************************************************************************/
    static char uart_read(u32 reg){
f900014c:	ff010113          	addi	sp,sp,-16
f9000150:	00112623          	sw	ra,12(sp)
f9000154:	00812423          	sw	s0,8(sp)
f9000158:	00050413          	mv	s0,a0
        while(uart_readOccupancy(reg) == 0);
f900015c:	00040513          	mv	a0,s0
f9000160:	fa5ff0ef          	jal	ra,f9000104 <uart_readOccupancy>
f9000164:	fe050ce3          	beqz	a0,f900015c <uart_read+0x10>
        return *((volatile u32*) address);
f9000168:	00042503          	lw	a0,0(s0)
        return read_u32(reg + UART_DATA);
    }
f900016c:	0ff57513          	andi	a0,a0,255
f9000170:	00c12083          	lw	ra,12(sp)
f9000174:	00812403          	lw	s0,8(sp)
f9000178:	01010113          	addi	sp,sp,16
f900017c:	00008067          	ret

f9000180 <_putchar>:
* @note If semihosting printing is enabled (ENABLE_SEMIHOSTING_PRINT == 1),
*       the character is output using the semihosting function sh_writec().
*       Otherwise, the character is output using the BSP function bsp_putChar().
*
*******************************************************************************/
    static void _putchar(char character){
f9000180:	ff010113          	addi	sp,sp,-16
f9000184:	00112623          	sw	ra,12(sp)
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f9000188:	00050593          	mv	a1,a0
f900018c:	f8010537          	lui	a0,0xf8010
f9000190:	f81ff0ef          	jal	ra,f9000110 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000194:	00c12083          	lw	ra,12(sp)
f9000198:	01010113          	addi	sp,sp,16
f900019c:	00008067          	ret

f90001a0 <_putchar_s>:
*       the character is output using the semihosting function sh_write0().
*       Otherwise, the character is output using the BSP function _putChar().
*
*******************************************************************************/
    static void _putchar_s(char *p)
    {
f90001a0:	ff010113          	addi	sp,sp,-16
f90001a4:	00112623          	sw	ra,12(sp)
f90001a8:	00812423          	sw	s0,8(sp)
f90001ac:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f90001b0:	00044503          	lbu	a0,0(s0)
f90001b4:	00050863          	beqz	a0,f90001c4 <_putchar_s+0x24>
            _putchar(*(p++));
f90001b8:	00140413          	addi	s0,s0,1
f90001bc:	fc5ff0ef          	jal	ra,f9000180 <_putchar>
f90001c0:	ff1ff06f          	j	f90001b0 <_putchar_s+0x10>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f90001c4:	00c12083          	lw	ra,12(sp)
f90001c8:	00812403          	lw	s0,8(sp)
f90001cc:	01010113          	addi	sp,sp,16
f90001d0:	00008067          	ret

f90001d4 <bsp_printHex>:
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f90001d4:	ff010113          	addi	sp,sp,-16
f90001d8:	00112623          	sw	ra,12(sp)
f90001dc:	00812423          	sw	s0,8(sp)
f90001e0:	00912223          	sw	s1,4(sp)
f90001e4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001e8:	01c00413          	li	s0,28
f90001ec:	0240006f          	j	f9000210 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90001f0:	0084d7b3          	srl	a5,s1,s0
f90001f4:	00f7f713          	andi	a4,a5,15
f90001f8:	f90007b7          	lui	a5,0xf9000
f90001fc:	53478793          	addi	a5,a5,1332 # f9000534 <__global_pointer$+0xfffff73c>
f9000200:	00e787b3          	add	a5,a5,a4
f9000204:	0007c503          	lbu	a0,0(a5)
f9000208:	f79ff0ef          	jal	ra,f9000180 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f900020c:	ffc40413          	addi	s0,s0,-4
f9000210:	fe0450e3          	bgez	s0,f90001f0 <bsp_printHex+0x1c>
        }
    }
f9000214:	00c12083          	lw	ra,12(sp)
f9000218:	00812403          	lw	s0,8(sp)
f900021c:	00412483          	lw	s1,4(sp)
f9000220:	01010113          	addi	sp,sp,16
f9000224:	00008067          	ret

f9000228 <bsp_printHex_lower>:
*
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    static void bsp_printHex_lower(uint32_t val)
        {
f9000228:	ff010113          	addi	sp,sp,-16
f900022c:	00112623          	sw	ra,12(sp)
f9000230:	00812423          	sw	s0,8(sp)
f9000234:	00912223          	sw	s1,4(sp)
f9000238:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f900023c:	01c00413          	li	s0,28
f9000240:	0240006f          	j	f9000264 <bsp_printHex_lower+0x3c>
                _putchar("0123456789abcdef"[(val >> i) % 16]);
f9000244:	0084d7b3          	srl	a5,s1,s0
f9000248:	00f7f713          	andi	a4,a5,15
f900024c:	f90007b7          	lui	a5,0xf9000
f9000250:	54878793          	addi	a5,a5,1352 # f9000548 <__global_pointer$+0xfffff750>
f9000254:	00e787b3          	add	a5,a5,a4
f9000258:	0007c503          	lbu	a0,0(a5)
f900025c:	f25ff0ef          	jal	ra,f9000180 <_putchar>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000260:	ffc40413          	addi	s0,s0,-4
f9000264:	fe0450e3          	bgez	s0,f9000244 <bsp_printHex_lower+0x1c>

            }
        }
f9000268:	00c12083          	lw	ra,12(sp)
f900026c:	00812403          	lw	s0,8(sp)
f9000270:	00412483          	lw	s1,4(sp)
f9000274:	01010113          	addi	sp,sp,16
f9000278:	00008067          	ret

f900027c <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f900027c:	ff010113          	addi	sp,sp,-16
f9000280:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000284:	0ff57513          	andi	a0,a0,255
f9000288:	ef9ff0ef          	jal	ra,f9000180 <_putchar>
    }
f900028c:	00c12083          	lw	ra,12(sp)
f9000290:	01010113          	addi	sp,sp,16
f9000294:	00008067          	ret

f9000298 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f9000298:	ff010113          	addi	sp,sp,-16
f900029c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f90002a0:	f01ff0ef          	jal	ra,f90001a0 <_putchar_s>
    }
f90002a4:	00c12083          	lw	ra,12(sp)
f90002a8:	01010113          	addi	sp,sp,16
f90002ac:	00008067          	ret

f90002b0 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f90002b0:	fd010113          	addi	sp,sp,-48
f90002b4:	02112623          	sw	ra,44(sp)
f90002b8:	02812423          	sw	s0,40(sp)
f90002bc:	02912223          	sw	s1,36(sp)
f90002c0:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f90002c4:	00054663          	bltz	a0,f90002d0 <bsp_printf_d+0x20>
    {
f90002c8:	00010413          	mv	s0,sp
f90002cc:	02c0006f          	j	f90002f8 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90002d0:	02d00513          	li	a0,45
f90002d4:	fa9ff0ef          	jal	ra,f900027c <bsp_printf_c>
            val = -val;
f90002d8:	409004b3          	neg	s1,s1
f90002dc:	fedff06f          	j	f90002c8 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f90002e0:	00a00713          	li	a4,10
f90002e4:	02e4e7b3          	rem	a5,s1,a4
f90002e8:	03078793          	addi	a5,a5,48
f90002ec:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90002f0:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90002f4:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90002f8:	fe0494e3          	bnez	s1,f90002e0 <bsp_printf_d+0x30>
f90002fc:	00010793          	mv	a5,sp
f9000300:	fef400e3          	beq	s0,a5,f90002e0 <bsp_printf_d+0x30>
f9000304:	0100006f          	j	f9000314 <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f9000308:	fff40413          	addi	s0,s0,-1
f900030c:	00044503          	lbu	a0,0(s0)
f9000310:	f6dff0ef          	jal	ra,f900027c <bsp_printf_c>
        while (p != buffer)
f9000314:	00010793          	mv	a5,sp
f9000318:	fef418e3          	bne	s0,a5,f9000308 <bsp_printf_d+0x58>
    }
f900031c:	02c12083          	lw	ra,44(sp)
f9000320:	02812403          	lw	s0,40(sp)
f9000324:	02412483          	lw	s1,36(sp)
f9000328:	03010113          	addi	sp,sp,48
f900032c:	00008067          	ret

f9000330 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f9000330:	ff010113          	addi	sp,sp,-16
f9000334:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f9000338:	00000713          	li	a4,0
f900033c:	00700793          	li	a5,7
f9000340:	02e7c063          	blt	a5,a4,f9000360 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000344:	00271693          	slli	a3,a4,0x2
f9000348:	ff000793          	li	a5,-16
f900034c:	00d797b3          	sll	a5,a5,a3
f9000350:	00f577b3          	and	a5,a0,a5
f9000354:	00078663          	beqz	a5,f9000360 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000358:	00170713          	addi	a4,a4,1
f900035c:	fe1ff06f          	j	f900033c <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f9000360:	ec9ff0ef          	jal	ra,f9000228 <bsp_printHex_lower>
    }
f9000364:	00c12083          	lw	ra,12(sp)
f9000368:	01010113          	addi	sp,sp,16
f900036c:	00008067          	ret

f9000370 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f9000370:	ff010113          	addi	sp,sp,-16
f9000374:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f9000378:	00000713          	li	a4,0
f900037c:	00700793          	li	a5,7
f9000380:	02e7c063          	blt	a5,a4,f90003a0 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000384:	00271693          	slli	a3,a4,0x2
f9000388:	ff000793          	li	a5,-16
f900038c:	00d797b3          	sll	a5,a5,a3
f9000390:	00f577b3          	and	a5,a0,a5
f9000394:	00078663          	beqz	a5,f90003a0 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000398:	00170713          	addi	a4,a4,1
f900039c:	fe1ff06f          	j	f900037c <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f90003a0:	e35ff0ef          	jal	ra,f90001d4 <bsp_printHex>
        }
f90003a4:	00c12083          	lw	ra,12(sp)
f90003a8:	01010113          	addi	sp,sp,16
f90003ac:	00008067          	ret

f90003b0 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f90003b0:	fc010113          	addi	sp,sp,-64
f90003b4:	00112e23          	sw	ra,28(sp)
f90003b8:	00812c23          	sw	s0,24(sp)
f90003bc:	00912a23          	sw	s1,20(sp)
f90003c0:	00050493          	mv	s1,a0
f90003c4:	02b12223          	sw	a1,36(sp)
f90003c8:	02c12423          	sw	a2,40(sp)
f90003cc:	02d12623          	sw	a3,44(sp)
f90003d0:	02e12823          	sw	a4,48(sp)
f90003d4:	02f12a23          	sw	a5,52(sp)
f90003d8:	03012c23          	sw	a6,56(sp)
f90003dc:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f90003e0:	02410793          	addi	a5,sp,36
f90003e4:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f90003e8:	00000413          	li	s0,0
f90003ec:	01c0006f          	j	f9000408 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f90003f0:	00c12783          	lw	a5,12(sp)
f90003f4:	00478713          	addi	a4,a5,4
f90003f8:	00e12623          	sw	a4,12(sp)
f90003fc:	0007a503          	lw	a0,0(a5)
f9000400:	e7dff0ef          	jal	ra,f900027c <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000404:	00140413          	addi	s0,s0,1
f9000408:	008487b3          	add	a5,s1,s0
f900040c:	0007c503          	lbu	a0,0(a5)
f9000410:	0c050263          	beqz	a0,f90004d4 <bsp_printf+0x124>
            if (format[i] == '%') {
f9000414:	02500793          	li	a5,37
f9000418:	06f50663          	beq	a0,a5,f9000484 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f900041c:	e61ff0ef          	jal	ra,f900027c <bsp_printf_c>
f9000420:	fe5ff06f          	j	f9000404 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000424:	00c12783          	lw	a5,12(sp)
f9000428:	00478713          	addi	a4,a5,4
f900042c:	00e12623          	sw	a4,12(sp)
f9000430:	0007a503          	lw	a0,0(a5)
f9000434:	e65ff0ef          	jal	ra,f9000298 <bsp_printf_s>
                        break;
f9000438:	fcdff06f          	j	f9000404 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f900043c:	00c12783          	lw	a5,12(sp)
f9000440:	00478713          	addi	a4,a5,4
f9000444:	00e12623          	sw	a4,12(sp)
f9000448:	0007a503          	lw	a0,0(a5)
f900044c:	e65ff0ef          	jal	ra,f90002b0 <bsp_printf_d>
                        break;
f9000450:	fb5ff06f          	j	f9000404 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000454:	00c12783          	lw	a5,12(sp)
f9000458:	00478713          	addi	a4,a5,4
f900045c:	00e12623          	sw	a4,12(sp)
f9000460:	0007a503          	lw	a0,0(a5)
f9000464:	f0dff0ef          	jal	ra,f9000370 <bsp_printf_X>
                        break;
f9000468:	f9dff06f          	j	f9000404 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f900046c:	00c12783          	lw	a5,12(sp)
f9000470:	00478713          	addi	a4,a5,4
f9000474:	00e12623          	sw	a4,12(sp)
f9000478:	0007a503          	lw	a0,0(a5)
f900047c:	eb5ff0ef          	jal	ra,f9000330 <bsp_printf_x>
                        break;
f9000480:	f85ff06f          	j	f9000404 <bsp_printf+0x54>
                while (format[++i]) {
f9000484:	00140413          	addi	s0,s0,1
f9000488:	008487b3          	add	a5,s1,s0
f900048c:	0007c783          	lbu	a5,0(a5)
f9000490:	f6078ae3          	beqz	a5,f9000404 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000494:	06300713          	li	a4,99
f9000498:	f4e78ce3          	beq	a5,a4,f90003f0 <bsp_printf+0x40>
                    else if (format[i] == 's') {
f900049c:	07300713          	li	a4,115
f90004a0:	f8e782e3          	beq	a5,a4,f9000424 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f90004a4:	06400713          	li	a4,100
f90004a8:	f8e78ae3          	beq	a5,a4,f900043c <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f90004ac:	05800713          	li	a4,88
f90004b0:	fae782e3          	beq	a5,a4,f9000454 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f90004b4:	07800713          	li	a4,120
f90004b8:	fae78ae3          	beq	a5,a4,f900046c <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f90004bc:	06600713          	li	a4,102
f90004c0:	fce792e3          	bne	a5,a4,f9000484 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f90004c4:	f9000537          	lui	a0,0xf9000
f90004c8:	55c50513          	addi	a0,a0,1372 # f900055c <__global_pointer$+0xfffff764>
f90004cc:	dcdff0ef          	jal	ra,f9000298 <bsp_printf_s>
                        break;
f90004d0:	f35ff06f          	j	f9000404 <bsp_printf+0x54>

        va_end(ap);
    }
f90004d4:	01c12083          	lw	ra,28(sp)
f90004d8:	01812403          	lw	s0,24(sp)
f90004dc:	01412483          	lw	s1,20(sp)
f90004e0:	04010113          	addi	sp,sp,64
f90004e4:	00008067          	ret

f90004e8 <main>:
*
* @brief This function capture the character that user asserted on keyboard and 
*        printed on the terminal. 
*
******************************************************************************/
void main() {
f90004e8:	ff010113          	addi	sp,sp,-16
f90004ec:	00112623          	sw	ra,12(sp)
    uint8_t dat;

    bsp_init();
    bsp_printf("Uart echo demo ! \r\n");
f90004f0:	f9000537          	lui	a0,0xf9000
f90004f4:	5a850513          	addi	a0,a0,1448 # f90005a8 <__global_pointer$+0xfffff7b0>
f90004f8:	eb9ff0ef          	jal	ra,f90003b0 <bsp_printf>
    bsp_printf("Start typing on terminal to send character... \r\n");
f90004fc:	f9000537          	lui	a0,0xf9000
f9000500:	5bc50513          	addi	a0,a0,1468 # f90005bc <__global_pointer$+0xfffff7c4>
f9000504:	eadff0ef          	jal	ra,f90003b0 <bsp_printf>
f9000508:	01c0006f          	j	f9000524 <main+0x3c>
    while(1)
    {
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
            dat=uart_read(BSP_UART_TERMINAL);
f900050c:	f8010537          	lui	a0,0xf8010
f9000510:	c3dff0ef          	jal	ra,f900014c <uart_read>
            bsp_printf("echo character: %c \r\n", dat);
f9000514:	00050593          	mv	a1,a0
f9000518:	f9000537          	lui	a0,0xf9000
f900051c:	5f050513          	addi	a0,a0,1520 # f90005f0 <__global_pointer$+0xfffff7f8>
f9000520:	e91ff0ef          	jal	ra,f90003b0 <bsp_printf>
        while(uart_readOccupancy(BSP_UART_TERMINAL)){
f9000524:	f8010537          	lui	a0,0xf8010
f9000528:	bddff0ef          	jal	ra,f9000104 <uart_readOccupancy>
f900052c:	fe050ce3          	beqz	a0,f9000524 <main+0x3c>
f9000530:	fddff06f          	j	f900050c <main+0x24>
