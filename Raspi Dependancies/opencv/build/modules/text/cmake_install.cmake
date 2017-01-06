# Install script for directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text

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
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_text.3.2.0.dylib"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_text.3.2.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.3.2.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.3.2.dylib"
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib/libopencv_text.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libopencv_text.dylib")
  endif()
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/include/opencv2/text.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/text" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/include/opencv2/text/erfilter.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv2/text" TYPE FILE OPTIONAL FILES "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/include/opencv2/text/ocr.hpp")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/text" TYPE FILE PERMISSIONS OWNER_READ GROUP_READ WORLD_READ FILES
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/OCRBeamSearch_CNN_model_data.xml.gz"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/OCRHMM_knn_model_data.xml.gz"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/OCRHMM_transitions_table.xml"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/character_recognition.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/cropped_word_recognition.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/detect_er_chars.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/end_to_end_recognition.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext01.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext02.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext03.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext04.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext05.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext06.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_char01.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_char02.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_char03.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word01.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word01_mask.png"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word02.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word02_mask.png"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word03.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word03_mask.png"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word04.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word04_mask.png"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word05.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_segmented_word05_mask.png"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_word01.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_word02.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_word03.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/scenetext_word04.jpg"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/segmented_word_recognition.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/textdetection.cpp"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/textdetection.py"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/trained_classifierNM1.xml"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/trained_classifierNM2.xml"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/trained_classifier_erGrouping.xml"
    "/Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/text/samples/webcam_demo.cpp"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "samples" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/OpenCV/samples/text" TYPE DIRECTORY FILES "" USE_SOURCE_PERMISSIONS)
endif()

