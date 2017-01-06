# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/cpp" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/3calibration.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/autofocus.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/bgfg_segm.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/calibration.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/camshiftdemo.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/cloning_demo.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/cloning_gui.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/connected_components.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/contours2.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/convexhull.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/cout_mat.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/create_mask.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/dbt_face_detection.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/delaunay2.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/demhist.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/detect_blob.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/detect_mser.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/dft.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/distrans.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/drawing.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/edge.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/em.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/facedetect.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/facial_features.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/fback.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/ffilldemo.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/filestorage.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/filestorage_base64.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/fitellipse.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/grabcut.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/houghcircles.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/houghlines.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/image.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/image_alignment.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/image_sequence.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/imagelist_creator.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/inpaint.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/intelperc_capture.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/kalman.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/kmeans.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/laplace.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/letter_recog.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/lkdemo.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/logistic_regression.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/lsd_lines.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/mask_tmpl.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/matchmethod_orb_akaze_brisk.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/minarea.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/morphology2.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/neural_network.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/npr_demo.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/opencv_version.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/openni_capture.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/pca.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/peopledetect.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/phase_corr.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/points_classifier.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/polar_transforms.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/segment_objects.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/select3dobj.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/shape_example.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/smiledetect.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/squares.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/starter_imagelist.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/stereo_calib.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/stereo_match.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/stitching.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/stitching_detailed.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/train_HOG.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/train_svmsgd.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/tree_engine.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/tvl1_optical_flow.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/videocapture_basic.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/videocapture_starter.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/videostab.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/videowriter_basic.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/samples/cpp/watershed.cpp"
    )
endif()

