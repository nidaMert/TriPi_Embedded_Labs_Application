
build/axi4Demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	08018193          	addi	gp,gp,128 # f9001080 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	a2018113          	addi	sp,gp,-1504 # f9000aa0 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	7c450513          	addi	a0,a0,1988 # f90007d0 <_data>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	7bc58593          	addi	a1,a1,1980 # f90007d0 <_data>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f900089c <__bss_start>
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
f9000038:	81c18513          	addi	a0,gp,-2020 # f900089c <__bss_start>
	la a1, _end
f900003c:	82018593          	addi	a1,gp,-2016 # f90008a0 <_end>
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
f9000054:	668000ef          	jal	ra,f90006bc <main>

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
f9000070:	76440413          	addi	s0,s0,1892 # f90007d0 <_data>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	75c90913          	addi	s2,s2,1884 # f90007d0 <_data>
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
f90000ac:	72840413          	addi	s0,s0,1832 # f90007d0 <_data>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	72090913          	addi	s2,s2,1824 # f90007d0 <_data>
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

f9000104 <uart_write>:
* @note    The function waits until there is available space in the UART buffer
*          for writing data. Once space is available, it writes the character
*          data to the UART data register.
*
******************************************************************************/
    static void uart_write(u32 reg, char data){
f9000104:	ff010113          	addi	sp,sp,-16
f9000108:	00112623          	sw	ra,12(sp)
f900010c:	00812423          	sw	s0,8(sp)
f9000110:	00912223          	sw	s1,4(sp)
f9000114:	00050413          	mv	s0,a0
f9000118:	00058493          	mv	s1,a1
        while(uart_writeAvailability(reg) == 0);
f900011c:	00040513          	mv	a0,s0
f9000120:	fd5ff0ef          	jal	ra,f90000f4 <uart_writeAvailability>
f9000124:	fe050ce3          	beqz	a0,f900011c <uart_write+0x18>
*          optimizing away or reordering the write operation.
*
******************************************************************************/

    static inline void write_u32(u32 data, u32 address){
        *((volatile u32*) address) = data;
f9000128:	00942023          	sw	s1,0(s0)
        write_u32(data, reg + UART_DATA);
    }
f900012c:	00c12083          	lw	ra,12(sp)
f9000130:	00812403          	lw	s0,8(sp)
f9000134:	00412483          	lw	s1,4(sp)
f9000138:	01010113          	addi	sp,sp,16
f900013c:	00008067          	ret

f9000140 <clint_uDelay>:
*          and the time limit is non-negative, indicating that the delay has
*          not yet elapsed.
*
******************************************************************************/
    static void clint_uDelay(u32 usec, u32 hz, u32 reg){
        u32 mTimePerUsec = hz/1000000;
f9000140:	000f47b7          	lui	a5,0xf4
f9000144:	24078793          	addi	a5,a5,576 # f4240 <__stack_size+0xf4040>
f9000148:	02f5d5b3          	divu	a1,a1,a5
    readReg_u32 (clint_getTimeLow , CLINT_TIME_ADDR)
f900014c:	0000c7b7          	lui	a5,0xc
f9000150:	ff878793          	addi	a5,a5,-8 # bff8 <__stack_size+0xbdf8>
f9000154:	00f60633          	add	a2,a2,a5
        return *((volatile u32*) address);
f9000158:	00062783          	lw	a5,0(a2)
        u32 limit = clint_getTimeLow(reg) + usec*mTimePerUsec;
f900015c:	02a58533          	mul	a0,a1,a0
f9000160:	00f50533          	add	a0,a0,a5
f9000164:	00062783          	lw	a5,0(a2)
        while((int32_t)(limit-(clint_getTimeLow(reg))) >= 0);
f9000168:	40f507b3          	sub	a5,a0,a5
f900016c:	fe07dce3          	bgez	a5,f9000164 <clint_uDelay+0x24>
f9000170:	00008067          	ret

f9000174 <_putchar>:
* @note If semihosting printing is enabled (ENABLE_SEMIHOSTING_PRINT == 1),
*       the character is output using the semihosting function sh_writec().
*       Otherwise, the character is output using the BSP function bsp_putChar().
*
*******************************************************************************/
    static void _putchar(char character){
f9000174:	ff010113          	addi	sp,sp,-16
f9000178:	00112623          	sw	ra,12(sp)
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f900017c:	00050593          	mv	a1,a0
f9000180:	f8010537          	lui	a0,0xf8010
f9000184:	f81ff0ef          	jal	ra,f9000104 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000188:	00c12083          	lw	ra,12(sp)
f900018c:	01010113          	addi	sp,sp,16
f9000190:	00008067          	ret

f9000194 <_putchar_s>:
*       the character is output using the semihosting function sh_write0().
*       Otherwise, the character is output using the BSP function _putChar().
*
*******************************************************************************/
    static void _putchar_s(char *p)
    {
f9000194:	ff010113          	addi	sp,sp,-16
f9000198:	00112623          	sw	ra,12(sp)
f900019c:	00812423          	sw	s0,8(sp)
f90001a0:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f90001a4:	00044503          	lbu	a0,0(s0)
f90001a8:	00050863          	beqz	a0,f90001b8 <_putchar_s+0x24>
            _putchar(*(p++));
f90001ac:	00140413          	addi	s0,s0,1
f90001b0:	fc5ff0ef          	jal	ra,f9000174 <_putchar>
f90001b4:	ff1ff06f          	j	f90001a4 <_putchar_s+0x10>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f90001b8:	00c12083          	lw	ra,12(sp)
f90001bc:	00812403          	lw	s0,8(sp)
f90001c0:	01010113          	addi	sp,sp,16
f90001c4:	00008067          	ret

f90001c8 <bsp_printHex>:
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f90001c8:	ff010113          	addi	sp,sp,-16
f90001cc:	00112623          	sw	ra,12(sp)
f90001d0:	00812423          	sw	s0,8(sp)
f90001d4:	00912223          	sw	s1,4(sp)
f90001d8:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001dc:	01c00413          	li	s0,28
f90001e0:	0240006f          	j	f9000204 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90001e4:	0084d7b3          	srl	a5,s1,s0
f90001e8:	00f7f713          	andi	a4,a5,15
f90001ec:	f90007b7          	lui	a5,0xf9000
f90001f0:	7d078793          	addi	a5,a5,2000 # f90007d0 <__global_pointer$+0xfffff750>
f90001f4:	00e787b3          	add	a5,a5,a4
f90001f8:	0007c503          	lbu	a0,0(a5)
f90001fc:	f79ff0ef          	jal	ra,f9000174 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000200:	ffc40413          	addi	s0,s0,-4
f9000204:	fe0450e3          	bgez	s0,f90001e4 <bsp_printHex+0x1c>
        }
    }
f9000208:	00c12083          	lw	ra,12(sp)
f900020c:	00812403          	lw	s0,8(sp)
f9000210:	00412483          	lw	s1,4(sp)
f9000214:	01010113          	addi	sp,sp,16
f9000218:	00008067          	ret

f900021c <bsp_printHex_lower>:
*
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    static void bsp_printHex_lower(uint32_t val)
        {
f900021c:	ff010113          	addi	sp,sp,-16
f9000220:	00112623          	sw	ra,12(sp)
f9000224:	00812423          	sw	s0,8(sp)
f9000228:	00912223          	sw	s1,4(sp)
f900022c:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000230:	01c00413          	li	s0,28
f9000234:	0240006f          	j	f9000258 <bsp_printHex_lower+0x3c>
                _putchar("0123456789abcdef"[(val >> i) % 16]);
f9000238:	0084d7b3          	srl	a5,s1,s0
f900023c:	00f7f713          	andi	a4,a5,15
f9000240:	f90007b7          	lui	a5,0xf9000
f9000244:	7e478793          	addi	a5,a5,2020 # f90007e4 <__global_pointer$+0xfffff764>
f9000248:	00e787b3          	add	a5,a5,a4
f900024c:	0007c503          	lbu	a0,0(a5)
f9000250:	f25ff0ef          	jal	ra,f9000174 <_putchar>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000254:	ffc40413          	addi	s0,s0,-4
f9000258:	fe0450e3          	bgez	s0,f9000238 <bsp_printHex_lower+0x1c>

            }
        }
f900025c:	00c12083          	lw	ra,12(sp)
f9000260:	00812403          	lw	s0,8(sp)
f9000264:	00412483          	lw	s1,4(sp)
f9000268:	01010113          	addi	sp,sp,16
f900026c:	00008067          	ret

f9000270 <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f9000270:	ff010113          	addi	sp,sp,-16
f9000274:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000278:	0ff57513          	andi	a0,a0,255
f900027c:	ef9ff0ef          	jal	ra,f9000174 <_putchar>
    }
f9000280:	00c12083          	lw	ra,12(sp)
f9000284:	01010113          	addi	sp,sp,16
f9000288:	00008067          	ret

f900028c <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f900028c:	ff010113          	addi	sp,sp,-16
f9000290:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9000294:	f01ff0ef          	jal	ra,f9000194 <_putchar_s>
    }
f9000298:	00c12083          	lw	ra,12(sp)
f900029c:	01010113          	addi	sp,sp,16
f90002a0:	00008067          	ret

f90002a4 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f90002a4:	fd010113          	addi	sp,sp,-48
f90002a8:	02112623          	sw	ra,44(sp)
f90002ac:	02812423          	sw	s0,40(sp)
f90002b0:	02912223          	sw	s1,36(sp)
f90002b4:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f90002b8:	00054663          	bltz	a0,f90002c4 <bsp_printf_d+0x20>
    {
f90002bc:	00010413          	mv	s0,sp
f90002c0:	02c0006f          	j	f90002ec <bsp_printf_d+0x48>
            bsp_printf_c('-');
f90002c4:	02d00513          	li	a0,45
f90002c8:	fa9ff0ef          	jal	ra,f9000270 <bsp_printf_c>
            val = -val;
f90002cc:	409004b3          	neg	s1,s1
f90002d0:	fedff06f          	j	f90002bc <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f90002d4:	00a00713          	li	a4,10
f90002d8:	02e4e7b3          	rem	a5,s1,a4
f90002dc:	03078793          	addi	a5,a5,48
f90002e0:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90002e4:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90002e8:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90002ec:	fe0494e3          	bnez	s1,f90002d4 <bsp_printf_d+0x30>
f90002f0:	00010793          	mv	a5,sp
f90002f4:	fef400e3          	beq	s0,a5,f90002d4 <bsp_printf_d+0x30>
f90002f8:	0100006f          	j	f9000308 <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f90002fc:	fff40413          	addi	s0,s0,-1
f9000300:	00044503          	lbu	a0,0(s0)
f9000304:	f6dff0ef          	jal	ra,f9000270 <bsp_printf_c>
        while (p != buffer)
f9000308:	00010793          	mv	a5,sp
f900030c:	fef418e3          	bne	s0,a5,f90002fc <bsp_printf_d+0x58>
    }
f9000310:	02c12083          	lw	ra,44(sp)
f9000314:	02812403          	lw	s0,40(sp)
f9000318:	02412483          	lw	s1,36(sp)
f900031c:	03010113          	addi	sp,sp,48
f9000320:	00008067          	ret

f9000324 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f9000324:	ff010113          	addi	sp,sp,-16
f9000328:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f900032c:	00000713          	li	a4,0
f9000330:	00700793          	li	a5,7
f9000334:	02e7c063          	blt	a5,a4,f9000354 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000338:	00271693          	slli	a3,a4,0x2
f900033c:	ff000793          	li	a5,-16
f9000340:	00d797b3          	sll	a5,a5,a3
f9000344:	00f577b3          	and	a5,a0,a5
f9000348:	00078663          	beqz	a5,f9000354 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f900034c:	00170713          	addi	a4,a4,1
f9000350:	fe1ff06f          	j	f9000330 <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f9000354:	ec9ff0ef          	jal	ra,f900021c <bsp_printHex_lower>
    }
f9000358:	00c12083          	lw	ra,12(sp)
f900035c:	01010113          	addi	sp,sp,16
f9000360:	00008067          	ret

f9000364 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f9000364:	ff010113          	addi	sp,sp,-16
f9000368:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f900036c:	00000713          	li	a4,0
f9000370:	00700793          	li	a5,7
f9000374:	02e7c063          	blt	a5,a4,f9000394 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000378:	00271693          	slli	a3,a4,0x2
f900037c:	ff000793          	li	a5,-16
f9000380:	00d797b3          	sll	a5,a5,a3
f9000384:	00f577b3          	and	a5,a0,a5
f9000388:	00078663          	beqz	a5,f9000394 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f900038c:	00170713          	addi	a4,a4,1
f9000390:	fe1ff06f          	j	f9000370 <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f9000394:	e35ff0ef          	jal	ra,f90001c8 <bsp_printHex>
        }
f9000398:	00c12083          	lw	ra,12(sp)
f900039c:	01010113          	addi	sp,sp,16
f90003a0:	00008067          	ret

f90003a4 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
f90003a4:	00259593          	slli	a1,a1,0x2
f90003a8:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f90003ac:	00c5a023          	sw	a2,0(a1)
    }
f90003b0:	00008067          	ret

f90003b4 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
f90003b4:	00759593          	slli	a1,a1,0x7
f90003b8:	00a58533          	add	a0,a1,a0
f90003bc:	00565593          	srli	a1,a2,0x5
f90003c0:	00259593          	slli	a1,a1,0x2
f90003c4:	00b50533          	add	a0,a0,a1
f90003c8:	000025b7          	lui	a1,0x2
f90003cc:	00b50533          	add	a0,a0,a1
        u32 mask = 1 << (gateway % 32);
f90003d0:	00100793          	li	a5,1
f90003d4:	00c797b3          	sll	a5,a5,a2
        if (enable)
f90003d8:	00068a63          	beqz	a3,f90003ec <plic_set_enable+0x38>
        return *((volatile u32*) address);
f90003dc:	00052603          	lw	a2,0(a0) # f8010000 <__global_pointer$+0xff00ef80>
            write_u32(read_u32(word) | mask, word);
f90003e0:	00c7e7b3          	or	a5,a5,a2
        *((volatile u32*) address) = data;
f90003e4:	00f52023          	sw	a5,0(a0)
f90003e8:	00008067          	ret
        return *((volatile u32*) address);
f90003ec:	00052603          	lw	a2,0(a0)
        else
            write_u32(read_u32(word) & ~mask, word);
f90003f0:	fff7c793          	not	a5,a5
f90003f4:	00c7f7b3          	and	a5,a5,a2
        *((volatile u32*) address) = data;
f90003f8:	00f52023          	sw	a5,0(a0)
    }
f90003fc:	00008067          	ret

f9000400 <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
f9000400:	00c59593          	slli	a1,a1,0xc
f9000404:	00a585b3          	add	a1,a1,a0
f9000408:	00200537          	lui	a0,0x200
f900040c:	00a585b3          	add	a1,a1,a0
f9000410:	00c5a023          	sw	a2,0(a1) # 2000 <__stack_size+0x1e00>
    }
f9000414:	00008067          	ret

f9000418 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9000418:	00c59593          	slli	a1,a1,0xc
f900041c:	00a585b3          	add	a1,a1,a0
f9000420:	00200537          	lui	a0,0x200
f9000424:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ffe04>
f9000428:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
f900042c:	0005a503          	lw	a0,0(a1)
    }
f9000430:	00008067          	ret

f9000434 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9000434:	00c59593          	slli	a1,a1,0xc
f9000438:	00a585b3          	add	a1,a1,a0
f900043c:	00200537          	lui	a0,0x200
f9000440:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ffe04>
f9000444:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f9000448:	00c5a023          	sw	a2,0(a1)
    }
f900044c:	00008067          	ret

f9000450 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f9000450:	fc010113          	addi	sp,sp,-64
f9000454:	00112e23          	sw	ra,28(sp)
f9000458:	00812c23          	sw	s0,24(sp)
f900045c:	00912a23          	sw	s1,20(sp)
f9000460:	00050493          	mv	s1,a0
f9000464:	02b12223          	sw	a1,36(sp)
f9000468:	02c12423          	sw	a2,40(sp)
f900046c:	02d12623          	sw	a3,44(sp)
f9000470:	02e12823          	sw	a4,48(sp)
f9000474:	02f12a23          	sw	a5,52(sp)
f9000478:	03012c23          	sw	a6,56(sp)
f900047c:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f9000480:	02410793          	addi	a5,sp,36
f9000484:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f9000488:	00000413          	li	s0,0
f900048c:	01c0006f          	j	f90004a8 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f9000490:	00c12783          	lw	a5,12(sp)
f9000494:	00478713          	addi	a4,a5,4
f9000498:	00e12623          	sw	a4,12(sp)
f900049c:	0007a503          	lw	a0,0(a5)
f90004a0:	dd1ff0ef          	jal	ra,f9000270 <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90004a4:	00140413          	addi	s0,s0,1
f90004a8:	008487b3          	add	a5,s1,s0
f90004ac:	0007c503          	lbu	a0,0(a5)
f90004b0:	0c050263          	beqz	a0,f9000574 <bsp_printf+0x124>
            if (format[i] == '%') {
f90004b4:	02500793          	li	a5,37
f90004b8:	06f50663          	beq	a0,a5,f9000524 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f90004bc:	db5ff0ef          	jal	ra,f9000270 <bsp_printf_c>
f90004c0:	fe5ff06f          	j	f90004a4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90004c4:	00c12783          	lw	a5,12(sp)
f90004c8:	00478713          	addi	a4,a5,4
f90004cc:	00e12623          	sw	a4,12(sp)
f90004d0:	0007a503          	lw	a0,0(a5)
f90004d4:	db9ff0ef          	jal	ra,f900028c <bsp_printf_s>
                        break;
f90004d8:	fcdff06f          	j	f90004a4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90004dc:	00c12783          	lw	a5,12(sp)
f90004e0:	00478713          	addi	a4,a5,4
f90004e4:	00e12623          	sw	a4,12(sp)
f90004e8:	0007a503          	lw	a0,0(a5)
f90004ec:	db9ff0ef          	jal	ra,f90002a4 <bsp_printf_d>
                        break;
f90004f0:	fb5ff06f          	j	f90004a4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f90004f4:	00c12783          	lw	a5,12(sp)
f90004f8:	00478713          	addi	a4,a5,4
f90004fc:	00e12623          	sw	a4,12(sp)
f9000500:	0007a503          	lw	a0,0(a5)
f9000504:	e61ff0ef          	jal	ra,f9000364 <bsp_printf_X>
                        break;
f9000508:	f9dff06f          	j	f90004a4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f900050c:	00c12783          	lw	a5,12(sp)
f9000510:	00478713          	addi	a4,a5,4
f9000514:	00e12623          	sw	a4,12(sp)
f9000518:	0007a503          	lw	a0,0(a5)
f900051c:	e09ff0ef          	jal	ra,f9000324 <bsp_printf_x>
                        break;
f9000520:	f85ff06f          	j	f90004a4 <bsp_printf+0x54>
                while (format[++i]) {
f9000524:	00140413          	addi	s0,s0,1
f9000528:	008487b3          	add	a5,s1,s0
f900052c:	0007c783          	lbu	a5,0(a5)
f9000530:	f6078ae3          	beqz	a5,f90004a4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000534:	06300713          	li	a4,99
f9000538:	f4e78ce3          	beq	a5,a4,f9000490 <bsp_printf+0x40>
                    else if (format[i] == 's') {
f900053c:	07300713          	li	a4,115
f9000540:	f8e782e3          	beq	a5,a4,f90004c4 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f9000544:	06400713          	li	a4,100
f9000548:	f8e78ae3          	beq	a5,a4,f90004dc <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f900054c:	05800713          	li	a4,88
f9000550:	fae782e3          	beq	a5,a4,f90004f4 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f9000554:	07800713          	li	a4,120
f9000558:	fae78ae3          	beq	a5,a4,f900050c <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f900055c:	06600713          	li	a4,102
f9000560:	fce792e3          	bne	a5,a4,f9000524 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000564:	f9000537          	lui	a0,0xf9000
f9000568:	7f850513          	addi	a0,a0,2040 # f90007f8 <__global_pointer$+0xfffff778>
f900056c:	d21ff0ef          	jal	ra,f900028c <bsp_printf_s>
                        break;
f9000570:	f35ff06f          	j	f90004a4 <bsp_printf+0x54>

        va_end(ap);
    }
f9000574:	01c12083          	lw	ra,28(sp)
f9000578:	01812403          	lw	s0,24(sp)
f900057c:	01412483          	lw	s1,20(sp)
f9000580:	04010113          	addi	sp,sp,64
f9000584:	00008067          	ret

f9000588 <error_state>:
*
* @brief This function prints error message on terminal and enters an infinite loop
*         to halt the program's execution.
*
******************************************************************************/
void error_state() {
f9000588:	ff010113          	addi	sp,sp,-16
f900058c:	00112623          	sw	ra,12(sp)
    bsp_printf("Failed! \r\n");
f9000590:	f9001537          	lui	a0,0xf9001
f9000594:	84450513          	addi	a0,a0,-1980 # f9000844 <__global_pointer$+0xfffff7c4>
f9000598:	eb9ff0ef          	jal	ra,f9000450 <bsp_printf>
    while (1) {}
f900059c:	0000006f          	j	f900059c <error_state+0x14>

f90005a0 <crash>:
*
* @brief This function handles the system crash scenario by printing a crash message
* 		 and entering an infinite loop.
*
******************************************************************************/
void crash(){
f90005a0:	ff010113          	addi	sp,sp,-16
f90005a4:	00112623          	sw	ra,12(sp)
    bsp_printf("\r\n*** CRASH ***\r\n");
f90005a8:	f9001537          	lui	a0,0xf9001
f90005ac:	85050513          	addi	a0,a0,-1968 # f9000850 <__global_pointer$+0xfffff7d0>
f90005b0:	ea1ff0ef          	jal	ra,f9000450 <bsp_printf>
    while(1);
f90005b4:	0000006f          	j	f90005b4 <crash+0x14>

f90005b8 <intr_init>:
*
* @brief This function initialize axi interrupt and set the machine trap 
*        vector.
*
******************************************************************************/
void intr_init(){
f90005b8:	ff010113          	addi	sp,sp,-16
f90005bc:	00112623          	sw	ra,12(sp)
    //configure PLIC
    //cpu 0 accept all interrupts with priority above 0
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); 
f90005c0:	00000613          	li	a2,0
f90005c4:	00000593          	li	a1,0
f90005c8:	f8c00537          	lui	a0,0xf8c00
f90005cc:	e35ff0ef          	jal	ra,f9000400 <plic_set_threshold>
    //enable SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT rising edge interrupt
#ifdef SYSTEM_AXI_A_BMB

    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT, 1);
f90005d0:	00100693          	li	a3,1
f90005d4:	01e00613          	li	a2,30
f90005d8:	00000593          	li	a1,0
f90005dc:	f8c00537          	lui	a0,0xf8c00
f90005e0:	dd5ff0ef          	jal	ra,f90003b4 <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT, 1);
f90005e4:	00100613          	li	a2,1
f90005e8:	01e00593          	li	a1,30
f90005ec:	f8c00537          	lui	a0,0xf8c00
f90005f0:	db5ff0ef          	jal	ra,f90003a4 <plic_set_priority>

#endif  
    //enable interrupts
    //Set the machine trap vector (../common/trap.S)
    csr_write(mtvec, trap_entry); 
f90005f4:	f90007b7          	lui	a5,0xf9000
f90005f8:	74078793          	addi	a5,a5,1856 # f9000740 <__global_pointer$+0xfffff6c0>
f90005fc:	30579073          	csrw	mtvec,a5
    //Enable external interrupts
    csr_set(mie, MIE_MEIE); 
f9000600:	000017b7          	lui	a5,0x1
f9000604:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size+0x600>
f9000608:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
f900060c:	300027f3          	csrr	a5,mstatus
f9000610:	00002737          	lui	a4,0x2
f9000614:	80870713          	addi	a4,a4,-2040 # 1808 <__stack_size+0x1608>
f9000618:	00e7e7b3          	or	a5,a5,a4
f900061c:	30079073          	csrw	mstatus,a5
}
f9000620:	00c12083          	lw	ra,12(sp)
f9000624:	01010113          	addi	sp,sp,16
f9000628:	00008067          	ret

f900062c <axiInterrupt>:
*
* @brief This function handles AXI interrupts by claiming pending interrupts 
* 		 and print the message regarding the claimed interrupt. 
*
******************************************************************************/
void axiInterrupt(){
f900062c:	ff010113          	addi	sp,sp,-16
f9000630:	00112623          	sw	ra,12(sp)
f9000634:	00812423          	sw	s0,8(sp)

    uint32_t claim;
    //While there is pending interrupts
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
f9000638:	00000593          	li	a1,0
f900063c:	f8c00537          	lui	a0,0xf8c00
f9000640:	dd9ff0ef          	jal	ra,f9000418 <plic_claim>
f9000644:	00050413          	mv	s0,a0
f9000648:	02050863          	beqz	a0,f9000678 <axiInterrupt+0x4c>
        switch(claim){
f900064c:	01e00793          	li	a5,30
f9000650:	02f41263          	bne	s0,a5,f9000674 <axiInterrupt+0x48>
#ifdef SYSTEM_AXI_A_BMB

        case SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT:
            bsp_printf("Entered AXI Interrupt Routine, Passed! \r\n");
f9000654:	f9001537          	lui	a0,0xf9001
f9000658:	86450513          	addi	a0,a0,-1948 # f9000864 <__global_pointer$+0xfffff7e4>
f900065c:	df5ff0ef          	jal	ra,f9000450 <bsp_printf>

#endif
        default: crash(); break;
        }
        //unmask the claimed interrupt
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
f9000660:	00040613          	mv	a2,s0
f9000664:	00000593          	li	a1,0
f9000668:	f8c00537          	lui	a0,0xf8c00
f900066c:	dc9ff0ef          	jal	ra,f9000434 <plic_release>
f9000670:	fc9ff06f          	j	f9000638 <axiInterrupt+0xc>
        default: crash(); break;
f9000674:	f2dff0ef          	jal	ra,f90005a0 <crash>
    }
}
f9000678:	00c12083          	lw	ra,12(sp)
f900067c:	00812403          	lw	s0,8(sp)
f9000680:	01010113          	addi	sp,sp,16
f9000684:	00008067          	ret

f9000688 <trap>:
void trap(){
f9000688:	ff010113          	addi	sp,sp,-16
f900068c:	00112623          	sw	ra,12(sp)
    int32_t mcause    = csr_read(mcause);
f9000690:	342027f3          	csrr	a5,mcause
    if(interrupt){
f9000694:	0207d263          	bgez	a5,f90006b8 <trap+0x30>
f9000698:	00f7f713          	andi	a4,a5,15
        switch(cause){
f900069c:	00b00793          	li	a5,11
f90006a0:	00f71a63          	bne	a4,a5,f90006b4 <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: axiInterrupt(); break;
f90006a4:	f89ff0ef          	jal	ra,f900062c <axiInterrupt>
}
f90006a8:	00c12083          	lw	ra,12(sp)
f90006ac:	01010113          	addi	sp,sp,16
f90006b0:	00008067          	ret
        default: crash(); break;
f90006b4:	eedff0ef          	jal	ra,f90005a0 <crash>
        crash();
f90006b8:	ee9ff0ef          	jal	ra,f90005a0 <crash>

f90006bc <main>:
* @brief This function perform write/read test for the internal BRAM and 
*        AXI4 slave interrupt is triggered when the data written to AXI bus is 
*        0xABCD. 
*
******************************************************************************/
void main() {
f90006bc:	fe010113          	addi	sp,sp,-32
f90006c0:	00112e23          	sw	ra,28(sp)
f90006c4:	00812c23          	sw	s0,24(sp)
f90006c8:	00912a23          	sw	s1,20(sp)
f90006cc:	01212823          	sw	s2,16(sp)
f90006d0:	01312623          	sw	s3,12(sp)
f90006d4:	01000437          	lui	s0,0x1000
f90006d8:	00042023          	sw	zero,0(s0) # 1000000 <__stack_size+0xfffe00>
    bsp_printf("axi4 slave is disabled, please enable it to run this app. \r\n");

#endif
*/
	 MY_LED_IP_mWriteReg(0x0, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG0_OFFSET );
	 bsp_uDelay(5000000);
f90006dc:	f8b00637          	lui	a2,0xf8b00
f90006e0:	013139b7          	lui	s3,0x1313
f90006e4:	d0098593          	addi	a1,s3,-768 # 1312d00 <__stack_size+0x1312b00>
f90006e8:	004c5937          	lui	s2,0x4c5
f90006ec:	b4090513          	addi	a0,s2,-1216 # 4c4b40 <__stack_size+0x4c4940>
f90006f0:	a51ff0ef          	jal	ra,f9000140 <clint_uDelay>
f90006f4:	00100493          	li	s1,1
f90006f8:	00942223          	sw	s1,4(s0)
	 MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG1_OFFSET );
	 bsp_uDelay(5000000);
f90006fc:	f8b00637          	lui	a2,0xf8b00
f9000700:	d0098593          	addi	a1,s3,-768
f9000704:	b4090513          	addi	a0,s2,-1216
f9000708:	a39ff0ef          	jal	ra,f9000140 <clint_uDelay>
f900070c:	00942423          	sw	s1,8(s0)
	 MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG2_OFFSET );
	 bsp_uDelay(5000000);
f9000710:	f8b00637          	lui	a2,0xf8b00
f9000714:	d0098593          	addi	a1,s3,-768
f9000718:	b4090513          	addi	a0,s2,-1216
f900071c:	a25ff0ef          	jal	ra,f9000140 <clint_uDelay>
f9000720:	00942623          	sw	s1,12(s0)
	 MY_LED_IP_mWriteReg(0x1, SYSTEM_AXI_A_BMB,MY_LED_IP_S00_AXI_SLV_REG3_OFFSET );

}
f9000724:	01c12083          	lw	ra,28(sp)
f9000728:	01812403          	lw	s0,24(sp)
f900072c:	01412483          	lw	s1,20(sp)
f9000730:	01012903          	lw	s2,16(sp)
f9000734:	00c12983          	lw	s3,12(sp)
f9000738:	02010113          	addi	sp,sp,32
f900073c:	00008067          	ret

f9000740 <trap_entry>:
.global  trap_entry
.align(2) //mtvec require 32 bits allignement
trap_entry:
  addi sp,sp, -16*4
f9000740:	fc010113          	addi	sp,sp,-64
  sw x1,   0*4(sp)
f9000744:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
f9000748:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
f900074c:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
f9000750:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
f9000754:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
f9000758:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
f900075c:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
f9000760:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
f9000764:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
f9000768:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
f900076c:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
f9000770:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
f9000774:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
f9000778:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
f900077c:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
f9000780:	03f12e23          	sw	t6,60(sp)
  call trap
f9000784:	f05ff0ef          	jal	ra,f9000688 <trap>
  lw x1 ,  0*4(sp)
f9000788:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
f900078c:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
f9000790:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
f9000794:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
f9000798:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
f900079c:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
f90007a0:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
f90007a4:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
f90007a8:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
f90007ac:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
f90007b0:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
f90007b4:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
f90007b8:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
f90007bc:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
f90007c0:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
f90007c4:	03c12f83          	lw	t6,60(sp)
  addi sp,sp, 16*4
f90007c8:	04010113          	addi	sp,sp,64
  mret
f90007cc:	30200073          	mret
