cmake_minimum_required(VERSION 3.25)

# --------------------------------------------------------------------------------
project(CppCrossPlatformExample)

# Default C++ 20, except Prospero
set(CMAKE_CXX_STANDARD 20)
# Default dynamic library, except iOS
set(BUILD_SHARED_LIBS ON)
# Since Xbox has CMAKE_SYSTEM_NAME=Windows, we provide a new PLATFORM_NAME variable
set(PLATFORM_NAME "${CMAKE_SYSTEM_NAME}")

if(WINDOWS) # Set by command line argument, since WIN32 is TRUE for Xbox platform
elseif(LINUX)
elseif(DARWIN) # Set by command line argument, since no default variable
elseif(ANDROID)
    set(CMAKE_SYSTEM_VERSION 21) # API level
    set(CMAKE_ANDROID_ARCH_ABI arm64-v8a)
elseif(IOS)
    set(CMAKE_OSX_ARCHITECTURES arm64)

    # iOS can only build static library
    set(BUILD_SHARED_LIBS OFF)
elseif(XBOX) # Set by command line argument, since no default variable
    set(PLATFORM_NAME "Xbox")
elseif(PROSPERO) # Set by command line argument, since no default variable
    # Prospero supports only C++ 17
    set(CMAKE_CXX_STANDARD 17)
endif()

message(STATUS "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_GENERATOR_PLATFORM: ${CMAKE_GENERATOR_PLATFORM}")
message(STATUS "PLATFORM_NAME: ${PLATFORM_NAME}")
message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")

# --------------------------------------------------------------------------------
# Binary output directory
# $<0:> Avoid Debug / Release subdirectory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Lib/${PLATFORM_NAME}$<0:>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Bin/${PLATFORM_NAME}$<0:>")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Bin/${PLATFORM_NAME}$<0:>")

# Debug postfix D
set(CMAKE_DEBUG_POSTFIX D)

# --------------------------------------------------------------------------------
# main library
add_library(${PROJECT_NAME} library.cpp)

target_link_libraries(${PROJECT_NAME} PRIVATE HashingLibrary)

# --------------------------------------------------------------------------------
# ThirdParty libs
# By default ThirdParty libs are not built when existing.
# Can be build by passing -DBUILD_THIRDPARTY=ON, or uncommenting the line below:
#set(BUILD_THIRDPARTY ON)
add_subdirectory(ThirdParty/HashingLibrary)
