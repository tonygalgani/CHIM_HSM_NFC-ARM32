
    .section .text
    .global main

    .equ USART2_BASE,  0x40004400    /* USART2 base address */
    .equ GPIOA_BASE,   0x48000000    /* GPIOA base address */
    .equ RCC_BASE,     0x40021000    /* RCC base address */
    
    .equ USART2_CR1,   0x00          /* USART2 control register 1 */
    .equ USART2_BRR,   0x0C          /* USART2 baud rate register */
    .equ USART2_ISR,   0x1C          /* USART2 interrupt and status register */
    .equ USART2_RDR,   0x24          /* USART2 receive data register */
    .equ USART2_TDR,   0x28          /* USART2 transmit data register */
    
    .equ GPIOA_MODER,  0x00          /* GPIOA mode register */
    .equ GPIOA_AFRL,   0x20          /* GPIOA alternate function low register */
    
    .equ RCC_AHB2ENR,  0x4C          /* RCC AHB2 peripheral clock enable register */
    .equ RCC_APB1ENR1, 0x58          /* RCC APB1 peripheral clock enable register */

main:
    BL      usart2_init              /* Initialize USART2 */

    /* Transmit 'A' (0x41) */
    LDR     R2, =0x41                /* Load ASCII value of 'A' into R2 */
    BL      send_byte                /* Call send_byte to transmit data */

    /* Receive a byte */
    BL      receive_byte             /* Call receive_byte to receive data */
    
    /* Infinite loop */
loop:
    B       loop

/* Initialize USART2 and GPIOA */
usart2_init:
    /* Enable clocks for GPIOA and USART2 */
    LDR     R0, =RCC_BASE
    LDR     R1, [R0, #RCC_AHB2ENR]   /* Read RCC AHB2ENR */
    LDR     R2, =0x01                /* Load immediate 0x01 */
    ORR     R1, R1, R2               /* Enable GPIOA clock (bit 0) */
    STR     R1, [R0, #RCC_AHB2ENR]   /* Write back to RCC AHB2ENR */
    
    LDR     R1, [R0, #RCC_APB1ENR1]  /* Read RCC APB1ENR1 */
    LDR     R2, =0x20000             /* Load immediate 0x20000 */
    ORR     R1, R1, R2               /* Enable USART2 clock (bit 17) */
    STR     R1, [R0, #RCC_APB1ENR1]  /* Write back to RCC APB1ENR1 */

    /* Configure PA2 (TX) and PA3 (RX) as alternate function (AF7) */
    LDR     R0, =GPIOA_BASE
    LDR     R1, [R0, #GPIOA_MODER]   /* Read GPIOA_MODER */
    LDR     R2, =0xF                 /* Load immediate 0xF */
    LSL     R2, R2, #4               /* Shift left by 4 for PA2 and PA3 */
    BIC     R1, R1, R2               /* Clear mode bits for PA2 and PA3 */
    LDR     R2, =0xA                 /* Load immediate 0xA */
    LSL     R2, R2, #4               /* Shift left by 4 for PA2 and PA3 */
    ORR     R1, R1, R2               /* Set PA2 and PA3 to alternate function mode */
    STR     R1, [R0, #GPIOA_MODER]   /* Write back to GPIOA_MODER */

    /* Set PA2 and PA3 to AF7 for USART2 */
    LDR     R1, [R0, #GPIOA_AFRL]    /* Read GPIOA_AFRL */
    LDR     R2, =0xFF                /* Load immediate 0xFF */
    LSL     R2, R2, #8               /* Shift left by 8 for PA2 and PA3 */
    BIC     R1, R1, R2               /* Clear alternate function bits for PA2 and PA3 */
    LDR     R2, =0x77                /* Load immediate 0x77 */
    LSL     R2, R2, #8               /* Shift left by 8 for PA2 and PA3 */
    ORR     R1, R1, R2               /* Set alternate function AF7 (0x7) for PA2 and PA3 */
    STR     R1, [R0, #GPIOA_AFRL]    /* Write back to GPIOA_AFRL */

    /* Configure USART2: set baud rate and enable TX and RX */
    LDR     R0, =USART2_BASE
    LDR     R1, =0x0683              /* Baud rate 9600 (assuming PCLK1 at 16 MHz) */
    STR     R1, [R0, #USART2_BRR]    /* Set baud rate */

    LDR     R1, [R0, #USART2_CR1]    /* Read USART2_CR1 */
    LDR     R2, =0x0000200C          /* Load immediate 0x0000200C */
    ORR     R1, R1, R2               /* Enable USART2, TX, and RX */
    STR     R1, [R0, #USART2_CR1]    /* Write back to USART2_CR1 */
    BX      LR                       /* Return from function */

/* Send a byte via USART2 */
send_byte:
    LDR     R0, =USART2_BASE         /* Load USART2 base address */
wait_for_txe:
    LDR     R1, [R0, #USART2_ISR]    /* Read USART2_ISR */
    LDR     R2, =0x80                /* Load immediate 0x80 (TXE flag) */
    TST     R1, R2                   /* Check if TXE (Transmit data register empty) is set */
    BEQ     wait_for_txe             /* If TXE is not set, loop */
    STRB    R2, [R0, #USART2_TDR]    /* Write byte in R2 to USART2_TDR */
    BX      LR                       /* Return from function */

/* Receive a byte via USART2 */
receive_byte:
    LDR     R0, =USART2_BASE         /* Load USART2 base address */
wait_for_rxne:
    LDR     R1, [R0, #USART2_ISR]    /* Read USART2_ISR */
    LDR     R2, =0x20                /* Load immediate 0x20 (RXNE flag) */
    TST     R1, R2                   /* Check if RXNE (Receive data register not empty) is set */
    BEQ     wait_for_rxne            /* If RXNE is not set, loop */
    LDRB    R2, [R0, #USART2_RDR]    /* Read received byte from USART2_RDR into R2 */
    BX      LR                       /* Return from function */

