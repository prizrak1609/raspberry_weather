cmake_minimum_required (VERSION 2.6)

project (Tutorial)

include_directories(raspberry_sys curl_include parson_include)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -std=c++11")

# file(GLOB_RECURSE BOOST_SRC RELATIVE ${CMAKE_SOURCE_DIR} "boost_src/*")

file(GLOB_RECURSE CURL_SRC RELATIVE ${CMAKE_SOURCE_DIR} "curl_src/*")

file(GLOB_RECURSE JSON_PARSE_SRC RELATIVE ${CMAKE_SOURCE_DIR} "parson_src/*")

set(CURL_DEFINES __riscos__ BUILDING_LIBCURL USE_BLOCKING_SOCKETS)

add_compile_definitions(TARGET_RASPBERRY_PI ${CURL_DEFINES})

add_executable(Tutorial main.cpp ${CURL_SRC} ${JSON_PARSE_SRC})

set( CMAKE_VERBOSE_MAKEFILE on)

# TARGET_LINK_LIBRARIES(Tutorial GL)
