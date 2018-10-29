cmake_minimum_required (VERSION 2.6)

project (Tutorial)

include_directories(curl_include parson_include main_includes openssl_include zlib_include)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0 -std=c++11")

# file(GLOB_RECURSE BOOST_SRC RELATIVE ${CMAKE_SOURCE_DIR} "boost_src/*")

file(GLOB_RECURSE JSON_PARSE_SRC RELATIVE ${CMAKE_SOURCE_DIR} "parson_src/*")

add_compile_definitions(TARGET_RASPBERRY_PI)

set(TUTORIAL_SRC main_src/main.cpp
                main_src/utils.cpp)

add_executable(Tutorial ${TUTORIAL_SRC} ${JSON_PARSE_SRC})

set(OPENSSL_LIBS ${CMAKE_SOURCE_DIR}/openssl_lib/libssl.a
                ${CMAKE_SOURCE_DIR}/openssl_lib/libcrypto.a)

set(CURL_LIBS ${CMAKE_SOURCE_DIR}/curl_lib/libcurl.a)

set(ZLIB_LIBS ${CMAKE_SOURCE_DIR}/zlib_lib/libz.a)

set(SYSTEM_LIBS -lpthread)

target_link_libraries(Tutorial ${SYSTEM_LIBS} ${CURL_LIBS} ${ZLIB_LIBS} ${OPENSSL_LIBS})

set( CMAKE_VERBOSE_MAKEFILE on)

# TARGET_LINK_LIBRARIES(Tutorial GL)
