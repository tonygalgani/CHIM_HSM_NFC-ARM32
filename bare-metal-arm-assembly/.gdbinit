# Connect to OpenOCD via remote target
target extended-remote localhost:3333

# Halt the CPU
monitor reset halt

# Load the program into the target
load firmware.elf

symbol-file firmware.elf

# Optional: Set a breakpoint at the _start of the program
break reset_handler

# Enable GDB TUI mode for source and assembly layout
layout regs

start
