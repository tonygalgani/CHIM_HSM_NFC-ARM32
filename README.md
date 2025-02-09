# Secret Manager HSM in ARM Assembly (On Hold)

## Objective:
- To learn ARM assembly development by recreating an existing project, enhancing my skills in low-level programming and embedded systems.
- To develop a secret manager HSM capable of storing sensitive information such as passwords, IDs, encryption keys, and any digital indentity data. The project will primarily be developed in ARM assembly, with fallback to C when necessary.

## Hardware:
- STM32L452RE-P (Nucleo)
- ST25R3916 (NFC Controller)
- EEPROM (Component yet to be determined)
- Other security components (to be added)

## Development Environment:
- **Toolchain**: `arm-none-eabi`
- **Debugging**: `OpenOCD`, `GDB`

## Debug/Programming Procedure:
1. Connect the Nucleo board to the pc.
2. Flash and debug the firmware using two terminal windows:
    ```bash
    $ openocd -f interface/stlink.cfg -f target/stm32l4x.cfg /* connect to the stlink  */
    $ arm-none-eabi-gdb /* start gdb sever (with preset commands set in .gdbinit) */
    (gdb) ni /* go to the next instruction in the program */
    ```

## Step-by-step Breakdown Plan:

### Step 1: Basic MCU Familiarization (Blinky Project)
#### Goal:
Get comfortable with programming the Nucleo-L452RE-P in ARM assembly.

#### Tasks:

1. **Learn how functions work in arm asm**: 
   - Write a simple delay(ms) function. (Done)
   - Write a function to enable a LED. (Done)
   - Write a function to disable a LED. (Done)
   
2. **Develop Blinky**:
   - Write ARM assembly code to control an LED on the Nucleo board. (Done)
   - Configure GPIO registers in assembly to blink the LED. (Pending)

4. **Establish a full memory map header file of the mcu**

#### Learning Outcome:
Gain understanding of GPIO control and ARM assembly basics, setting a foundation for more complex hardware interactions.

---

### Step 2: Establish a UART Serial Connection
#### Goal:
Implement a serial communication interface between the Nucleo-L452RE-P and your PC for debugging and data exchange.

#### Tasks:
1. **Understand UART Communication**:
   - Learn UART protocol basics: baud rate, data bits, stop bits, and parity.
   - Study UART registers on the STM32L452RE and how to configure them.

2. **Write UART Driver in Assembly**:
   - Configure UART peripheral registers and set up an interrupt or polling mechanism for sending/receiving data.
   - Test serial communication with a terminal emulator (`minicom`, `screen`).

#### Learning Outcome:
Gain familiarity with serial communication, register-level programming, and interrupt handling.

---

### Step 3: Interface with Security EEPROM
#### Goal:
Establish communication with a security EEPROM (e.g., Microchip ATECC608A or STMicroelectronics M24LR64-R) using I2C.

#### Tasks:
1. **Learn I2C Protocol**:
   - Study I2C (start/stop conditions, addressing, read/write operations).
   - Learn how to configure I2C peripherals on the STM32L452RE.

2. **Develop I2C Driver in Assembly**:
   - Write assembly code to initialize and communicate with an I2C device (EEPROM).
   - Implement read/write operations to/from the EEPROM.

#### Learning Outcome:
Learn I2C communication, register-level hardware configuration, and EEPROM interaction.

---

### Step 4: Interface with NFC Controller (ST25R3916)
#### Goal:
Establish communication with the ST25R3916 NFC controller to perform basic read/write operations.

#### Tasks:
1. **Understand NFC Communication**:
   - Study NFC protocols (ISO14443, ISO15693) and the ST25R3916 functionality.
   - Learn how to communicate with the NFC controller via SPI or I2C.

2. **Develop SPI/I2C Driver for NFC**:
   - Write ARM assembly code to initialize and communicate with the NFC controller.

3. **Perform NFC Operations**:
   - Implement basic NFC read/write commands for tags or data transmission.

#### Learning Outcome:
Understand NFC protocols, develop SPI/I2C communication, and handle complex peripherals.

---

### Step 5: Secure Data Storage and Key Management
#### Goal:
Implement secure data storage and key management functions for the HSM.

#### Tasks:
1. **Memory Management and Data Structures**:
   - Implement data structures in assembly for storing secrets (passwords, keys, etc.).

2. **Encryption and Decryption**:
   - Learn symmetric and asymmetric cryptographic algorithms (AES, RSA).
   - Implement encryption/decryption using hardware cryptography from EEPROM or in assembly.

3. **Access Control**:
   - Implement password-protected access to stored data, ensuring only authorized users can retrieve secrets.

#### Learning Outcome:
Securely store and retrieve data, implement encryption, and understand key management.

---

### Step 6: Full Identity Management with NFC and Security Features
#### Goal:
Integrate NFC to manage identities and secure communication within the HSM.

#### Tasks:
1. **Store and Retrieve Identity Information**:
   - Interface EEPROM and NFC to store/retrieve identity cards, passwords, or encryption keys.

2. **Implement Security Protocols**:
   - Use encryption, authentication, and NFC capabilities to secure data transmission.

3. **Optimize Assembly Code**:
   - Optimize your assembly code for size and speed, optionally using C for complex logic.

#### Learning Outcome:
Achieve a full HSM with identity management and secure NFC communication.

