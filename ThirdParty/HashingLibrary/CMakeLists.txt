file(GLOB SOURCES "*.cpp")
add_library(HashingLibrary STATIC ${SOURCES})

target_include_directories(HashingLibrary
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Include
)
