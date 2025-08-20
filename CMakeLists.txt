cmake_minimum_required(VERSION 3.12...3.31)
project(libxlsxwriter_project C)

SET(CMAKE_C_STANDARD 11)

# This macro normally comes with compiler checks,
# but we set it manually for simplicity of the configuration file
add_compile_definitions(_FORTIFY_SOURCE=2)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(FetchContent)

FetchContent_Declare(
    libxlsxwriter
    GIT_REPOSITORY https://github.com/jmcnamara/libxlsxwriter.git
    GIT_TAG v1.2.3
)

FetchContent_MakeAvailable(libxlsxwriter)

add_executable(
    libxlsxwriter_example

    main.c
)

target_link_libraries(
    libxlsxwriter_example
    PRIVATE
        xlsxwriter
)
