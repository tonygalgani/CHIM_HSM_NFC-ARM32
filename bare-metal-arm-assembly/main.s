.section .isr_vector, "a"   /* Interrupt vector table section */
.word   _estack             /* Initial Stack Pointer, provided by the linker */
.word   reset_handler       /* Reset Handler: entry point of your program */


  /* Ecrire ce programme en C et en AS, ainsi qu'en C invoquant de l'AS */


.section .text
.global reset_handler

.include "port_defs.s"
.include "gpio_defs.s"

@ pin PA5 = onboard LED

reset_handler:
@ Starting point of the program

  ldr r1, =GPIOA_OSPEEDR
  ldr r2, =PA5_SPEED_MASK
  ldr r3, =PA5_SPEED_MEDIUM
  bl modify_register

  ldr r1, =GPIOA_MODER
  ldr r2, =PA5_MODE_MASK
  ldr r3, =PA5_MODE_OUTPUT
  bl modify_register

infinite_loop:
  ldr r1, =
  ldr r2, =PA5_MODE_MASK
  ldr r3, =PA5_MODE_OUTPUT   
  b infinite_loop           @ Infinite looping

modify_register:
  ldr r4, [r1]                @ Read the register's content
  bic r4, r4, r2              @ Clear bits using mask
  orr r4, r4, r3              @ Set bit value
  str r4, [r1]                @ Write back the value into the register 
  bx lr
