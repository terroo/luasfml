cmake_minimum_required(VERSION 3.22)
project(luasfml)
set(CMAKE_CXX_FLAGS "-std=c++17")

file( GLOB_RECURSE SRC_LIST src/* game/*)

add_executable(${PROJECT_NAME} ${SRC_LIST})

target_link_libraries(${PROJECT_NAME} lua)
target_link_libraries(${PROJECT_NAME} sfml-system)
target_link_libraries(${PROJECT_NAME} sfml-window)
target_link_libraries(${PROJECT_NAME} sfml-graphics)
target_link_libraries(${PROJECT_NAME} sfml-audio)

target_include_directories(luasfml
  PRIVATE 
    ${PROJECT_SOURCE_DIR}/delivered/lua/include/lua
)

install(TARGETS luasfml DESTINATION bin)
add_custom_target("uninstall" COMMENT "Uninstall installed files")
add_custom_command(
    TARGET "uninstall"
    POST_BUILD
    COMMENT "Uninstall files with install_manifest.txt"
    COMMAND xargs rm -vf < install_manifest.txt || echo Nothing in install_manifest.txt to be uninstalled!
)
