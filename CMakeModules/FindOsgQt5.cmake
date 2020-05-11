# - Find the native FriBiDI includes and library
#
# This module defines
#  OSGQT5_INCLUDE_DIR, where to find osgQt/GraphicsWindowQt, etc.
#  OSGQT5_LIBRARIES, the libraries to link against to use OsgQt5.
#  OSGQT5_FOUND, If false, do not try to use OsgQt5.
# also defined, but not for general use are
#  OSGQT5_LIBRARY, where to find the FriBiDi library.

SET(OSGQT5_FOUND "NO")

FIND_PATH(OSGQT5_INCLUDE_DIR osgQt/GraphicsWindowQt
  /usr/local/include
  /usr/include
  )

FIND_LIBRARY(OSGQT5_LIBRARY_RELEASE
  NAMES osgQt5
  PATHS /usr/lib /usr/local/lib
  )

FIND_LIBRARY(OSGQT5_LIBRARY_DEBUG
  NAMES osgQt5d
  PATHS /usr/lib /usr/local/lib
  )

select_library_configurations(OSGQT5)

IF (OSGQT5_LIBRARY AND OSGQT5_INCLUDE_DIR)
  SET(CMAKE_REQUIRED_INCLUDES ${OSGQT5_INCLUDE_DIR})
  SET(CMAKE_REQUIRED_LIBRARIES ${OSGQT5_LIBRARY})
  SET(OSGQT5_LIBRARIES ${OSGQT5_LIBRARY})
  SET(OSGQT5_FOUND "YES")
ELSE(OSGQT5_LIBRARY AND OSGQT5_INCLUDE_DIR)
  SET(OSGQT5_LIBRARIES "NOTFOUND")
  SET(OSGQT5_INCLUDE_DIR "NOTFOUND")
  SET(OSGQT5_FOUND "NO")
ENDIF (OSGQT5_LIBRARY AND OSGQT5_INCLUDE_DIR)

IF (OSGQT5_FOUND)
  IF (NOT OSGQT5_FIND_QUIETLY)
    MESSAGE(STATUS "Found OsgQt5: ${OSGQT5_LIBRARY}")
  ENDIF (NOT OSGQT5_FIND_QUIETLY)
ELSE (OSGQT5_FOUND)
  IF (OSGQT5_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could not find OsgQt5 library")
  ENDIF (OSGQT5_FIND_REQUIRED)
ENDIF (OSGQT5_FOUND)