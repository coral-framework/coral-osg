################################################################################
# OpenSceneGraph - Graphics Framework
################################################################################

CMAKE_MINIMUM_REQUIRED( VERSION 2.6 )

PROJECT( CORAL_OSG )

################################################################################
# Setup Coral
################################################################################

# Resolve the CORAL_ROOT
FILE( TO_CMAKE_PATH "$ENV{CORAL_ROOT}" CORAL_ROOT )

# Add Coral's CMake dir to the CMAKE_MODULE_PATH
SET( CMAKE_MODULE_PATH ${CORAL_ROOT}/cmake ${CMAKE_MODULE_PATH} )

# Load Coral's CMake package
FIND_PACKAGE( Coral REQUIRED )

# Configure the coral path
SET( CORAL_PATH
	"${CORAL_ROOT}/modules"
	"${CMAKE_BINARY_DIR}/modules"
	"${CMAKE_SOURCE_DIR}/modules"
)

################################################################################
# Installation
################################################################################

# enforce a safe default CMAKE_INSTALL_PREFIX
IF( NOT CMAKE_INSTALL_PREFIX MATCHES "coral-osg" )
	SET( CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/coral-osg" )
ENDIF()

# install shared library
INSTALL( DIRECTORY ${CMAKE_BINARY_DIR}/modules/coOsg DESTINATION modules )

# install CSL files
INSTALL( DIRECTORY ${CMAKE_SOURCE_DIR}/modules/ DESTINATION modules )

################################################################################
# Packaging
################################################################################
SET( CPACK_PACKAGE_NAME					"coral-osg" )
SET( CPACK_PACKAGE_VERSION_MAJOR		"0" )
SET( CPACK_PACKAGE_VERSION_MINOR		"1" )
SET( CPACK_PACKAGE_VERSION_PATCH		"0" )
SET( CPACK_PACKAGE_DESCRIPTION_SUMMARY	"A module for integrating [OpenSceneGraph](http://openscenegraph.org/) into Coral" )

INCLUDE( CPack )

################################################################################
# Subdirectories
################################################################################

ADD_SUBDIRECTORY( src )

ENABLE_TESTING()
ADD_SUBDIRECTORY( tests )

