# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.5.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.5.1/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build

# Include any dependencies generated for this target.
include CMakeFiles/jy901_serial.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/jy901_serial.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/jy901_serial.dir/flags.make

include/moc_ui.cxx: ../include/ui.h
include/moc_ui.cxx: include/moc_ui.cxx_parameters
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating include/moc_ui.cxx"
	cd /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/include && /usr/local/Cellar/qt/4.8.7_2/bin/moc @/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/include/moc_ui.cxx_parameters

CMakeFiles/jy901_serial.dir/src/main.cpp.o: CMakeFiles/jy901_serial.dir/flags.make
CMakeFiles/jy901_serial.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/jy901_serial.dir/src/main.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jy901_serial.dir/src/main.cpp.o -c /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/main.cpp

CMakeFiles/jy901_serial.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jy901_serial.dir/src/main.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/main.cpp > CMakeFiles/jy901_serial.dir/src/main.cpp.i

CMakeFiles/jy901_serial.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jy901_serial.dir/src/main.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/main.cpp -o CMakeFiles/jy901_serial.dir/src/main.cpp.s

CMakeFiles/jy901_serial.dir/src/main.cpp.o.requires:

.PHONY : CMakeFiles/jy901_serial.dir/src/main.cpp.o.requires

CMakeFiles/jy901_serial.dir/src/main.cpp.o.provides: CMakeFiles/jy901_serial.dir/src/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/jy901_serial.dir/build.make CMakeFiles/jy901_serial.dir/src/main.cpp.o.provides.build
.PHONY : CMakeFiles/jy901_serial.dir/src/main.cpp.o.provides

CMakeFiles/jy901_serial.dir/src/main.cpp.o.provides.build: CMakeFiles/jy901_serial.dir/src/main.cpp.o


CMakeFiles/jy901_serial.dir/src/Serial.cpp.o: CMakeFiles/jy901_serial.dir/flags.make
CMakeFiles/jy901_serial.dir/src/Serial.cpp.o: ../src/Serial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/jy901_serial.dir/src/Serial.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jy901_serial.dir/src/Serial.cpp.o -c /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/Serial.cpp

CMakeFiles/jy901_serial.dir/src/Serial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jy901_serial.dir/src/Serial.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/Serial.cpp > CMakeFiles/jy901_serial.dir/src/Serial.cpp.i

CMakeFiles/jy901_serial.dir/src/Serial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jy901_serial.dir/src/Serial.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/Serial.cpp -o CMakeFiles/jy901_serial.dir/src/Serial.cpp.s

CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.requires:

.PHONY : CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.requires

CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.provides: CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.requires
	$(MAKE) -f CMakeFiles/jy901_serial.dir/build.make CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.provides.build
.PHONY : CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.provides

CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.provides.build: CMakeFiles/jy901_serial.dir/src/Serial.cpp.o


CMakeFiles/jy901_serial.dir/src/ui.cpp.o: CMakeFiles/jy901_serial.dir/flags.make
CMakeFiles/jy901_serial.dir/src/ui.cpp.o: ../src/ui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/jy901_serial.dir/src/ui.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jy901_serial.dir/src/ui.cpp.o -c /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/ui.cpp

CMakeFiles/jy901_serial.dir/src/ui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jy901_serial.dir/src/ui.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/ui.cpp > CMakeFiles/jy901_serial.dir/src/ui.cpp.i

CMakeFiles/jy901_serial.dir/src/ui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jy901_serial.dir/src/ui.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/src/ui.cpp -o CMakeFiles/jy901_serial.dir/src/ui.cpp.s

CMakeFiles/jy901_serial.dir/src/ui.cpp.o.requires:

.PHONY : CMakeFiles/jy901_serial.dir/src/ui.cpp.o.requires

CMakeFiles/jy901_serial.dir/src/ui.cpp.o.provides: CMakeFiles/jy901_serial.dir/src/ui.cpp.o.requires
	$(MAKE) -f CMakeFiles/jy901_serial.dir/build.make CMakeFiles/jy901_serial.dir/src/ui.cpp.o.provides.build
.PHONY : CMakeFiles/jy901_serial.dir/src/ui.cpp.o.provides

CMakeFiles/jy901_serial.dir/src/ui.cpp.o.provides.build: CMakeFiles/jy901_serial.dir/src/ui.cpp.o


CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o: CMakeFiles/jy901_serial.dir/flags.make
CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o: include/moc_ui.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o -c /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/include/moc_ui.cxx

CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/include/moc_ui.cxx > CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.i

CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/include/moc_ui.cxx -o CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.s

CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.requires:

.PHONY : CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.requires

CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.provides: CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.requires
	$(MAKE) -f CMakeFiles/jy901_serial.dir/build.make CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.provides.build
.PHONY : CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.provides

CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.provides.build: CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o


CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o: CMakeFiles/jy901_serial.dir/flags.make
CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o: jy901_serial_automoc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o -c /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/jy901_serial_automoc.cpp

CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/jy901_serial_automoc.cpp > CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.i

CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/jy901_serial_automoc.cpp -o CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.s

CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.requires:

.PHONY : CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.requires

CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.provides: CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.requires
	$(MAKE) -f CMakeFiles/jy901_serial.dir/build.make CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.provides.build
.PHONY : CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.provides

CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.provides.build: CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o


# Object files for target jy901_serial
jy901_serial_OBJECTS = \
"CMakeFiles/jy901_serial.dir/src/main.cpp.o" \
"CMakeFiles/jy901_serial.dir/src/Serial.cpp.o" \
"CMakeFiles/jy901_serial.dir/src/ui.cpp.o" \
"CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o" \
"CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o"

# External object files for target jy901_serial
jy901_serial_EXTERNAL_OBJECTS =

jy901_serial: CMakeFiles/jy901_serial.dir/src/main.cpp.o
jy901_serial: CMakeFiles/jy901_serial.dir/src/Serial.cpp.o
jy901_serial: CMakeFiles/jy901_serial.dir/src/ui.cpp.o
jy901_serial: CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o
jy901_serial: CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o
jy901_serial: CMakeFiles/jy901_serial.dir/build.make
jy901_serial: /usr/local/Cellar/qt/4.8.7_2/lib/QtGui.framework/QtGui
jy901_serial: /usr/local/Cellar/qt/4.8.7_2/lib/QtCore.framework/QtCore
jy901_serial: CMakeFiles/jy901_serial.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX executable jy901_serial"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jy901_serial.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/jy901_serial.dir/build: jy901_serial

.PHONY : CMakeFiles/jy901_serial.dir/build

CMakeFiles/jy901_serial.dir/requires: CMakeFiles/jy901_serial.dir/src/main.cpp.o.requires
CMakeFiles/jy901_serial.dir/requires: CMakeFiles/jy901_serial.dir/src/Serial.cpp.o.requires
CMakeFiles/jy901_serial.dir/requires: CMakeFiles/jy901_serial.dir/src/ui.cpp.o.requires
CMakeFiles/jy901_serial.dir/requires: CMakeFiles/jy901_serial.dir/include/moc_ui.cxx.o.requires
CMakeFiles/jy901_serial.dir/requires: CMakeFiles/jy901_serial.dir/jy901_serial_automoc.cpp.o.requires

.PHONY : CMakeFiles/jy901_serial.dir/requires

CMakeFiles/jy901_serial.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/jy901_serial.dir/cmake_clean.cmake
.PHONY : CMakeFiles/jy901_serial.dir/clean

CMakeFiles/jy901_serial.dir/depend: include/moc_ui.cxx
	cd /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build /Users/jeasinema/Documents/Skyworks/GitHub/tenserflow_ring/data_io/build/CMakeFiles/jy901_serial.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/jy901_serial.dir/depend

