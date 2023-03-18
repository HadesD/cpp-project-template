function(enable_sanitize target_name)
  set(COMPILE_OPTIONS "")
  set(LINK_OPTIONS "")
  if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(COMPILE_OPTIONS "/fsanitize=address")
    message(STATUS "cl compiler detected, enable '${COMPILE_OPTIONS}'")
  elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND CMAKE_CXX_SIMULATE_ID MATCHES "MSVC")
    set(COMPILE_OPTIONS "-fsanitize=address,undefined")
    set(LINK_OPTIONS "clang_rt.asan_dynamic-x86_64.lib" "clang_rt.asan_dynamic_runtime_thunk-x86_64.lib")
    message(STATUS "clang-cl compiler detected, enable '${COMPILE_OPTIONS}'")
    set_property(TARGET ${target_name} PROPERTY MSVC_RUNTIME_LIBRARY "$<$<CONFIG:Debug>:>") # Remove -MDd from Debug config
  elseif(WIN32)
    message(AUTHOR_WARNING "Other compiler on Windows detected, sanitizer not supported")
  else()
    set(COMPILE_OPTIONS "-fsanitize=address,undefined,leak")
    set(LINK_OPTIONS "${COMPILE_OPTIONS}")
    message(STATUS "Other compiler detected, not on Windows, enable '${COMPILE_OPTIONS}'")
  endif()
  if(NOT COMPILE_OPTIONS STREQUAL "")
    target_compile_options(${target_name} PRIVATE $<$<CONFIG:Debug>:${COMPILE_OPTIONS}>)
  endif()
  if(NOT LINK_OPTIONS STREQUAL "")
    target_link_options(${target_name} PRIVATE $<$<CONFIG:Debug>:${LINK_OPTIONS}>)
  endif()
endfunction()