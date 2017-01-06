# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets

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
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_datasets.3.2.0.dylib"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_datasets.3.2.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.3.2.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.3.2.dylib"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_datasets.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_datasets.dylib")
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/ar_hmdb.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/ar_sports.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/dataset.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/fr_adience.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/fr_lfw.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/gr_chalearn.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/gr_skig.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/hpe_humaneva.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/hpe_parse.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/ir_affine.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/ir_robot.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/is_bsds.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/is_weizmann.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/msm_epfl.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/msm_middlebury.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/or_imagenet.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/or_mnist.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/or_pascal.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/or_sun.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/pd_caltech.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/pd_inria.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/slam_kitti.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/slam_tumindoor.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/tr_chars.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/tr_icdar.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/tr_svt.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/track_alov.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/track_vot.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/datasets" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/include/opencv2/datasets/util.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/datasets" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/ar_hmdb.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/ar_hmdb_benchmark.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/ar_sports.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/fr_adience.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/fr_lfw.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/fr_lfw_benchmark.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/gr_chalearn.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/gr_skig.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/hpe_humaneva.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/hpe_parse.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/ir_affine.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/ir_robot.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/is_bsds.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/is_weizmann.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/msm_epfl.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/msm_middlebury.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/or_imagenet.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/or_mnist.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/or_pascal.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/or_sun.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/pd_caltech.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/pd_inria.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/slam_kitti.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/slam_tumindoor.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_chars.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_chars_benchmark.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_icdar.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_icdar_benchmark.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_svt.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/tr_svt_benchmark.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/datasets/samples/track_vot.cpp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/datasets" TYPE DIRECTORY FILES "" USE_SOURCE_PERMISSIONS)
endif()

