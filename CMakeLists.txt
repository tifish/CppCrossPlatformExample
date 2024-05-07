cmake_minimum_required(VERSION 3.16)

# --------------------------------------------------------------------------------
project(CppCrossPlatformExample)

# Default C++ 20, except Prospero
set(CMAKE_CXX_STANDARD 20)

# Default dynamic library, except iOS
set(BUILD_SHARED_LIBS ON)

# Position independent code for static library linking into shared libraries, excpet iOS
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Since Xbox has CMAKE_SYSTEM_NAME=Windows, we provide a new SYSTEM_NAME variable
set(SYSTEM_NAME "${CMAKE_SYSTEM_NAME}")

if(WINDOWS) # Set by command line argument, since WIN32 is TRUE for Xbox platform
elseif(LINUX)
elseif(DARWIN) # Set by command line argument, since no default variable
elseif(ANDROID)
    set(CMAKE_SYSTEM_VERSION 21) # API level

    set(OUTPUT_DIRECTORY_POSTFIX ".${CMAKE_GENERATOR_PLATFORM}")
elseif(IOS)
    set(CMAKE_OSX_ARCHITECTURES arm64)

    # iOS can only build static library
    set(BUILD_SHARED_LIBS OFF)
    set(CMAKE_POSITION_INDEPENDENT_CODE OFF)
elseif(XBOX) # Set by command line argument, since no default variable
    set(SYSTEM_NAME "Xbox")
elseif(PROSPERO) # Set by command line argument, since no default variable
    # Prospero supports only C++ 17
    set(CMAKE_CXX_STANDARD 17)
elseif(OHOS)
endif()

message(STATUS "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_GENERATOR_PLATFORM: ${CMAKE_GENERATOR_PLATFORM}")
message(STATUS "SYSTEM_NAME: ${SYSTEM_NAME}")
message(STATUS "CMAKE_HOST_SYSTEM_PROCESSOR: ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message(STATUS "CMAKE_SYSTEM_PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")
message(STATUS "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}")

# --------------------------------------------------------------------------------
# Binary output directory
# $<0:> Avoid Debug / Release subdirectory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Lib/${SYSTEM_NAME}${OUTPUT_DIRECTORY_POSTFIX}$<0:>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Bin/${SYSTEM_NAME}${OUTPUT_DIRECTORY_POSTFIX}$<0:>")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/Bin/${SYSTEM_NAME}${OUTPUT_DIRECTORY_POSTFIX}$<0:>")

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
# set(BUILD_THIRDPARTY ON)
add_subdirectory(ThirdParty/HashingLibrary)
