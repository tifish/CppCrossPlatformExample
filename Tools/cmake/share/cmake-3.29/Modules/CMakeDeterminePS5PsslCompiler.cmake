file(TO_CMAKE_PATH "$ENV{SCE_ROOT_DIR}" SCE_ROOT_DIR)
if (NOT EXISTS "${SCE_ROOT_DIR}")
    message(FATAL_ERROR "Path specified by SCE_ROOT_DIR not found")
endif()

set(SCE_CMAKE_DIR "${SCE_ROOT_DIR}/Prospero/Tools/CMake/")

find_program(CMAKE_PS5PSSL_COMPILER NAMES PsslWrapper.exe PATHS "${SCE_CMAKE_DIR}" DOC "PS5 Pssl compiler wrapper")

mark_as_advanced(CMAKE_PS5PSSL_COMPILER)

set(CMAKE_PS5PSSL_SOURCE_FILE_EXTENSIONS pssl)
set(CMAKE_PS5PSSL_OUTPUT_EXTENSION .ags)

set(CMAKE_PS5PSSL_OUTPUT_EXTENSION_REPLACE TRUE)
set(CMAKE_PS5PSSL_DEPFILE_EXTENSION_REPLACE TRUE)

set(CMAKE_PS5PSSL_COMPILER_ENV_VAR "PS5PSSL")

# Configure variables set in this file for fast reload later on
configure_file(${CMAKE_CURRENT_LIST_DIR}/CMakePS5PsslCompiler.cmake.in ${CMAKE_PLATFORM_INFO_DIR}/CMakePS5PsslCompiler.cmake)
