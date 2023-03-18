find_package(Catch2 CONFIG REQUIRED)

add_executable(test-compiler compiler.cpp)
target_link_libraries(test-compiler PRIVATE Catch2::Catch2WithMain)
add_test(NAME test-compiler COMMAND test-compiler)