cmake_minimum_required(VERSION 3.23 FATAL_ERROR)

project(cpp-single-template CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Goodies
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/helpers.cmake)

enable_static_analysis(CLANGTIDY CPPCHECK CPPLINT)

# Executables
add_executable(${PROJECT_NAME} src/main.cpp)
enable_sanitize(${PROJECT_NAME})
strip_symbols(${PROJECT_NAME})

set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})

# Tests
enable_testing()
add_subdirectory(test/compiler)
