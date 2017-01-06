# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu

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

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/gpu" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/alpha_comp.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/bgfg_segm.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/cascadeclassifier.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/cascadeclassifier_nvidia_api.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/driver_api_multi.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/driver_api_stereo_multi.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/farneback_optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/generalized_hough.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/hog.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/houghlines.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/morphology.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/multi.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/opengl.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/opticalflow_nvidia_api.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/pyrlk_optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/stereo_match.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/stereo_multi.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/super_resolution.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/surf_keypoint_matcher.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/video_reader.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/gpu/video_writer.cpp"
    )
endif()

