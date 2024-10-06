.section .isr_vector, "a"   /* Interrupt vector table section */
.word   _estack             /* Initial Stack Pointer, provided by the linker */
.word   reset_handler       /* Reset Handler: entry point of your program */


  /* Ecrire ce programme en C et en AS, ainsi qu'en C invoquant de l'AS */


.section .text
.global reset_handler

.include "gpio_address_map.s"
  /* pin PA5 = onboard LED */
  /* Bus AHB2 0x4800 0000 - 0x4800 03FF 1 KB GPIOA */
  /* Bus AHB1 0x4002 1000 - 0x4002 13FF 1 KB RCC */

reset_handler:
  /* Starting point of the program */
  ldr r0, =GPIOA_MODER        /* Load address of GPIOA_MODER */
  ldr r1, [r0]                /* Read the current value */
  ldr r2, =0x00000C00         /* Load bit Mask into r2 (set bit 10 & 11)*/
  bic r1, r1, r2              /* Clear bits 10 and 11 (PA5 mode) */
  ldr r2, =0x00000A00
  orr r1, r1, r2              /* Set PA5 to output mode (01) */
  str r1, [r0]                /* Write back to GPIOA_MODER */

infinite_loop:
    b infinite_loop                /* Infinite looping */

