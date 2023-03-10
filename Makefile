##########################################################

# CC compiler options:
CC=pgc++
CC_FLAGS= -O3 -acc
CC_LIBS=

##########################################################

## Project file structure ##

# Source file directory:
SRC_DIR = src

# Object file directory:
OBJ_DIR = bin

# Include header file diretory:
INC_DIR = include

##########################################################

## Make variables ##

# Target executable name:
EXE = run

# Object files:
OBJS = $(OBJ_DIR)/DOP853func.o $(OBJ_DIR)/particle.o $(OBJ_DIR)/main.o

##########################################################

## Compile ##

# Link c++ and CUDA compiled object files to target executable:
$(EXE) : $(OBJS)
	$(CC) $(CC_FLAGS) $(OBJS) -o $@ 

# Compile main .cpp file to object files:
$(OBJ_DIR)/%.o : %.cpp
	$(CC) $(CC_FLAGS) -c $< -o $@

# Compile C++ source files to object files:
$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp include/%.h
	$(CC) $(CC_FLAGS) -c $< -o $@

# Clean objects in object directory.
clean:
	$(RM) bin/* *.o $(EXE)