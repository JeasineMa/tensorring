cmake_minimum_required(VERSION 2.8)
project(jy901_serial)

#setting 
set(CMAKE_AUTOMOC ON)

#use qt4
find_package(Qt4 REQUIRED)

QT4_WRAP_CPP(jy_qt_src include/ui.h)

#include the headers
include_directories(
    ./include/
    ${QT_INCLUDE_DIR}
)

add_executable(jy901_serial 
    src/main.cpp
#     src/JY901.c
    src/Serial.cpp
    src/ui.cpp
    ${jy_qt_src}
)

target_link_libraries(jy901_serial 
    Qt4::QtGui
)

install(TARGETS jy901_serial RUNTIME DESTINATION bin)
