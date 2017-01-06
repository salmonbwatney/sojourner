# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "libs" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY OPTIONAL FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_surface_matching.3.2.0.dylib"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_surface_matching.3.2.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.3.2.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.3.2.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/usr/local/lib"
        "${file}")
    endif()
  endforeach()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_surface_matching.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_surface_matching.dylib")
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/icp.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/pose_3d.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/ppf_helpers.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/ppf_match_3d.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/surface_matching" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/include/opencv2/surface_matching/t_hash_int.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/surface_matching" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/samples/ppf_load_match.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/samples/ppf_normal_computation.cpp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/surface_matching" TYPE DIRECTORY FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/surface_matching/samples/data" USE_SOURCE_PERMISSIONS)
endif()

