# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.12.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.12.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/dimagubatenko/xcodeProject/test_external_make

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/dimagubatenko/xcodeProject/test_external_make

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/local/Cellar/cmake/3.12.3/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/local/Cellar/cmake/3.12.3/bin/ccmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/dimagubatenko/xcodeProject/test_external_make/CMakeFiles /Users/dimagubatenko/xcodeProject/test_external_make/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/dimagubatenko/xcodeProject/test_external_make/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named Tutorial

# Build rule for target.
Tutorial: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 Tutorial
.PHONY : Tutorial

# fast build rule for target.
Tutorial/fast:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/build
.PHONY : Tutorial/fast

main_src/main.o: main_src/main.cpp.o

.PHONY : main_src/main.o

# target to build an object file
main_src/main.cpp.o:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/main.cpp.o
.PHONY : main_src/main.cpp.o

main_src/main.i: main_src/main.cpp.i

.PHONY : main_src/main.i

# target to preprocess a source file
main_src/main.cpp.i:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/main.cpp.i
.PHONY : main_src/main.cpp.i

main_src/main.s: main_src/main.cpp.s

.PHONY : main_src/main.s

# target to generate assembly for a file
main_src/main.cpp.s:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/main.cpp.s
.PHONY : main_src/main.cpp.s

main_src/utils.o: main_src/utils.cpp.o

.PHONY : main_src/utils.o

# target to build an object file
main_src/utils.cpp.o:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/utils.cpp.o
.PHONY : main_src/utils.cpp.o

main_src/utils.i: main_src/utils.cpp.i

.PHONY : main_src/utils.i

# target to preprocess a source file
main_src/utils.cpp.i:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/utils.cpp.i
.PHONY : main_src/utils.cpp.i

main_src/utils.s: main_src/utils.cpp.s

.PHONY : main_src/utils.s

# target to generate assembly for a file
main_src/utils.cpp.s:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/main_src/utils.cpp.s
.PHONY : main_src/utils.cpp.s

parson_src/parson.o: parson_src/parson.c.o

.PHONY : parson_src/parson.o

# target to build an object file
parson_src/parson.c.o:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/parson_src/parson.c.o
.PHONY : parson_src/parson.c.o

parson_src/parson.i: parson_src/parson.c.i

.PHONY : parson_src/parson.i

# target to preprocess a source file
parson_src/parson.c.i:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/parson_src/parson.c.i
.PHONY : parson_src/parson.c.i

parson_src/parson.s: parson_src/parson.c.s

.PHONY : parson_src/parson.s

# target to generate assembly for a file
parson_src/parson.c.s:
	$(MAKE) -f CMakeFiles/Tutorial.dir/build.make CMakeFiles/Tutorial.dir/parson_src/parson.c.s
.PHONY : parson_src/parson.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... Tutorial"
	@echo "... main_src/main.o"
	@echo "... main_src/main.i"
	@echo "... main_src/main.s"
	@echo "... main_src/utils.o"
	@echo "... main_src/utils.i"
	@echo "... main_src/utils.s"
	@echo "... parson_src/parson.o"
	@echo "... parson_src/parson.i"
	@echo "... parson_src/parson.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

