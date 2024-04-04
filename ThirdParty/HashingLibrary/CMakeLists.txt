file(GLOB SOURCES "*.cpp")
add_library(HashingLibrary STATIC ${SOURCES})

target_include_directories(HashingLibrary
        PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Include
)

if(PROSPERO)
    target_include_directories(HashingLibrary PRIVATE
        ${SCE_PROSPERO_SDK_DIR}/target/include
        ${SCE_PROSPERO_SDK_DIR}/target/include/machine
    )
endif()
