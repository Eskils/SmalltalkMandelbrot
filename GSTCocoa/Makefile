# Directories and files
ROOT_DIR:=.
SOURCES_DIR:=./src
BUILD_DIR:=$(ROOT_DIR)/.build
BUILD_BIN_DIR:=$(ROOT_DIR)/lib
BUILD_RESULT:=$(BUILD_BIN_DIR)/libGSTCocoa.dylib

# File dependencies
M_SOURCES:=$(wildcard $(SOURCES_DIR)/*.m)
M_OBJECTS:=$(M_SOURCES:.m=.o)
OBJECTS:=$(M_OBJECTS)
ARTIFACTS:=$(foreach obj,$(OBJECTS),$(BUILD_DIR)/$(notdir $(obj)))

# Flags
LFLAGS:=-dynamiclib -framework Cocoa

# Rules
all: make_directories $(BUILD_RESULT)

$(BUILD_RESULT): $(ARTIFACTS)
	$(CC) $(LFLAGS) -o $@ $?

$(BUILD_DIR)/%.o: $(SOURCES_DIR)/%.m
	$(CC) -c -Wall -o $@ $^

make_directories:
	mkdir -p $(BUILD_BIN_DIR)
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_BIN_DIR)
	rm -rf $(BUILD_DIR)