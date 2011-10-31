################################################################################
# Build the Module
################################################################################

CORAL_GENERATE_MODULE( _MODULE_SOURCES coOsg )

# Setup OSG directories
FIND_PACKAGE( OpenSceneGraph REQUIRED )

INCLUDE_DIRECTORIES( ${CMAKE_CURRENT_SOURCE_DIR} ${CORAL_INCLUDE_DIRS} ${OPENSCENEGRAPH_INCLUDE_DIRS} ${CMAKE_CURRENT_BINARY_DIR}/generated )

FILE( GLOB _SOURCE_FILES *.cpp )
FILE( GLOB _HEADER_FILES *.hpp )

ADD_LIBRARY( coOsg MODULE ${_HEADER_FILES} ${_SOURCE_FILES} ${_MODULE_SOURCES} )

FIND_PACKAGE( OpenGL REQUIRED )
TARGET_LINK_LIBRARIES( coOsg ${CORAL_LIBRARIES} ${OPENSCENEGRAPH_LIBRARIES} ${OPENGL_gl_LIBRARY} ${OPENGL_glu_LIBRARY} )

CORAL_TARGET( coOsg )
CORAL_MODULE_TARGET( coOsg )

################################################################################
# Source Groups
################################################################################

SOURCE_GROUP( "@Generated" FILES ${_MODULE_SOURCES} )

