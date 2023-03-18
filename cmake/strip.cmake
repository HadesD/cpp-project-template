function(strip_symbols target_name)
  if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    # cl doesn't need stripping
  elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND CMAKE_CXX_SIMULATE_ID MATCHES "MSVC")
    # clang-cl doesn't need stripping
  else()
    target_link_options(${target_name} PRIVATE $<$<CONFIG:RELEASE>:-s>)
  endif()
endfunction()