.section .isr_vector, "a"   /* Interrupt vector table section */
.word   _estack             /* Initial Stack Pointer, provided by the linker */
.word   _start              /* Reset Handler: entry point of your program */



  /* Ecrire ce programme en C et en AS, ainsi qu'en C invoquant de l'AS */
  


.section .text
.global reset_handler

  /* pin PA5 = onboard LED */
  /* Bus AHB2 0x4800 0000 - 0x4800 03FF 1 KB GPIOA */
  /* Bus AHB1 0x4002 1000 - 0x4002 13FF 1 KB RCC */

.equ  GPIOA_NADIR, 0x48000000
.equ  GPIOA_APEX, 0x480003FF
        
reset_handler:
  /* Starting point of the program */

infinite_loop:
    b infinite_loop                /* Infinite looping */

