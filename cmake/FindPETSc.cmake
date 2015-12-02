# todo (l) Bill : everything except petsc and blaslapack is optional

include(util)
checkSetParam(PETSC_DIR)
checkSetParam(PETSC_ARCH)

find_package(PkgConfig)
set(ENV{PKG_CONFIG_PATH} "${PETSC_DIR}/${PETSC_ARCH}/lib/pkgconfig/")
pkg_check_modules(PC_PETSC PETSc)

find_path(PETSC_INCLUDE_DIR_ONE petscksp.h
          HINTS ${PC_PETSC_INCLUDEDIR}
          PATH_SUFFIXES include)

find_path(PETSC_INCLUDE_DIR_TWO petscfix.h
          HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
          PATH_SUFFIXES include)

set(PETSC_INCLUDE_DIRS ${PETSC_INCLUDE_DIR_ONE} ${PETSC_INCLUDE_DIR_TWO})

find_library(PETSC_LIB petsc
             HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
             PATH_SUFFIXES lib)

find_library(SUPERLU_LIB superlu_dist_4.1
             HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
             PATH_SUFFIXES lib)

find_package(parmetis)
find_package(zoltan)
find_package(scotch)

find_library(LAPACK_LIB f2clapack
             HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
             PATH_SUFFIXES lib)

if(NOT ${LAPACK_LIB})
  find_library(LAPACK_LIB flapack
               HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
               PATH_SUFFIXES lib)
endif()

find_library(BLAS_LIB f2cblas
             HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
             PATH_SUFFIXES lib)

if(NOT ${BLAS_LIB})
  find_library(BLAS_LIB fblas
               HINTS ${PC_PETSC_PREFIX}/${PETSC_ARCH}
               PATH_SUFFIXES lib)
endif()


set(PETSC_LIBRARIES ${PETSC_LIB} 
                    ${SUPERLU_LIB} 
                    ${PARMETIS_LIBRARIES} 
                    ${ZOLTAN_LIBRARIES}
		    ${SCOTCH_LIBS}
                    ${LAPACK_LIB}
                    ${BLAS_LIB})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(PETSc DEFAULT_MSG 
  PETSC_LIBRARIES 
  PETSC_INCLUDE_DIRS)
mark_as_advanced(PETSC_LIBRARIES PETSC_INCLUDE_DIRS)


