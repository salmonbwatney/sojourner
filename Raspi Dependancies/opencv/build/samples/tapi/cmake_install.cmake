# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/tapi" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/bgfg_segm.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/camshift.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/clahe.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/hog.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/pyrlk_optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/squares.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/tvl1_optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/tapi/ufacedetect.cpp"
    )
endif()

