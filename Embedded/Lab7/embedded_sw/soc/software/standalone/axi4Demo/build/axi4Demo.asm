
build/axi4Demo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:

_start:
#ifdef USE_GP
.option push
.option norelax
	la gp, __global_pointer$
f9000000:	00001197          	auipc	gp,0x1
f9000004:	fe018193          	addi	gp,gp,-32 # f9000fe0 <__global_pointer$>

f9000008 <init>:
	sw a0, smp_lottery_lock, a1
    ret
#endif

init:
	la sp, _sp
f9000008:	a2018113          	addi	sp,gp,-1504 # f9000a00 <__freertos_irq_stack_top>

	/* Load data section */
	la a0, _data_lma
f900000c:	00000517          	auipc	a0,0x0
f9000010:	72450513          	addi	a0,a0,1828 # f9000730 <_data>
	la a1, _data
f9000014:	00000597          	auipc	a1,0x0
f9000018:	71c58593          	addi	a1,a1,1820 # f9000730 <_data>
	la a2, _edata
f900001c:	81c18613          	addi	a2,gp,-2020 # f90007fc <__bss_start>
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
f9000038:	81c18513          	addi	a0,gp,-2020 # f90007fc <__bss_start>
	la a1, _end
f900003c:	82018593          	addi	a1,gp,-2016 # f9000800 <_end>
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
f9000054:	634000ef          	jal	ra,f9000688 <main>

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
f9000070:	6c440413          	addi	s0,s0,1732 # f9000730 <_data>
f9000074:	00000917          	auipc	s2,0x0
f9000078:	6bc90913          	addi	s2,s2,1724 # f9000730 <_data>
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
f90000ac:	68840413          	addi	s0,s0,1672 # f9000730 <_data>
f90000b0:	00000917          	auipc	s2,0x0
f90000b4:	68090913          	addi	s2,s2,1664 # f9000730 <_data>
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
f90001bc:	73078793          	addi	a5,a5,1840 # f9000730 <__global_pointer$+0xfffff750>
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
f9000210:	74478793          	addi	a5,a5,1860 # f9000744 <__global_pointer$+0xfffff764>
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

f9000370 <plic_set_priority>:
*          specified priority value to the calculated address, effectively
*          setting the priority for the specified interrupt gateway in the PLIC.
*
******************************************************************************/
    static void plic_set_priority(u32 plic, u32 gateway, u32 priority){
        write_u32(priority, plic + PLIC_PRIORITY_BASE + gateway*4);
f9000370:	00259593          	slli	a1,a1,0x2
f9000374:	00a585b3          	add	a1,a1,a0
f9000378:	00c5a023          	sw	a2,0(a1)
    }
f900037c:	00008067          	ret

f9000380 <plic_set_enable>:
*          to the enable register.
*
******************************************************************************/

    static void plic_set_enable(u32 plic, u32 target,u32 gateway, u32 enable){
        u32 word = plic + PLIC_ENABLE_BASE + target * PLIC_ENABLE_PER_HART + (gateway / 32 * 4);
f9000380:	00759593          	slli	a1,a1,0x7
f9000384:	00a58533          	add	a0,a1,a0
f9000388:	00565593          	srli	a1,a2,0x5
f900038c:	00259593          	slli	a1,a1,0x2
f9000390:	00b50533          	add	a0,a0,a1
f9000394:	000025b7          	lui	a1,0x2
f9000398:	00b50533          	add	a0,a0,a1
        u32 mask = 1 << (gateway % 32);
f900039c:	00100793          	li	a5,1
f90003a0:	00c797b3          	sll	a5,a5,a2
        if (enable)
f90003a4:	00068a63          	beqz	a3,f90003b8 <plic_set_enable+0x38>
        return *((volatile u32*) address);
f90003a8:	00052603          	lw	a2,0(a0) # f8010000 <__global_pointer$+0xff00f020>
            write_u32(read_u32(word) | mask, word);
f90003ac:	00c7e7b3          	or	a5,a5,a2
        *((volatile u32*) address) = data;
f90003b0:	00f52023          	sw	a5,0(a0)
f90003b4:	00008067          	ret
        return *((volatile u32*) address);
f90003b8:	00052603          	lw	a2,0(a0)
        else
            write_u32(read_u32(word) & ~mask, word);
f90003bc:	fff7c793          	not	a5,a5
f90003c0:	00c7f7b3          	and	a5,a5,a2
        *((volatile u32*) address) = data;
f90003c4:	00f52023          	sw	a5,0(a0)
    }
f90003c8:	00008067          	ret

f90003cc <plic_set_threshold>:
*          to the calculated address, effectively setting the threshold for the
*          specified target in the PLIC.
*
******************************************************************************/   
    static void plic_set_threshold(u32 plic, u32 target, u32 threshold){
        write_u32(threshold, plic + PLIC_THRESHOLD_BASE + target*PLIC_CONTEXT_PER_HART);
f90003cc:	00c59593          	slli	a1,a1,0xc
f90003d0:	00a585b3          	add	a1,a1,a0
f90003d4:	00200537          	lui	a0,0x200
f90003d8:	00a585b3          	add	a1,a1,a0
f90003dc:	00c5a023          	sw	a2,0(a1) # 2000 <__stack_size+0x1e00>
    }
f90003e0:	00008067          	ret

f90003e4 <plic_claim>:
*          value from the calculated address, effectively claiming an interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static u32 plic_claim(u32 plic, u32 target){
        return read_u32(plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f90003e4:	00c59593          	slli	a1,a1,0xc
f90003e8:	00a585b3          	add	a1,a1,a0
f90003ec:	00200537          	lui	a0,0x200
f90003f0:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ffe04>
f90003f4:	00a585b3          	add	a1,a1,a0
        return *((volatile u32*) address);
f90003f8:	0005a503          	lw	a0,0(a1)
    }
f90003fc:	00008067          	ret

f9000400 <plic_release>:
*          to the calculated address, effectively releasing the claimed interrupt
*          for the specified target in the PLIC.
*
******************************************************************************/
    static void plic_release(u32 plic, u32 target, u32 gateway){
        write_u32(gateway,plic + PLIC_CLAIM_BASE + target*PLIC_CONTEXT_PER_HART);
f9000400:	00c59593          	slli	a1,a1,0xc
f9000404:	00a585b3          	add	a1,a1,a0
f9000408:	00200537          	lui	a0,0x200
f900040c:	00450513          	addi	a0,a0,4 # 200004 <__stack_size+0x1ffe04>
f9000410:	00a585b3          	add	a1,a1,a0
        *((volatile u32*) address) = data;
f9000414:	00c5a023          	sw	a2,0(a1)
    }
f9000418:	00008067          	ret

f900041c <bsp_printf>:
* - Handles each format specifier by calling the appropriate helper function.
* - If floating-point support is disabled, prints a warning for the 'f' specifier.
*
******************************************************************************/
    static void bsp_printf(const char *format, ...)
    {
f900041c:	fc010113          	addi	sp,sp,-64
f9000420:	00112e23          	sw	ra,28(sp)
f9000424:	00812c23          	sw	s0,24(sp)
f9000428:	00912a23          	sw	s1,20(sp)
f900042c:	00050493          	mv	s1,a0
f9000430:	02b12223          	sw	a1,36(sp)
f9000434:	02c12423          	sw	a2,40(sp)
f9000438:	02d12623          	sw	a3,44(sp)
f900043c:	02e12823          	sw	a4,48(sp)
f9000440:	02f12a23          	sw	a5,52(sp)
f9000444:	03012c23          	sw	a6,56(sp)
f9000448:	03112e23          	sw	a7,60(sp)
        int i;
        va_list ap;

        va_start(ap, format);
f900044c:	02410793          	addi	a5,sp,36
f9000450:	00f12623          	sw	a5,12(sp)

        for (i = 0; format[i]; i++)
f9000454:	00000413          	li	s0,0
f9000458:	01c0006f          	j	f9000474 <bsp_printf+0x58>
            if (format[i] == '%') {
                while (format[++i]) {
                    if (format[i] == 'c') {
                        bsp_printf_c(va_arg(ap,int));
f900045c:	00c12783          	lw	a5,12(sp)
f9000460:	00478713          	addi	a4,a5,4
f9000464:	00e12623          	sw	a4,12(sp)
f9000468:	0007a503          	lw	a0,0(a5)
f900046c:	dd1ff0ef          	jal	ra,f900023c <bsp_printf_c>
        for (i = 0; format[i]; i++)
f9000470:	00140413          	addi	s0,s0,1
f9000474:	008487b3          	add	a5,s1,s0
f9000478:	0007c503          	lbu	a0,0(a5)
f900047c:	0c050263          	beqz	a0,f9000540 <bsp_printf+0x124>
            if (format[i] == '%') {
f9000480:	02500793          	li	a5,37
f9000484:	06f50663          	beq	a0,a5,f90004f0 <bsp_printf+0xd4>
                        break;
                    }
#endif //#if (ENABLE_FLOATING_POINT_SUPPORT)
                }
            } else
                bsp_printf_c(format[i]);
f9000488:	db5ff0ef          	jal	ra,f900023c <bsp_printf_c>
f900048c:	fe5ff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_s(va_arg(ap,char*));
f9000490:	00c12783          	lw	a5,12(sp)
f9000494:	00478713          	addi	a4,a5,4
f9000498:	00e12623          	sw	a4,12(sp)
f900049c:	0007a503          	lw	a0,0(a5)
f90004a0:	db9ff0ef          	jal	ra,f9000258 <bsp_printf_s>
                        break;
f90004a4:	fcdff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_d(va_arg(ap,int));
f90004a8:	00c12783          	lw	a5,12(sp)
f90004ac:	00478713          	addi	a4,a5,4
f90004b0:	00e12623          	sw	a4,12(sp)
f90004b4:	0007a503          	lw	a0,0(a5)
f90004b8:	db9ff0ef          	jal	ra,f9000270 <bsp_printf_d>
                        break;
f90004bc:	fb5ff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_X(va_arg(ap,int));
f90004c0:	00c12783          	lw	a5,12(sp)
f90004c4:	00478713          	addi	a4,a5,4
f90004c8:	00e12623          	sw	a4,12(sp)
f90004cc:	0007a503          	lw	a0,0(a5)
f90004d0:	e61ff0ef          	jal	ra,f9000330 <bsp_printf_X>
                        break;
f90004d4:	f9dff06f          	j	f9000470 <bsp_printf+0x54>
                        bsp_printf_x(va_arg(ap,int));
f90004d8:	00c12783          	lw	a5,12(sp)
f90004dc:	00478713          	addi	a4,a5,4
f90004e0:	00e12623          	sw	a4,12(sp)
f90004e4:	0007a503          	lw	a0,0(a5)
f90004e8:	e09ff0ef          	jal	ra,f90002f0 <bsp_printf_x>
                        break;
f90004ec:	f85ff06f          	j	f9000470 <bsp_printf+0x54>
                while (format[++i]) {
f90004f0:	00140413          	addi	s0,s0,1
f90004f4:	008487b3          	add	a5,s1,s0
f90004f8:	0007c783          	lbu	a5,0(a5)
f90004fc:	f6078ae3          	beqz	a5,f9000470 <bsp_printf+0x54>
                    if (format[i] == 'c') {
f9000500:	06300713          	li	a4,99
f9000504:	f4e78ce3          	beq	a5,a4,f900045c <bsp_printf+0x40>
                    else if (format[i] == 's') {
f9000508:	07300713          	li	a4,115
f900050c:	f8e782e3          	beq	a5,a4,f9000490 <bsp_printf+0x74>
                    else if (format[i] == 'd') {
f9000510:	06400713          	li	a4,100
f9000514:	f8e78ae3          	beq	a5,a4,f90004a8 <bsp_printf+0x8c>
                    else if (format[i] == 'X') {
f9000518:	05800713          	li	a4,88
f900051c:	fae782e3          	beq	a5,a4,f90004c0 <bsp_printf+0xa4>
                    else if (format[i] == 'x') {
f9000520:	07800713          	li	a4,120
f9000524:	fae78ae3          	beq	a5,a4,f90004d8 <bsp_printf+0xbc>
                    else if (format[i] == 'f') {
f9000528:	06600713          	li	a4,102
f900052c:	fce792e3          	bne	a5,a4,f90004f0 <bsp_printf+0xd4>
                        bsp_printf_s("<Floating point printing not enable. Please Enable it at bsp.h first...>");
f9000530:	f9000537          	lui	a0,0xf9000
f9000534:	75850513          	addi	a0,a0,1880 # f9000758 <__global_pointer$+0xfffff778>
f9000538:	d21ff0ef          	jal	ra,f9000258 <bsp_printf_s>
                        break;
f900053c:	f35ff06f          	j	f9000470 <bsp_printf+0x54>

        va_end(ap);
    }
f9000540:	01c12083          	lw	ra,28(sp)
f9000544:	01812403          	lw	s0,24(sp)
f9000548:	01412483          	lw	s1,20(sp)
f900054c:	04010113          	addi	sp,sp,64
f9000550:	00008067          	ret

f9000554 <error_state>:
*
* @brief This function prints error message on terminal and enters an infinite loop
*         to halt the program's execution.
*
******************************************************************************/
void error_state() {
f9000554:	ff010113          	addi	sp,sp,-16
f9000558:	00112623          	sw	ra,12(sp)
    bsp_printf("Failed! \r\n");
f900055c:	f9000537          	lui	a0,0xf9000
f9000560:	7a450513          	addi	a0,a0,1956 # f90007a4 <__global_pointer$+0xfffff7c4>
f9000564:	eb9ff0ef          	jal	ra,f900041c <bsp_printf>
    while (1) {}
f9000568:	0000006f          	j	f9000568 <error_state+0x14>

f900056c <crash>:
*
* @brief This function handles the system crash scenario by printing a crash message
* 		 and entering an infinite loop.
*
******************************************************************************/
void crash(){
f900056c:	ff010113          	addi	sp,sp,-16
f9000570:	00112623          	sw	ra,12(sp)
    bsp_printf("\r\n*** CRASH ***\r\n");
f9000574:	f9000537          	lui	a0,0xf9000
f9000578:	7b050513          	addi	a0,a0,1968 # f90007b0 <__global_pointer$+0xfffff7d0>
f900057c:	ea1ff0ef          	jal	ra,f900041c <bsp_printf>
    while(1);
f9000580:	0000006f          	j	f9000580 <crash+0x14>

f9000584 <intr_init>:
*
* @brief This function initialize axi interrupt and set the machine trap 
*        vector.
*
******************************************************************************/
void intr_init(){
f9000584:	ff010113          	addi	sp,sp,-16
f9000588:	00112623          	sw	ra,12(sp)
    //configure PLIC
    //cpu 0 accept all interrupts with priority above 0
    plic_set_threshold(BSP_PLIC, BSP_PLIC_CPU_0, 0); 
f900058c:	00000613          	li	a2,0
f9000590:	00000593          	li	a1,0
f9000594:	f8c00537          	lui	a0,0xf8c00
f9000598:	e35ff0ef          	jal	ra,f90003cc <plic_set_threshold>
    //enable SYSTEM_PLIC_USER_INTERRUPT_A_INTERRUPT rising edge interrupt
#ifdef SYSTEM_AXI_A_BMB

    plic_set_enable(BSP_PLIC, BSP_PLIC_CPU_0, SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT, 1);
f900059c:	00100693          	li	a3,1
f90005a0:	01e00613          	li	a2,30
f90005a4:	00000593          	li	a1,0
f90005a8:	f8c00537          	lui	a0,0xf8c00
f90005ac:	dd5ff0ef          	jal	ra,f9000380 <plic_set_enable>
    plic_set_priority(BSP_PLIC, SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT, 1);
f90005b0:	00100613          	li	a2,1
f90005b4:	01e00593          	li	a1,30
f90005b8:	f8c00537          	lui	a0,0xf8c00
f90005bc:	db5ff0ef          	jal	ra,f9000370 <plic_set_priority>

#endif  
    //enable interrupts
    //Set the machine trap vector (../common/trap.S)
    csr_write(mtvec, trap_entry); 
f90005c0:	f90007b7          	lui	a5,0xf9000
f90005c4:	6a078793          	addi	a5,a5,1696 # f90006a0 <__global_pointer$+0xfffff6c0>
f90005c8:	30579073          	csrw	mtvec,a5
    //Enable external interrupts
    csr_set(mie, MIE_MEIE); 
f90005cc:	000017b7          	lui	a5,0x1
f90005d0:	80078793          	addi	a5,a5,-2048 # 800 <__stack_size+0x600>
f90005d4:	3047a073          	csrs	mie,a5
    csr_write(mstatus, csr_read(mstatus) | MSTATUS_MPP | MSTATUS_MIE);
f90005d8:	300027f3          	csrr	a5,mstatus
f90005dc:	00002737          	lui	a4,0x2
f90005e0:	80870713          	addi	a4,a4,-2040 # 1808 <__stack_size+0x1608>
f90005e4:	00e7e7b3          	or	a5,a5,a4
f90005e8:	30079073          	csrw	mstatus,a5
}
f90005ec:	00c12083          	lw	ra,12(sp)
f90005f0:	01010113          	addi	sp,sp,16
f90005f4:	00008067          	ret

f90005f8 <axiInterrupt>:
*
* @brief This function handles AXI interrupts by claiming pending interrupts 
* 		 and print the message regarding the claimed interrupt. 
*
******************************************************************************/
void axiInterrupt(){
f90005f8:	ff010113          	addi	sp,sp,-16
f90005fc:	00112623          	sw	ra,12(sp)
f9000600:	00812423          	sw	s0,8(sp)

    uint32_t claim;
    //While there is pending interrupts
    while(claim = plic_claim(BSP_PLIC, BSP_PLIC_CPU_0)){
f9000604:	00000593          	li	a1,0
f9000608:	f8c00537          	lui	a0,0xf8c00
f900060c:	dd9ff0ef          	jal	ra,f90003e4 <plic_claim>
f9000610:	00050413          	mv	s0,a0
f9000614:	02050863          	beqz	a0,f9000644 <axiInterrupt+0x4c>
        switch(claim){
f9000618:	01e00793          	li	a5,30
f900061c:	02f41263          	bne	s0,a5,f9000640 <axiInterrupt+0x48>
#ifdef SYSTEM_AXI_A_BMB

        case SYSTEM_PLIC_SYSTEM_AXI_A_INTERRUPT:
            bsp_printf("Entered AXI Interrupt Routine, Passed! \r\n");
f9000620:	f9000537          	lui	a0,0xf9000
f9000624:	7c450513          	addi	a0,a0,1988 # f90007c4 <__global_pointer$+0xfffff7e4>
f9000628:	df5ff0ef          	jal	ra,f900041c <bsp_printf>

#endif
        default: crash(); break;
        }
        //unmask the claimed interrupt
        plic_release(BSP_PLIC, BSP_PLIC_CPU_0, claim); 
f900062c:	00040613          	mv	a2,s0
f9000630:	00000593          	li	a1,0
f9000634:	f8c00537          	lui	a0,0xf8c00
f9000638:	dc9ff0ef          	jal	ra,f9000400 <plic_release>
f900063c:	fc9ff06f          	j	f9000604 <axiInterrupt+0xc>
        default: crash(); break;
f9000640:	f2dff0ef          	jal	ra,f900056c <crash>
    }
}
f9000644:	00c12083          	lw	ra,12(sp)
f9000648:	00812403          	lw	s0,8(sp)
f900064c:	01010113          	addi	sp,sp,16
f9000650:	00008067          	ret

f9000654 <trap>:
void trap(){
f9000654:	ff010113          	addi	sp,sp,-16
f9000658:	00112623          	sw	ra,12(sp)
    int32_t mcause    = csr_read(mcause);
f900065c:	342027f3          	csrr	a5,mcause
    if(interrupt){
f9000660:	0207d263          	bgez	a5,f9000684 <trap+0x30>
f9000664:	00f7f713          	andi	a4,a5,15
        switch(cause){
f9000668:	00b00793          	li	a5,11
f900066c:	00f71a63          	bne	a4,a5,f9000680 <trap+0x2c>
        case CAUSE_MACHINE_EXTERNAL: axiInterrupt(); break;
f9000670:	f89ff0ef          	jal	ra,f90005f8 <axiInterrupt>
}
f9000674:	00c12083          	lw	ra,12(sp)
f9000678:	01010113          	addi	sp,sp,16
f900067c:	00008067          	ret
        default: crash(); break;
f9000680:	eedff0ef          	jal	ra,f900056c <crash>
        crash();
f9000684:	ee9ff0ef          	jal	ra,f900056c <crash>

f9000688 <main>:
f9000688:	010007b7          	lui	a5,0x1000
f900068c:	00100713          	li	a4,1
f9000690:	00e7a023          	sw	a4,0(a5) # 1000000 <__stack_size+0xfffe00>
f9000694:	00200713          	li	a4,2
f9000698:	00e7a223          	sw	a4,4(a5)
f900069c:	fedff06f          	j	f9000688 <main>

f90006a0 <trap_entry>:
.global  trap_entry
.align(2) //mtvec require 32 bits allignement
trap_entry:
  addi sp,sp, -16*4
f90006a0:	fc010113          	addi	sp,sp,-64
  sw x1,   0*4(sp)
f90006a4:	00112023          	sw	ra,0(sp)
  sw x5,   1*4(sp)
f90006a8:	00512223          	sw	t0,4(sp)
  sw x6,   2*4(sp)
f90006ac:	00612423          	sw	t1,8(sp)
  sw x7,   3*4(sp)
f90006b0:	00712623          	sw	t2,12(sp)
  sw x10,  4*4(sp)
f90006b4:	00a12823          	sw	a0,16(sp)
  sw x11,  5*4(sp)
f90006b8:	00b12a23          	sw	a1,20(sp)
  sw x12,  6*4(sp)
f90006bc:	00c12c23          	sw	a2,24(sp)
  sw x13,  7*4(sp)
f90006c0:	00d12e23          	sw	a3,28(sp)
  sw x14,  8*4(sp)
f90006c4:	02e12023          	sw	a4,32(sp)
  sw x15,  9*4(sp)
f90006c8:	02f12223          	sw	a5,36(sp)
  sw x16, 10*4(sp)
f90006cc:	03012423          	sw	a6,40(sp)
  sw x17, 11*4(sp)
f90006d0:	03112623          	sw	a7,44(sp)
  sw x28, 12*4(sp)
f90006d4:	03c12823          	sw	t3,48(sp)
  sw x29, 13*4(sp)
f90006d8:	03d12a23          	sw	t4,52(sp)
  sw x30, 14*4(sp)
f90006dc:	03e12c23          	sw	t5,56(sp)
  sw x31, 15*4(sp)
f90006e0:	03f12e23          	sw	t6,60(sp)
  call trap
f90006e4:	f71ff0ef          	jal	ra,f9000654 <trap>
  lw x1 ,  0*4(sp)
f90006e8:	00012083          	lw	ra,0(sp)
  lw x5,   1*4(sp)
f90006ec:	00412283          	lw	t0,4(sp)
  lw x6,   2*4(sp)
f90006f0:	00812303          	lw	t1,8(sp)
  lw x7,   3*4(sp)
f90006f4:	00c12383          	lw	t2,12(sp)
  lw x10,  4*4(sp)
f90006f8:	01012503          	lw	a0,16(sp)
  lw x11,  5*4(sp)
f90006fc:	01412583          	lw	a1,20(sp)
  lw x12,  6*4(sp)
f9000700:	01812603          	lw	a2,24(sp)
  lw x13,  7*4(sp)
f9000704:	01c12683          	lw	a3,28(sp)
  lw x14,  8*4(sp)
f9000708:	02012703          	lw	a4,32(sp)
  lw x15,  9*4(sp)
f900070c:	02412783          	lw	a5,36(sp)
  lw x16, 10*4(sp)
f9000710:	02812803          	lw	a6,40(sp)
  lw x17, 11*4(sp)
f9000714:	02c12883          	lw	a7,44(sp)
  lw x28, 12*4(sp)
f9000718:	03012e03          	lw	t3,48(sp)
  lw x29, 13*4(sp)
f900071c:	03412e83          	lw	t4,52(sp)
  lw x30, 14*4(sp)
f9000720:	03812f03          	lw	t5,56(sp)
  lw x31, 15*4(sp)
f9000724:	03c12f83          	lw	t6,60(sp)
  addi sp,sp, 16*4
f9000728:	04010113          	addi	sp,sp,64
  mret
f900072c:	30200073          	mret
