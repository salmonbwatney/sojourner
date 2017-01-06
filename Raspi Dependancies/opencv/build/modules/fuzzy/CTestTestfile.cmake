# CMake generated Testfile for 
# Source directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv_contrib/modules/fuzzy
# Build directory: /Users/Samantha/sojourner/Raspi Dependancies/opencv/build/modules/fuzzy
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(opencv_test_fuzzy "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/bin/opencv_test_fuzzy" "--gtest_output=xml:opencv_test_fuzzy.xml")
set_tests_properties(opencv_test_fuzzy PROPERTIES  LABELS "Extra;opencv_fuzzy;Accuracy" WORKING_DIRECTORY "/Users/Samantha/sojourner/Raspi Dependancies/opencv/build/test-reports/accuracy")
