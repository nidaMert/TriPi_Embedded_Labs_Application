
build/apb3Demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	dd818193          	addi	gp,gp,-552 # f9000dd8 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	a2818113          	addi	sp,gp,-1496 # f9000800 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	55c50513          	addi	a0,a0,1372 # f9000568 <_data>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	55458593          	addi	a1,a1,1364 # f9000568 <_data>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f90005f4 <owrite_crtl>
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
f9000038:	81c18513          	addi	a0,gp,-2020 # f90005f4 <owrite_crtl>
	la a1, _end
f900003c:	82818593          	addi	a1,gp,-2008 # f9000600 <_end>
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
f9000054:	498000ef          	jal	ra,f90004ec <main>

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
f9000070:	4fc40413          	addi	s0,s0,1276 # f9000568 <_data>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	4f490913          	addi	s2,s2,1268 # f9000568 <_data>
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
f90000ac:	4c040413          	addi	s0,s0,1216 # f9000568 <_data>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	4b890913          	addi	s2,s2,1208 # f9000568 <_data>
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

f9000140 <_putchar>:
* @note If semihosting printing is enabled (ENABLE_SEMIHOSTING_PRINT == 1),
*       the character is output using the semihosting function sh_writec().
*       Otherwise, the character is output using the BSP function bsp_putChar().
*
*******************************************************************************/
    static void _putchar(char character){
f9000140:	ff010113          	addi	sp,sp,-16
f9000144:	00112623          	sw	ra,12(sp)
        #if (ENABLE_SEMIHOSTING_PRINT == 1)
            sh_writec(character);
        #else
            bsp_putChar(character);
f9000148:	00050593          	mv	a1,a0
f900014c:	f8010537          	lui	a0,0xf8010
f9000150:	fb5ff0ef          	jal	ra,f9000104 <uart_write>
        #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000154:	00c12083          	lw	ra,12(sp)
f9000158:	01010113          	addi	sp,sp,16
f900015c:	00008067          	ret

f9000160 <_putchar_s>:
*       the character is output using the semihosting function sh_write0().
*       Otherwise, the character is output using the BSP function _putChar().
*
*******************************************************************************/
    static void _putchar_s(char *p)
    {
f9000160:	ff010113          	addi	sp,sp,-16
f9000164:	00112623          	sw	ra,12(sp)
f9000168:	00812423          	sw	s0,8(sp)
f900016c:	00050413          	mv	s0,a0
    #if (ENABLE_SEMIHOSTING_PRINT == 1)
        sh_write0(p);
    #else
        while (*p)
f9000170:	00044503          	lbu	a0,0(s0)
f9000174:	00050863          	beqz	a0,f9000184 <_putchar_s+0x24>
            _putchar(*(p++));
f9000178:	00140413          	addi	s0,s0,1
f900017c:	fc5ff0ef          	jal	ra,f9000140 <_putchar>
f9000180:	ff1ff06f          	j	f9000170 <_putchar_s+0x10>
    #endif // (ENABLE_SEMIHOSTING_PRINT == 1)
    }
f9000184:	00c12083          	lw	ra,12(sp)
f9000188:	00812403          	lw	s0,8(sp)
f900018c:	01010113          	addi	sp,sp,16
f9000190:	00008067          	ret

f9000194 <bsp_printHex>:
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    //bsp_printHex is used in BSP_PRINTF
    static void bsp_printHex(uint32_t val)
    {
f9000194:	ff010113          	addi	sp,sp,-16
f9000198:	00112623          	sw	ra,12(sp)
f900019c:	00812423          	sw	s0,8(sp)
f90001a0:	00912223          	sw	s1,4(sp)
f90001a4:	00050493          	mv	s1,a0
        uint32_t digits;
        digits =8;

        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001a8:	01c00413          	li	s0,28
f90001ac:	0240006f          	j	f90001d0 <bsp_printHex+0x3c>
            _putchar("0123456789ABCDEF"[(val >> i) % 16]);
f90001b0:	0084d7b3          	srl	a5,s1,s0
f90001b4:	00f7f713          	andi	a4,a5,15
f90001b8:	f90007b7          	lui	a5,0xf9000
f90001bc:	56878793          	addi	a5,a5,1384 # f9000568 <__global_pointer$+0xfffff790>
f90001c0:	00e787b3          	add	a5,a5,a4
f90001c4:	0007c503          	lbu	a0,0(a5)
f90001c8:	f79ff0ef          	jal	ra,f9000140 <_putchar>
        for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001cc:	ffc40413          	addi	s0,s0,-4
f90001d0:	fe0450e3          	bgez	s0,f90001b0 <bsp_printHex+0x1c>
        }
    }
f90001d4:	00c12083          	lw	ra,12(sp)
f90001d8:	00812403          	lw	s0,8(sp)
f90001dc:	00412483          	lw	s1,4(sp)
f90001e0:	01010113          	addi	sp,sp,16
f90001e4:	00008067          	ret

f90001e8 <bsp_printHex_lower>:
*
* @note The function iterates over each nibble (4 bits) of the value and prints the corresponding hexadecimal character.
*
*******************************************************************************/
    static void bsp_printHex_lower(uint32_t val)
        {
f90001e8:	ff010113          	addi	sp,sp,-16
f90001ec:	00112623          	sw	ra,12(sp)
f90001f0:	00812423          	sw	s0,8(sp)
f90001f4:	00912223          	sw	s1,4(sp)
f90001f8:	00050493          	mv	s1,a0
            uint32_t digits;
            digits =8;

            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f90001fc:	01c00413          	li	s0,28
f9000200:	0240006f          	j	f9000224 <bsp_printHex_lower+0x3c>
                _putchar("0123456789abcdef"[(val >> i) % 16]);
f9000204:	0084d7b3          	srl	a5,s1,s0
f9000208:	00f7f713          	andi	a4,a5,15
f900020c:	f90007b7          	lui	a5,0xf9000
f9000210:	57c78793          	addi	a5,a5,1404 # f900057c <__global_pointer$+0xfffff7a4>
f9000214:	00e787b3          	add	a5,a5,a4
f9000218:	0007c503          	lbu	a0,0(a5)
f900021c:	f25ff0ef          	jal	ra,f9000140 <_putchar>
            for (int i = (4*digits)-4; i >= 0; i -= 4) {
f9000220:	ffc40413          	addi	s0,s0,-4
f9000224:	fe0450e3          	bgez	s0,f9000204 <bsp_printHex_lower+0x1c>

            }
        }
f9000228:	00c12083          	lw	ra,12(sp)
f900022c:	00812403          	lw	s0,8(sp)
f9000230:	00412483          	lw	s1,4(sp)
f9000234:	01010113          	addi	sp,sp,16
f9000238:	00008067          	ret

f900023c <bsp_printf_c>:
*
* @param c: The character to be output.
*
******************************************************************************/
    static void bsp_printf_c(int c)
    {
f900023c:	ff010113          	addi	sp,sp,-16
f9000240:	00112623          	sw	ra,12(sp)
        _putchar(c);
f9000244:	0ff57513          	andi	a0,a0,255
f9000248:	ef9ff0ef          	jal	ra,f9000140 <_putchar>
    }
f900024c:	00c12083          	lw	ra,12(sp)
f9000250:	01010113          	addi	sp,sp,16
f9000254:	00008067          	ret

f9000258 <bsp_printf_s>:
*
* @param s: A pointer to the null-terminated string to be output.
*
*******************************************************************************/
    static void bsp_printf_s(char *p)
    {
f9000258:	ff010113          	addi	sp,sp,-16
f900025c:	00112623          	sw	ra,12(sp)
        _putchar_s(p);
f9000260:	f01ff0ef          	jal	ra,f9000160 <_putchar_s>
    }
f9000264:	00c12083          	lw	ra,12(sp)
f9000268:	01010113          	addi	sp,sp,16
f900026c:	00008067          	ret

f9000270 <bsp_printf_d>:
* - Handles negative numbers by printing a '-' sign.
* - Uses the 'bsp_printf_c' function to print each character.
*
******************************************************************************/
    static void bsp_printf_d(int val)
    {
f9000270:	fd010113          	addi	sp,sp,-48
f9000274:	02112623          	sw	ra,44(sp)
f9000278:	02812423          	sw	s0,40(sp)
f900027c:	02912223          	sw	s1,36(sp)
f9000280:	00050493          	mv	s1,a0
        char buffer[32];
        char *p = buffer;
        if (val < 0) {
f9000284:	00054663          	bltz	a0,f9000290 <bsp_printf_d+0x20>
    {
f9000288:	00010413          	mv	s0,sp
f900028c:	02c0006f          	j	f90002b8 <bsp_printf_d+0x48>
            bsp_printf_c('-');
f9000290:	02d00513          	li	a0,45
f9000294:	fa9ff0ef          	jal	ra,f900023c <bsp_printf_c>
            val = -val;
f9000298:	409004b3          	neg	s1,s1
f900029c:	fedff06f          	j	f9000288 <bsp_printf_d+0x18>
        }
        while (val || p == buffer) {
            *(p++) = '0' + val % 10;
f90002a0:	00a00713          	li	a4,10
f90002a4:	02e4e7b3          	rem	a5,s1,a4
f90002a8:	03078793          	addi	a5,a5,48
f90002ac:	00f40023          	sb	a5,0(s0)
            val = val / 10;
f90002b0:	02e4c4b3          	div	s1,s1,a4
            *(p++) = '0' + val % 10;
f90002b4:	00140413          	addi	s0,s0,1
        while (val || p == buffer) {
f90002b8:	fe0494e3          	bnez	s1,f90002a0 <bsp_printf_d+0x30>
f90002bc:	00010793          	mv	a5,sp
f90002c0:	fef400e3          	beq	s0,a5,f90002a0 <bsp_printf_d+0x30>
f90002c4:	0100006f          	j	f90002d4 <bsp_printf_d+0x64>
        }
        while (p != buffer)
            bsp_printf_c(*(--p));
f90002c8:	fff40413          	addi	s0,s0,-1
f90002cc:	00044503          	lbu	a0,0(s0)
f90002d0:	f6dff0ef          	jal	ra,f900023c <bsp_printf_c>
        while (p != buffer)
f90002d4:	00010793          	mv	a5,sp
f90002d8:	fef418e3          	bne	s0,a5,f90002c8 <bsp_printf_d+0x58>
    }
f90002dc:	02c12083          	lw	ra,44(sp)
f90002e0:	02812403          	lw	s0,40(sp)
f90002e4:	02412483          	lw	s1,36(sp)
f90002e8:	03010113          	addi	sp,sp,48
f90002ec:	00008067          	ret

f90002f0 <bsp_printf_x>:
* - Calls 'bsp_printHex_lower' to print the hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_x(int val)
    {
f90002f0:	ff010113          	addi	sp,sp,-16
f90002f4:	00112623          	sw	ra,12(sp)
        int i,digi=2;

        for(i=0;i<8;i++)
f90002f8:	00000713          	li	a4,0
f90002fc:	00700793          	li	a5,7
f9000300:	02e7c063          	blt	a5,a4,f9000320 <bsp_printf_x+0x30>
        {
            if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000304:	00271693          	slli	a3,a4,0x2
f9000308:	ff000793          	li	a5,-16
f900030c:	00d797b3          	sll	a5,a5,a3
f9000310:	00f577b3          	and	a5,a0,a5
f9000314:	00078663          	beqz	a5,f9000320 <bsp_printf_x+0x30>
        for(i=0;i<8;i++)
f9000318:	00170713          	addi	a4,a4,1
f900031c:	fe1ff06f          	j	f90002fc <bsp_printf_x+0xc>
            {
                digi=i+1;
                break;
            }
        }
        bsp_printHex_lower(val);
f9000320:	ec9ff0ef          	jal	ra,f90001e8 <bsp_printHex_lower>
    }
f9000324:	00c12083          	lw	ra,12(sp)
f9000328:	01010113          	addi	sp,sp,16
f900032c:	00008067          	ret

f9000330 <bsp_printf_X>:
* - Calls 'bsp_printHex' to print the uppercase hexadecimal representation.
* - Determines the number of leading zeros to be printed based on the value.
*
******************************************************************************/
    static void bsp_printf_X(int val)
        {
f9000330:	ff010113          	addi	sp,sp,-16
f9000334:	00112623          	sw	ra,12(sp)
            int i,digi=2;

            for(i=0;i<8;i++)
f9000338:	00000713          	li	a4,0
f900033c:	00700793          	li	a5,7
f9000340:	02e7c063          	blt	a5,a4,f9000360 <bsp_printf_X+0x30>
            {
                if((val & (0xFFFFFFF0 <<(4*i))) == 0)
f9000344:	00271693          	slli	a3,a4,0x2
f9000348:	ff000793          	li	a5,-16
f900034c:	00d797b3          	sll	a5,a5,a3
f9000350:	00f577b3          	and	a5,a0,a5
f9000354:	00078663          	beqz	a5,f9000360 <bsp_printf_X+0x30>
            for(i=0;i<8;i++)
f9000358:	00170713          	addi	a4,a4,1
f900035c:	fe1ff06f          	j	f900033c <bsp_printf_X+0xc>
                {
                    digi=i+1;
                    break;
                }
            }
            bsp_printHex(val);
f9000360:	e35ff0ef          	jal	ra,f9000194 <bsp_printHex>
        }
f9000364:	00c12083          	lw	ra,12(sp)
f9000368:	01010113          	addi	sp,sp,16
f900036c:	00008067          	ret

f9000370 <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f9000370:	fc010113          	addi	sp,sp,-64
f9000374:	00112e23          	sw	ra,28(sp)
f9000378:	00812c23          	sw	s0,24(sp)
f900037c:	00912a23          	sw	s1,20(sp)
f9000380:	00050493          	mv	s1,a0
f9000384:	02b12223          	sw	a1,36(sp)
f9000388:	02c12423          	sw	a2,40(sp)
f900038c:	02d12623          	sw	a3,44(sp)
f9000390:	02e12823          	sw	a4,48(sp)
f9000394:	02f12a23          	sw	a5,52(sp)
f9000398:	03012c23          	sw	a6,56(sp)
f900039c:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f90003a0:	02410793          	addi	a5,sp,36
f90003a4:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f90003a8:	00000413          	li	s0,0
f90003ac:	01c0006f          	j	f90003c8 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f90003b0:	00c12783          	lw	a5,12(sp)
f90003b4:	00478713          	addi	a4,a5,4
f90003b8:	00e12623          	sw	a4,12(sp)
f90003bc:	0007a503          	lw	a0,0(a5)
f90003c0:	e7dff0ef          	jal	ra,f900023c <bsp_printf_c>
        for (i = 0; format[i]; i++)
f90003c4:	00140413          	addi	s0,s0,1
f90003c8:	008487b3          	add	a5,s1,s0
f90003cc:	0007c503          	lbu	a0,0(a5)
f90003d0:	0c050263          	beqz	a0,f9000494 <bsp_printf+0x124>
            if (format[i] == '%') {
f90003d4:	02500793          	li	a5,37
f90003d8:	06f50663          	beq	a0,a5,f9000444 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f90003dc:	e61ff0ef          	jal	ra,f900023c <bsp_printf_c>
f90003e0:	fe5ff06f          	j	f90003c4 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f90003e4:	00c12783          	lw	a5,12(sp)
f90003e8:	00478713          	addi	a4,a5,4
f90003ec:	00e12623          	sw	a4,12(sp)
f90003f0:	0007a503          	lw	a0,0(a5)
f90003f4:	e65ff0ef          	jal	ra,f9000258 <bsp_printf_s>
                        break;
f90003f8:	fcdff06f          	j	f90003c4 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90003fc:	00c12783          	lw	a5,12(sp)
f9000400:	00478713          	addi	a4,a5,4
f9000404:	00e12623          	sw	a4,12(sp)
f9000408:	0007a503          	lw	a0,0(a5)
f900040c:	e65ff0ef          	jal	ra,f9000270 <bsp_printf_d>
                        break;
f9000410:	fb5ff06f          	j	f90003c4 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f9000414:	00c12783          	lw	a5,12(sp)
f9000418:	00478713          	addi	a4,a5,4
f900041c:	00e12623          	sw	a4,12(sp)
f9000420:	0007a503          	lw	a0,0(a5)
f9000424:	f0dff0ef          	jal	ra,f9000330 <bsp_printf_X>
                        break;
f9000428:	f9dff06f          	j	f90003c4 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f900042c:	00c12783          	lw	a5,12(sp)
f9000430:	00478713          	addi	a4,a5,4
f9000434:	00e12623          	sw	a4,12(sp)
f9000438:	0007a503          	lw	a0,0(a5)
f900043c:	eb5ff0ef          	jal	ra,f90002f0 <bsp_printf_x>
                        break;
f9000440:	f85ff06f          	j	f90003c4 <bsp_printf+0x54>
                while (format[++i]) {
f9000444:	00140413          	addi	s0,s0,1
f9000448:	008487b3          	add	a5,s1,s0
f900044c:	0007c783          	lbu	a5,0(a5)
f9000450:	f6078ae3          	beqz	a5,f90003c4 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000454:	06300713          	li	a4,99
f9000458:	f4e78ce3          	beq	a5,a4,f90003b0 <bsp_printf+0x40>
                    else if (format[i] == 's') {
f900045c:	07300713          	li	a4,115
f9000460:	f8e782e3          	beq	a5,a4,f90003e4 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f9000464:	06400713          	li	a4,100
f9000468:	f8e78ae3          	beq	a5,a4,f90003fc <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f900046c:	05800713          	li	a4,88
f9000470:	fae782e3          	beq	a5,a4,f9000414 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f9000474:	07800713          	li	a4,120
f9000478:	fae78ae3          	beq	a5,a4,f900042c <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f900047c:	06600713          	li	a4,102
f9000480:	fce792e3          	bne	a5,a4,f9000444 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000484:	f9000537          	lui	a0,0xf9000
f9000488:	59050513          	addi	a0,a0,1424 # f9000590 <__global_pointer$+0xfffff7b8>
f900048c:	dcdff0ef          	jal	ra,f9000258 <bsp_printf_s>
                        break;
f9000490:	f35ff06f          	j	f90003c4 <bsp_printf+0x54>

        va_end(ap);
    }
f9000494:	01c12083          	lw	ra,28(sp)
f9000498:	01812403          	lw	s0,24(sp)
f900049c:	01412483          	lw	s1,20(sp)
f90004a0:	04010113          	addi	sp,sp,64
f90004a4:	00008067          	ret

f90004a8 <apb3_read>:
        return *((volatile u32*) address);
f90004a8:	00052503          	lw	a0,0(a0)
*
******************************************************************************/
	u32 apb3_read(u32 slave)
	{
		return read_u32(slave+EXAMPLE_APB3_SLV_REG0_OFFSET);	
	}
f90004ac:	00008067          	ret

f90004b0 <apb3_ctrl_write>:
* @param ctrl_reg* Control register.
*
******************************************************************************/   
	void apb3_ctrl_write(u32 slave, struct ctrl_reg *cfg)
	{
	    write_u32(*(int *)cfg, slave+EXAMPLE_APB3_SLV_REG1_OFFSET);
f90004b0:	0005a783          	lw	a5,0(a1)
        *((volatile u32*) address) = data;
f90004b4:	00f52223          	sw	a5,4(a0)
	}
f90004b8:	00008067          	ret

f90004bc <cfg_write>:
* @param ctrl_reg* Control register.
*
******************************************************************************/ 
	void cfg_write(u32 slave, struct ctrl_reg2 *cfg)
	{
		write_u32(*(int *)cfg, slave+EXAMPLE_APB3_SLV_REG3_OFFSET);
f90004bc:	0005a783          	lw	a5,0(a1)
f90004c0:	00f52623          	sw	a5,12(a0)
	}
f90004c4:	00008067          	ret

f90004c8 <cfg_data>:
f90004c8:	00b52823          	sw	a1,16(a0)
*
******************************************************************************/ 
	void cfg_data(u32 slave, u32 data)
	{
		write_u32(data, slave+EXAMPLE_APB3_SLV_REG4_OFFSET);
	}
f90004cc:	00008067          	ret

f90004d0 <cfg_addr>:
f90004d0:	00b52a23          	sw	a1,20(a0)
*
******************************************************************************/ 
	void cfg_addr(u32 slave, u32  addr)
	{
		write_u32(addr, slave+EXAMPLE_APB3_SLV_REG5_OFFSET);
	}
f90004d4:	00008067          	ret

f90004d8 <error_state>:
*
* @brief This function prints error message on terminal and enters an infinite loop
*         to halt the program's execution.
*
******************************************************************************/
void error_state() {
f90004d8:	ff010113          	addi	sp,sp,-16
f90004dc:	00112623          	sw	ra,12(sp)
    bsp_printf("Failed! \r\n");
f90004e0:	80418513          	addi	a0,gp,-2044 # f90005dc <_data+0x74>
f90004e4:	e8dff0ef          	jal	ra,f9000370 <bsp_printf>
    while (1) {}
f90004e8:	0000006f          	j	f90004e8 <error_state+0x10>

f90004ec <main>:
        return *((volatile u32*) address);
f90004ec:	f81007b7          	lui	a5,0xf8100
f90004f0:	0047a703          	lw	a4,4(a5) # f8100004 <__global_pointer$+0xff0ff22c>
//
//#endif
	bsp_init();
	while (1){

		if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == (BTN_2 + BTN_1) ){		//read_u32(0xf8100000 + 0x4) == 0x3 --> write_u32(0x8, 0xf8100000 + 0x0)
f90004f4:	00300793          	li	a5,3
f90004f8:	04f70063          	beq	a4,a5,f9000538 <main+0x4c>
f90004fc:	f81007b7          	lui	a5,0xf8100
f9000500:	0047a703          	lw	a4,4(a5) # f8100004 <__global_pointer$+0xff0ff22c>
	        write_u32(0x8,IO_APB_SLAVE_0_INPUT + LED_REG);}						//butonlara aynı anda basıldığında led3 yansın isteniyor. kartta led3'ün
																				//yanması için yazılması gereken değer 0x8'dir.
	    if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == BTN_1 ){
f9000504:	00100793          	li	a5,1
f9000508:	04f70063          	beq	a4,a5,f9000548 <main+0x5c>
f900050c:	f81007b7          	lui	a5,0xf8100
f9000510:	0047a703          	lw	a4,4(a5) # f8100004 <__global_pointer$+0xff0ff22c>
	        write_u32(0x2,IO_APB_SLAVE_0_INPUT + LED_REG);}						//led1'in yanması için adrese yazılması gereken değer 0x2'dir.

	    if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == BTN_2 ){
f9000514:	00200793          	li	a5,2
f9000518:	04f70063          	beq	a4,a5,f9000558 <main+0x6c>
f900051c:	f81007b7          	lui	a5,0xf8100
f9000520:	0047a783          	lw	a5,4(a5) # f8100004 <__global_pointer$+0xff0ff22c>
	        write_u32(0x1,IO_APB_SLAVE_0_INPUT + LED_REG);}						//led2'in yanması için adrese yazılması gereken değer 0x1'dir.

	    if(read_u32(IO_APB_SLAVE_0_INPUT + BTN_REG) == 0 ){
f9000524:	fc0794e3          	bnez	a5,f90004ec <main>
        *((volatile u32*) address) = data;
f9000528:	f81007b7          	lui	a5,0xf8100
f900052c:	00400713          	li	a4,4
f9000530:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff228>
f9000534:	fb9ff06f          	j	f90004ec <main>
f9000538:	f81007b7          	lui	a5,0xf8100
f900053c:	00800713          	li	a4,8
f9000540:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff228>
f9000544:	fb9ff06f          	j	f90004fc <main+0x10>
f9000548:	f81007b7          	lui	a5,0xf8100
f900054c:	00200713          	li	a4,2
f9000550:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff228>
f9000554:	fb9ff06f          	j	f900050c <main+0x20>
f9000558:	f81007b7          	lui	a5,0xf8100
f900055c:	00100713          	li	a4,1
f9000560:	00e7a023          	sw	a4,0(a5) # f8100000 <__global_pointer$+0xff0ff228>
f9000564:	fb9ff06f          	j	f900051c <main+0x30>
