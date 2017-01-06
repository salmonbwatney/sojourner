# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/python" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/_coverage.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/_doc.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/asift.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/browse.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/calibrate.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/camshift.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/coherence.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/color_histogram.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/common.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/contours.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/deconvolution.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/demo.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/dft.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/digits.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/digits_adjust.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/digits_video.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/distrans.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/edge.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/facedetect.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/feature_homography.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/find_obj.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/fitline.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/floodfill.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/gabor_threads.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/gaussian_mix.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/grabcut.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/hist.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/houghcircles.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/houghlines.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/inpaint.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/kalman.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/kmeans.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/lappyr.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/letter_recog.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/lk_homography.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/lk_track.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/logpolar.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/morphology.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/mosse.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/mouse_and_match.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/mser.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/opencv_version.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/opt_flow.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/peopledetect.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/plane_ar.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/plane_tracker.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/squares.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/stereo_match.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/texture_flow.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/tst_scene_render.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/turing.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/video.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/video_threaded.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/video_v4l2.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/python/watershed.py"
    )
endif()

