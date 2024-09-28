
/* Minimal Linker Script for STM32L452RE (Nucleo-L452RE-P) */

/* Set the entry point to _start */
ENTRY(reset_handler)

/* Define memory regions */
MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 512K  /* 512KB Flash memory */
    RAM   (xrw) : ORIGIN = 0x20000000, LENGTH = 160K  /* 160KB RAM */
}

/* Define sections */
SECTIONS
{
    /* .text section: Code and read-only data go here, placed in FLASH */
    .text :
    {
        *(.isr_vector)       /* Include the interrupt vector table */
        *(.text*)            /* Include all .text sections */
    } > FLASH

    /* .stack section: Define the stack at the top of RAM */
    .stack (NOLOAD) :
    {
        _estack = ORIGIN(RAM) + LENGTH(RAM);  /* Set the top of the stack */
    } > RAM

    /* .bss section: Reserve space for uninitialized data in RAM (optional) */
    .bss :
    {
        _sbss = .;           /* Start of the .bss section */
        *(.bss*)             /* All uninitialized data */
        _ebss = .;           /* End of the .bss section */
    } > RAM
}

