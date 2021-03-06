# - Try to find HYPRE
#

find_path (HYPRE_DIR include/HYPRE.h HINTS ENV HYPRE_DIR PATHS $ENV{HOME}/hypre DOC "Hypre Directory")

IF(EXISTS ${HYPRE_DIR}/include/HYPRE.h)
  SET(HYPRE_FOUND YES)
  SET(HYPRE_INCLUDES ${HYPRE_DIR})
  find_path (HYPRE_INCLUDE_DIR HYPRE.h HINTS "${HYPRE_DIR}" PATH_SUFFIXES include NO_DEFAULT_PATH)
  list(APPEND HYPRE_INCLUDES ${HYPRE_INCLUDE_DIR})
  FILE(GLOB HYPRE_LIBRARIES RELATIVE "${HYPRE_DIR}/lib" "${HYPRE_DIR}/lib/libHYPRE*.a")
ELSE(EXISTS ${HYPRE_DIR}/include/HYPRE.h)
  SET(HYPRE_FOUND NO)
ENDIF(EXISTS ${HYPRE_DIR}/include/HYPRE.h)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HYPRE DEFAULT_MSG HYPRE_LIBRARIES HYPRE_INCLUDES)