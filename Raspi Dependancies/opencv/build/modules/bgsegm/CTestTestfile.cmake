# CMake generated Testfile for 
# Source directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/bgsegm
# Build directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/build/modules/bgsegm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_bgsegm "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/bin/opencv_test_bgsegm" "--gtest_output=xml:opencv_test_bgsegm.xml")
set_tests_properties(opencv_test_bgsegm PROPERTIES  LABELS "Extra;opencv_bgsegm;Accuracy" WORKING_DIRECTORY "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/test-reports/accuracy")
