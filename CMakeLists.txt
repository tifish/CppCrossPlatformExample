cmake_minimum_required(VERSION 3.25)

project(CppCrossPlatformExample)

set(CMAKE_CXX_STANDARD 20)

# Defualt dynamic library, except iOS
set(BUILD_SHARED_LIBS ON)
set(PLATFORM_NAME "${CMAKE_SYSTEM_NAME}")

if(WINDOWS)
elseif(LINUX)
elseif(ANDROID)
    set(CMAKE_SYSTEM_VERSION 21) # API level
    set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)
elseif(IOS)
    set(CMAKE_OSX_ARCHITECTURES arm64)

    # iOS can only build static library
    set(BUILD_SHARED_LIBS OFF)
elseif(XBOX)
    set(PLATFORM_NAME "Xbox")
elseif(PS)
    set(PLATFORM_NAME "PS")
endif()

message(STATUS "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_GENERATOR_PLATFORM: ${CMAKE_GENERATOR_PLATFORM}")
message(STATUS "PLATFORM_NAME: ${PLATFORM_NAME}")
message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")

# Binary output directory
# $<0:> Avoid Debug / Release subdirectory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/lib/${PLATFORM_NAME}$<0:>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/${PLATFORM_NAME}$<0:>")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/${PLATFORM_NAME}$<0:>")

# Debug postfix D
set(CMAKE_DEBUG_POSTFIX D)

# main library
add_library(${PROJECT_NAME} library.cpp)
