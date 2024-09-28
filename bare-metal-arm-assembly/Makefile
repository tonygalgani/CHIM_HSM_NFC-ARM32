# Toolchain commands
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

# Source file
SRC = main.s
# Object file
OBJ = main.o
# Linker file
LINK = linker.ld

ELF = firmware.elf
BIN = firmware.bin

# Compile flags
TARGET = -mcpu=cortex-m4

# Default command
all: clean $(OBJ) $(ELF) $(BIN)

# Rule to assemble the source file into an object file
$(OBJ): $(SRC)
	$(AS) $(TARGET) -g -o $@ $<

$(ELF): $(OBJ)
	$(LD) -T $(LINK) -o $@ $<

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@

# Clean up build files
clean:
	@echo "Cleaning previously generated files"
	@echo "	rm -f $(OBJ) $(ELF) $(BIN)"
	@rm -f $(OBJ) $(ELF) $(BIN)

.PHONY: all clean

