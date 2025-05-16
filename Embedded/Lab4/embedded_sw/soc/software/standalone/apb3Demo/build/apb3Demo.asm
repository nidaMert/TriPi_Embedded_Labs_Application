
build/apb3Demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	f6818193          	addi	gp,gp,-152 # f9000f68 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	a2818113          	addi	sp,gp,-1496 # f9000990 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	6b050513          	addi	a0,a0,1712 # f90006bc <_data>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	6a858593          	addi	a1,a1,1704 # f90006bc <_data>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f9000784 <owrite_crtl>
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
f9000038:	81c18513          	addi	a0,gp,-2020 # f9000784 <owrite_crtl>
	la a1, _end
f900003c:	82818593          	addi	a1,gp,-2008 # f9000790 <_end>
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
f9000054:	510000ef          	jal	ra,f9000564 <main>

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
f9000070:	65040413          	addi	s0,s0,1616 # f90006bc <_data>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	64890913          	addi	s2,s2,1608 # f90006bc <_data>
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
f90000ac:	61440413          	addi	s0,s0,1556 # f90006bc <_data>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	60c90913          	addi	s2,s2,1548 # f90006bc <_data>
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

f9000180 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
f9000180:	000f47b7          	lui	a5,0xf4
f9000184:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf4040>
f9000188:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f900018c:	0000c7b7          	lui	a5,0xc
f9000190:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xbdf8>
f9000194:	00f60633          	add	a2,a2,a5
f9000198:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f900019c:	02a58533          	mul	a0,a1,a0
f90001a0:	00f50533          	add	a0,a0,a5
f90001a4:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f90001a8:	40f507b3          	sub	a5,a0,a5
f90001ac:	fe07dce3          	bgez	a5,f90001a4 <clint_uDelay+0x24>
f90001b0:	00008067          	ret

f90001b4 <_putchar>:
* @note If semihosting printing is enabled (ENABLE_SEMIHOSTING_PRINT == 1),
*       the character is output using the semihosting function sh_writec().
*       Otherwise, the character is output using the BSP function bsp_putChar().
*
*******************************************************************************/
    static void _putchar(char character){
f90001b4:	ff010113          	addi	sp,sp,-16
f90001b8:	00112623          	sw	ra,12(sp)
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f90001bc:	00050593          	mv	a1,a0
f90001c0:	f8010537          	lui	a0,0xf8010
f90001c4:	f4dff0ef          	jal	ra,f9000110 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f90001c8:	00c12083          	lw	ra,12(sp)
f90001cc:	01010113          	addi	sp,sp,16
f90001d0:	00008067          	ret

f90001d4 <_putchar_s>:
*       the character is output using the semihosting function sh_write0().
*       Otherwise, the character is output using the BSP function _putChar().
*
*******************************************************************************/
    static void _putchar_s(char *p)
    {
f90001d4:	ff010113          	addi	sp,sp,-16
f90001d8:	00112623          	sw	ra,12(sp)
f90001dc:	00812423          	sw	s0,8(sp)
f90001e0:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f90001e4:	00044503          	lbu	a0,0(s0)
f90001e8:	00050863          	beqz	a0,f90001f8 <_putchar_s+0x24>
            _putchar(*(p++));
f90001ec:	00140413          	addi	s0,s0,1
f90001f0:	fc5ff0ef          	jal	ra,f90001b4 <_putchar>
f90001f4:	ff1ff06f          	j	f90001e4 <_putchar_s+0x10>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f90001f8:	00c12083          	lw	ra,12(sp)
f90001fc:	00812403          	lw	s0,8(sp)
f9000200:	01010113          	addi	sp,sp,16
f9000204:	00008067          	ret

f9000208 <bsp_printHex>:
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f9000208:	ff010113          	addi	sp,sp,-16
f900020c:	00112623          	sw	ra,12(sp)
f9000210:	00812423          	sw	s0,8(sp)
f9000214:	00912223          	sw	s1,4(sp)
f9000218:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f900021c:	01c00413          	li	s0,28
f9000220:	0240006f          	j	f9000244 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f9000224:	0084d7b3          	srl	a5,s1,s0
f9000228:	00f7f713          	andi	a4,a5,15
f900022c:	f90007b7          	lui	a5,0xf9000
f9000230:	6bc78793          	addi	a5,a5,1724 # f90006bc <__global_pointer$+0xfffff754>
f9000234:	00e787b3          	add	a5,a5,a4
f9000238:	0007c503          	lbu	a0,0(a5)
f900023c:	f79ff0ef          	jal	ra,f90001b4 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000240:	ffc40413          	addi	s0,s0,-4
f9000244:	fe0450e3          	bgez	s0,f9000224 <bsp_printHex+0x1c>
        }
    }
f9000248:	00c12083          	lw	ra,12(sp)
f900024c:	00812403          	lw	s0,8(sp)
f9000250:	00412483          	lw	s1,4(sp)
f9000254:	01010113          	addi	sp,sp,16
f9000258:	00008067          	ret

f900025c <bsp_printHex_lower>:
*
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    static void bsp_printHex_lower(uint32_t val)
        {
f900025c:	ff010113          	addi	sp,sp,-16
f9000260:	00112623          	sw	ra,12(sp)
f9000264:	00812423          	sw	s0,8(sp)
f9000268:	00912223          	sw	s1,4(sp)
f900026c:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000270:	01c00413          	li	s0,28
f9000274:	0240006f          	j	f9000298 <bsp_printHex_lower+0x3c>
                _putchar("0123456789abcdef"[(val >> i) % 16]);
f9000278:	0084d7b3          	srl	a5,s1,s0
f900027c:	00f7f713          	andi	a4,a5,15
f9000280:	f90007b7          	lui	a5,0xf9000
f9000284:	6d078793          	addi	a5,a5,1744 # f90006d0 <__global_pointer$+0xfffff768>
f9000288:	00e787b3          	add	a5,a5,a4
f900028c:	0007c503          	lbu	a0,0(a5)
f9000290:	f25ff0ef          	jal	ra,f90001b4 <_putchar>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000294:	ffc40413          	addi	s0,s0,-4
f9000298:	fe0450e3          	bgez	s0,f9000278 <bsp_printHex_lower+0x1c>

            }
        }
f900029c:	00c12083          	lw	ra,12(sp)
f90002a0:	00812403          	lw	s0,8(sp)
f90002a4:	00412483          	lw	s1,4(sp)
f90002a8:	01010113          	addi	sp,sp,16
f90002ac:	00008067          	ret

f90002b0 <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f90002b0:	ff010113          	addi	sp,sp,-16
f90002b4:	00112623          	sw	ra,12(sp)
        _putchar(c);
f90002b8:	0ff57513          	andi	a0,a0,255
f90002bc:	ef9ff0ef          	jal	ra,f90001b4 <_putchar>
    }
f90002c0:	00c12083          	lw	ra,12(sp)
f90002c4:	01010113          	addi	sp,sp,16
f90002c8:	00008067          	ret

f90002cc <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f90002cc:	ff010113          	addi	sp,sp,-16
f90002d0:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f90002d4:	f01ff0ef          	jal	ra,f90001d4 <_putchar_s>
    }
f90002d8:	00c12083          	lw	ra,12(sp)
f90002dc:	01010113          	addi	sp,sp,16
f90002e0:	00008067          	ret

f90002e4 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f90002e4:	fd010113          	addi	sp,sp,-48
f90002e8:	02112623          	sw	ra,44(sp)
f90002ec:	02812423          	sw	s0,40(sp)
f90002f0:	02912223          	sw	s1,36(sp)
f90002f4:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f90002f8:	00054663          	bltz	a0,f9000304 <bsp_printf_d+0x20>
    {
f90002fc:	00010413          	mv	s0,sp
f9000300:	02c0006f          	j	f900032c <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9000304:	02d00513          	li	a0,45
f9000308:	fa9ff0ef          	jal	ra,f90002b0 <bsp_printf_c>
            val = -val;
f900030c:	409004b3          	neg	s1,s1
f9000310:	fedff06f          	j	f90002fc <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f9000314:	00a00713          	li	a4,10
f9000318:	02e4e7b3          	rem	a5,s1,a4
f900031c:	03078793          	addi	a5,a5,48
f9000320:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f9000324:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f9000328:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f900032c:	fe0494e3          	bnez	s1,f9000314 <bsp_printf_d+0x30>
f9000330:	00010793          	mv	a5,sp
f9000334:	fef400e3          	beq	s0,a5,f9000314 <bsp_printf_d+0x30>
f9000338:	0100006f          	j	f9000348 <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f900033c:	fff40413          	addi	s0,s0,-1
f9000340:	00044503          	lbu	a0,0(s0)
f9000344:	f6dff0ef          	jal	ra,f90002b0 <bsp_printf_c>
        while (p != buffer)
f9000348:	00010793          	mv	a5,sp
f900034c:	fef418e3          	bne	s0,a5,f900033c <bsp_printf_d+0x58>
    }
f9000350:	02c12083          	lw	ra,44(sp)
f9000354:	02812403          	lw	s0,40(sp)
f9000358:	02412483          	lw	s1,36(sp)
f900035c:	03010113          	addi	sp,sp,48
f9000360:	00008067          	ret

f9000364 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f9000364:	ff010113          	addi	sp,sp,-16
f9000368:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f900036c:	00000713          	li	a4,0
f9000370:	00700793          	li	a5,7
f9000374:	02e7c063          	blt	a5,a4,f9000394 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000378:	00271693          	slli	a3,a4,0x2
f900037c:	ff000793          	li	a5,-16
f9000380:	00d797b3          	sll	a5,a5,a3
f9000384:	00f577b3          	and	a5,a0,a5
f9000388:	00078663          	beqz	a5,f9000394 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f900038c:	00170713          	addi	a4,a4,1
f9000390:	fe1ff06f          	j	f9000370 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f9000394:	ec9ff0ef          	jal	ra,f900025c <bsp_printHex_lower>
    }
f9000398:	00c12083          	lw	ra,12(sp)
f900039c:	01010113          	addi	sp,sp,16
f90003a0:	00008067          	ret

f90003a4 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f90003a4:	ff010113          	addi	sp,sp,-16
f90003a8:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f90003ac:	00000713          	li	a4,0
f90003b0:	00700793          	li	a5,7
f90003b4:	02e7c063          	blt	a5,a4,f90003d4 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f90003b8:	00271693          	slli	a3,a4,0x2
f90003bc:	ff000793          	li	a5,-16
f90003c0:	00d797b3          	sll	a5,a5,a3
f90003c4:	00f577b3          	and	a5,a0,a5
f90003c8:	00078663          	beqz	a5,f90003d4 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f90003cc:	00170713          	addi	a4,a4,1
f90003d0:	fe1ff06f          	j	f90003b0 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f90003d4:	e35ff0ef          	jal	ra,f9000208 <bsp_printHex>
        }
f90003d8:	00c12083          	lw	ra,12(sp)
f90003dc:	01010113          	addi	sp,sp,16
f90003e0:	00008067          	ret

f90003e4 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f90003e4:	fc010113          	addi	sp,sp,-64
f90003e8:	00112e23          	sw	ra,28(sp)
f90003ec:	00812c23          	sw	s0,24(sp)
f90003f0:	00912a23          	sw	s1,20(sp)
f90003f4:	00050493          	mv	s1,a0
f90003f8:	02b12223          	sw	a1,36(sp)
f90003fc:	02c12423          	sw	a2,40(sp)
f9000400:	02d12623          	sw	a3,44(sp)
f9000404:	02e12823          	sw	a4,48(sp)
f9000408:	02f12a23          	sw	a5,52(sp)
f900040c:	03012c23          	sw	a6,56(sp)
f9000410:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f9000414:	02410793          	addi	a5,sp,36
f9000418:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f900041c:	00000413          	li	s0,0
f9000420:	01c0006f          	j	f900043c <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f9000424:	00c12783          	lw	a5,12(sp)
f9000428:	00478713          	addi	a4,a5,4
f900042c:	00e12623          	sw	a4,12(sp)
f9000430:	0007a503          	lw	a0,0(a5)
f9000434:	e7dff0ef          	jal	ra,f90002b0 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000438:	00140413          	addi	s0,s0,1
f900043c:	008487b3          	add	a5,s1,s0
f9000440:	0007c503          	lbu	a0,0(a5)
f9000444:	0c050263          	beqz	a0,f9000508 <bsp_printf+0x124>
            if (format[i] == '%') {
f9000448:	02500793          	li	a5,37
f900044c:	06f50663          	beq	a0,a5,f90004b8 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f9000450:	e61ff0ef          	jal	ra,f90002b0 <bsp_printf_c>
f9000454:	fe5ff06f          	j	f9000438 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000458:	00c12783          	lw	a5,12(sp)
f900045c:	00478713          	addi	a4,a5,4
f9000460:	00e12623          	sw	a4,12(sp)
f9000464:	0007a503          	lw	a0,0(a5)
f9000468:	e65ff0ef          	jal	ra,f90002cc <bsp_printf_s>
                        break;
f900046c:	fcdff06f          	j	f9000438 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f9000470:	00c12783          	lw	a5,12(sp)
f9000474:	00478713          	addi	a4,a5,4
f9000478:	00e12623          	sw	a4,12(sp)
f900047c:	0007a503          	lw	a0,0(a5)
f9000480:	e65ff0ef          	jal	ra,f90002e4 <bsp_printf_d>
                        break;
f9000484:	fb5ff06f          	j	f9000438 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000488:	00c12783          	lw	a5,12(sp)
f900048c:	00478713          	addi	a4,a5,4
f9000490:	00e12623          	sw	a4,12(sp)
f9000494:	0007a503          	lw	a0,0(a5)
f9000498:	f0dff0ef          	jal	ra,f90003a4 <bsp_printf_X>
                        break;
f900049c:	f9dff06f          	j	f9000438 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f90004a0:	00c12783          	lw	a5,12(sp)
f90004a4:	00478713          	addi	a4,a5,4
f90004a8:	00e12623          	sw	a4,12(sp)
f90004ac:	0007a503          	lw	a0,0(a5)
f90004b0:	eb5ff0ef          	jal	ra,f9000364 <bsp_printf_x>
                        break;
f90004b4:	f85ff06f          	j	f9000438 <bsp_printf+0x54>
                while (format[++i]) {
f90004b8:	00140413          	addi	s0,s0,1
f90004bc:	008487b3          	add	a5,s1,s0
f90004c0:	0007c783          	lbu	a5,0(a5)
f90004c4:	f6078ae3          	beqz	a5,f9000438 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f90004c8:	06300713          	li	a4,99
f90004cc:	f4e78ce3          	beq	a5,a4,f9000424 <bsp_printf+0x40>
                    else if (format[i] == 's') {
f90004d0:	07300713          	li	a4,115
f90004d4:	f8e782e3          	beq	a5,a4,f9000458 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f90004d8:	06400713          	li	a4,100
f90004dc:	f8e78ae3          	beq	a5,a4,f9000470 <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f90004e0:	05800713          	li	a4,88
f90004e4:	fae782e3          	beq	a5,a4,f9000488 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f90004e8:	07800713          	li	a4,120
f90004ec:	fae78ae3          	beq	a5,a4,f90004a0 <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f90004f0:	06600713          	li	a4,102
f90004f4:	fce792e3          	bne	a5,a4,f90004b8 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f90004f8:	f9000537          	lui	a0,0xf9000
f90004fc:	6e450513          	addi	a0,a0,1764 # f90006e4 <__global_pointer$+0xfffff77c>
f9000500:	dcdff0ef          	jal	ra,f90002cc <bsp_printf_s>
                        break;
f9000504:	f35ff06f          	j	f9000438 <bsp_printf+0x54>

        va_end(ap);
    }
f9000508:	01c12083          	lw	ra,28(sp)
f900050c:	01812403          	lw	s0,24(sp)
f9000510:	01412483          	lw	s1,20(sp)
f9000514:	04010113          	addi	sp,sp,64
f9000518:	00008067          	ret

f900051c <apb3_read>:
f900051c:	00052503          	lw	a0,0(a0)
*
******************************************************************************/
	u32 apb3_read(u32 slave)
	{
		return read_u32(slave+EXAMPLE_APB3_SLV_REG0_OFFSET);	
	}
f9000520:	00008067          	ret

f9000524 <apb3_ctrl_write>:
* @param ctrl_reg* Control register.
*
******************************************************************************/   
	void apb3_ctrl_write(u32 slave, struct ctrl_reg *cfg)
	{
	    write_u32(*(int *)cfg, slave+EXAMPLE_APB3_SLV_REG1_OFFSET);
f9000524:	0005a783          	lw	a5,0(a1)
        *((volatile u32*) address) = data;
f9000528:	00f52223          	sw	a5,4(a0)
	}
f900052c:	00008067          	ret

f9000530 <cfg_write>:
* @param ctrl_reg* Control register.
*
******************************************************************************/ 
	void cfg_write(u32 slave, struct ctrl_reg2 *cfg)
	{
		write_u32(*(int *)cfg, slave+EXAMPLE_APB3_SLV_REG3_OFFSET);
f9000530:	0005a783          	lw	a5,0(a1)
f9000534:	00f52623          	sw	a5,12(a0)
	}
f9000538:	00008067          	ret

f900053c <cfg_data>:
f900053c:	00b52823          	sw	a1,16(a0)
*
******************************************************************************/ 
	void cfg_data(u32 slave, u32 data)
	{
		write_u32(data, slave+EXAMPLE_APB3_SLV_REG4_OFFSET);
	}
f9000540:	00008067          	ret

f9000544 <cfg_addr>:
f9000544:	00b52a23          	sw	a1,20(a0)
*
******************************************************************************/ 
	void cfg_addr(u32 slave, u32  addr)
	{
		write_u32(addr, slave+EXAMPLE_APB3_SLV_REG5_OFFSET);
	}
f9000548:	00008067          	ret

f900054c <error_state>:
*
* @brief This function prints error message on terminal and enters an infinite loop
*         to halt the program's execution.
*
******************************************************************************/
void error_state() {
f900054c:	ff010113          	addi	sp,sp,-16
f9000550:	00112623          	sw	ra,12(sp)
    bsp_printf("Failed! \r\n");
f9000554:	f9000537          	lui	a0,0xf9000
f9000558:	73050513          	addi	a0,a0,1840 # f9000730 <__global_pointer$+0xfffff7c8>
f900055c:	e89ff0ef          	jal	ra,f90003e4 <bsp_printf>
    while (1) {}
f9000560:	0000006f          	j	f9000560 <error_state+0x14>

f9000564 <main>:
* @brief This main function initialize the system and stop APB3 from generating a
*        new random number and read the value from APB3 slave. The result is passed
*        if the return value is non-zero. 
*
******************************************************************************/
void main() {
f9000564:	ff010113          	addi	sp,sp,-16
f9000568:	00112623          	sw	ra,12(sp)
f900056c:	00812423          	sw	s0,8(sp)

*/

	 bsp_init();
	 uint8_t dat;
	 bsp_printf("LEDS OFF\r\n");
f9000570:	f9000537          	lui	a0,0xf9000
f9000574:	73c50513          	addi	a0,a0,1852 # f900073c <__global_pointer$+0xfffff7d4>
f9000578:	e6dff0ef          	jal	ra,f90003e4 <bsp_printf>
f900057c:	0a40006f          	j	f9000620 <main+0xbc>
f9000580:	f81007b7          	lui	a5,0xf8100
f9000584:	0007a023          	sw	zero,0(a5) # f8100000 <__global_pointer$+0xff0ff098>
	 while(1){
	         while(uart_readOccupancy(BSP_UART_TERMINAL)){
	                 dat=uart_read(BSP_UART_TERMINAL);
	                 if(dat==0x30){
	                         write_u32(0x0,IO_APB_SLAVE_0_INPUT + LED_REG);
	                         bsp_uDelay(5000);
f9000588:	f8b00637          	lui	a2,0xf8b00
f900058c:	013135b7          	lui	a1,0x1313
f9000590:	d0058593          	addi	a1,a1,-768 # 1312d00 <__stack_size+0x1312b00>
f9000594:	00001537          	lui	a0,0x1
f9000598:	38850513          	addi	a0,a0,904 # 1388 <__stack_size+0x1188>
f900059c:	be5ff0ef          	jal	ra,f9000180 <clint_uDelay>
	                         bsp_printf("LEDS OFF\r\n");}
f90005a0:	f9000537          	lui	a0,0xf9000
f90005a4:	73c50513          	addi	a0,a0,1852 # f900073c <__global_pointer$+0xfffff7d4>
f90005a8:	e3dff0ef          	jal	ra,f90003e4 <bsp_printf>
f90005ac:	0940006f          	j	f9000640 <main+0xdc>
f90005b0:	f81007b7          	lui	a5,0xf8100
f90005b4:	00100713          	li	a4,1
f90005b8:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff098>
	                 if(dat==0x31){
	                         write_u32(0x1,IO_APB_SLAVE_0_INPUT + LED_REG);
	                         bsp_uDelay(5000);
f90005bc:	f8b00637          	lui	a2,0xf8b00
f90005c0:	013135b7          	lui	a1,0x1313
f90005c4:	d0058593          	addi	a1,a1,-768 # 1312d00 <__stack_size+0x1312b00>
f90005c8:	00001537          	lui	a0,0x1
f90005cc:	38850513          	addi	a0,a0,904 # 1388 <__stack_size+0x1188>
f90005d0:	bb1ff0ef          	jal	ra,f9000180 <clint_uDelay>
	                         bsp_printf("LED1 ON\r\n");}
f90005d4:	f9000537          	lui	a0,0xf9000
f90005d8:	74850513          	addi	a0,a0,1864 # f9000748 <__global_pointer$+0xfffff7e0>
f90005dc:	e09ff0ef          	jal	ra,f90003e4 <bsp_printf>
f90005e0:	0680006f          	j	f9000648 <main+0xe4>
f90005e4:	f81007b7          	lui	a5,0xf8100
f90005e8:	00200713          	li	a4,2
f90005ec:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff098>
	                 if(dat==0x32){
	                         write_u32(0x2,IO_APB_SLAVE_0_INPUT + LED_REG);
	                         bsp_uDelay(5000);
f90005f0:	f8b00637          	lui	a2,0xf8b00
f90005f4:	013135b7          	lui	a1,0x1313
f90005f8:	d0058593          	addi	a1,a1,-768 # 1312d00 <__stack_size+0x1312b00>
f90005fc:	00001537          	lui	a0,0x1
f9000600:	38850513          	addi	a0,a0,904 # 1388 <__stack_size+0x1188>
f9000604:	b7dff0ef          	jal	ra,f9000180 <clint_uDelay>
	                         bsp_printf("LED2 ON\r\n");}
f9000608:	f9000537          	lui	a0,0xf9000
f900060c:	75450513          	addi	a0,a0,1876 # f9000754 <__global_pointer$+0xfffff7ec>
f9000610:	dd5ff0ef          	jal	ra,f90003e4 <bsp_printf>
f9000614:	03c0006f          	j	f9000650 <main+0xec>
	                 if(dat==0x33){
	                         write_u32(0x4,IO_APB_SLAVE_0_INPUT + LED_REG);
	                         bsp_uDelay(5000);
	                         bsp_printf("LED3 ON\r\n");}
	                 if(dat==0x34){
f9000618:	03400793          	li	a5,52
f900061c:	06f40863          	beq	s0,a5,f900068c <main+0x128>
	         while(uart_readOccupancy(BSP_UART_TERMINAL)){
f9000620:	f8010537          	lui	a0,0xf8010
f9000624:	ae1ff0ef          	jal	ra,f9000104 <uart_readOccupancy>
f9000628:	fe050ce3          	beqz	a0,f9000620 <main+0xbc>
	                 dat=uart_read(BSP_UART_TERMINAL);
f900062c:	f8010537          	lui	a0,0xf8010
f9000630:	b1dff0ef          	jal	ra,f900014c <uart_read>
f9000634:	00050413          	mv	s0,a0
	                 if(dat==0x30){
f9000638:	03000793          	li	a5,48
f900063c:	f4f502e3          	beq	a0,a5,f9000580 <main+0x1c>
	                 if(dat==0x31){
f9000640:	03100793          	li	a5,49
f9000644:	f6f406e3          	beq	s0,a5,f90005b0 <main+0x4c>
	                 if(dat==0x32){
f9000648:	03200793          	li	a5,50
f900064c:	f8f40ce3          	beq	s0,a5,f90005e4 <main+0x80>
	                 if(dat==0x33){
f9000650:	03300793          	li	a5,51
f9000654:	fcf412e3          	bne	s0,a5,f9000618 <main+0xb4>
f9000658:	f81007b7          	lui	a5,0xf8100
f900065c:	00400713          	li	a4,4
f9000660:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff098>
	                         bsp_uDelay(5000);
f9000664:	f8b00637          	lui	a2,0xf8b00
f9000668:	013135b7          	lui	a1,0x1313
f900066c:	d0058593          	addi	a1,a1,-768 # 1312d00 <__stack_size+0x1312b00>
f9000670:	00001537          	lui	a0,0x1
f9000674:	38850513          	addi	a0,a0,904 # 1388 <__stack_size+0x1188>
f9000678:	b09ff0ef          	jal	ra,f9000180 <clint_uDelay>
	                         bsp_printf("LED3 ON\r\n");}
f900067c:	f9000537          	lui	a0,0xf9000
f9000680:	76050513          	addi	a0,a0,1888 # f9000760 <__global_pointer$+0xfffff7f8>
f9000684:	d61ff0ef          	jal	ra,f90003e4 <bsp_printf>
f9000688:	f91ff06f          	j	f9000618 <main+0xb4>
f900068c:	f81007b7          	lui	a5,0xf8100
f9000690:	00800713          	li	a4,8
f9000694:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff098>
	                         write_u32(0x8,IO_APB_SLAVE_0_INPUT + LED_REG);
	                         bsp_uDelay(5000);
f9000698:	f8b00637          	lui	a2,0xf8b00
f900069c:	013135b7          	lui	a1,0x1313
f90006a0:	d0058593          	addi	a1,a1,-768 # 1312d00 <__stack_size+0x1312b00>
f90006a4:	00001537          	lui	a0,0x1
f90006a8:	38850513          	addi	a0,a0,904 # 1388 <__stack_size+0x1188>
f90006ac:	ad5ff0ef          	jal	ra,f9000180 <clint_uDelay>
	                         bsp_printf("LED4 ON\r\n");}
f90006b0:	80418513          	addi	a0,gp,-2044 # f900076c <_data+0xb0>
f90006b4:	d31ff0ef          	jal	ra,f90003e4 <bsp_printf>
f90006b8:	f69ff06f          	j	f9000620 <main+0xbc>
