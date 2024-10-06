/* GPIO register offsets */
.equ  MODER_OFFSET,   0x00  /* Mode register (configures input, output, alternate, analog) */
.equ  OTYPER_OFFSET,  0x04  /* Output type (push-pull or open-drain) */
.equ  OSPEEDR_OFFSET, 0x08  /* Output speed configuration */
.equ  PUPDR_OFFSET,   0x0C  /* Pull-up/pull-down configuration */
.equ  IDR_OFFSET,     0x10  /* Input data register */
.equ  ODR_OFFSET,     0x14  /* Output data register */
.equ  BSRR_OFFSET,    0x18  /* Bit set/reset register */
.equ  LCKR_OFFSET,    0x1C	/* Port configuration lock register */
.equ  AFR_LR_OFFSET,	0x20	/* Alternate function low register (for pins 0-7) */
.equ  AFR_HR_OFFSET,  0x24	/* Alternate function high register (for pins 8-15) */
.equ  BRR_OFFSET,   	0x28	/* Bit reset register */

/* GPIOA Addresses */
.equ  GPIOA_NADIR,    0x48000000
.equ  GPIOA_APEX,     0x480003FF
.equ  GPIOA_MODER,    GPIOA_NADIR + MODER_OFFSET
.equ  GPIOA_OTYPER,   GPIOA_NADIR + OTYPER_OFFSET
.equ  GPIOA_OSPEEDR,  GPIOA_NADIR + OSPEEDR_OFFSET
.equ  GPIOA_PUPDR,    GPIOA_NADIR + PUPDR_OFFSET
.equ  GPIOA_IDR,      GPIOA_NADIR + IDR_OFFSET
.equ  GPIOA_ODR,      GPIOA_NADIR + ODR_OFFSET
.equ  GPIOA_BSRR,     GPIOA_NADIR + BSRR_OFFSET
.equ  GPIOA_LCKR,     GPIOA_NADIR + LCKR_OFFSET
.equ  GPIOA_AFR_LR,   GPIOA_NADIR + AFR_LR_OFFSET
.equ  GPIOA_AFR_HR,   GPIOA_NADIR + AFR_HR_OFFSET
.equ  GPIOA_BRR,      GPIOA_NADIR + BRR_OFFSET
 
/* GPIOB Addresses */
.equ  GPIOB_NADIR,  0x48000400
.equ  GPIOB_APEX,   0x480007FF
 
/* GPIOC Addresses */
.equ  GPIOC_NADIR,  0x48000800
.equ  GPIOC_APEX,   0x48000BFF
 
/* GPIOD Addresses */
.equ  GPIOD_NADIR,  0x48000C000
.equ  GPIOD_APEX,   0x48000FFF
 
/* GPIOE Addresses */
.equ  GPIOE_NADIR,  0x48001000
.equ  GPIOE_APEX,   0x480013FF
 
/* GPIOH Addresses */
.equ  GPIOH_NADIR,  0x48001C00
.equ  GPIOH_APEX,   0x48001FFF


