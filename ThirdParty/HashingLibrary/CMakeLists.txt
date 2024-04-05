set (OUTPUT_LIB "${CMAKE_ARCHIVE_OUTPUT_DIRECTORY}/${CMAKE_STATIC_LIBRARY_PREFIX}HashingLibrary${CMAKE_DEBUG_POSTFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}")

# Build thirdparty libs only when BUILD_THIRDPARTY or the output lib does not exist
if(NOT EXISTS ${OUTPUT_LIB} OR BUILD_THIRDPARTY)
    file(GLOB SOURCES "*.cpp")

    add_library(HashingLibrary STATIC ${SOURCES})

    target_include_directories(HashingLibrary PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Include)
else()
    add_library(HashingLibrary INTERFACE)

    # Specify include and link path for target link this lib
    target_include_directories(HashingLibrary INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/Include)
    target_link_libraries(HashingLibrary INTERFACE ${OUTPUT_LIB})
endif()
