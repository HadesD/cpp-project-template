#include <catch2/catch_test_macros.hpp>

#include <cmath>

TEST_CASE("Compiler test") {
    REQUIRE(static_cast<int>(std::pow(10, 2)) == 100);
}