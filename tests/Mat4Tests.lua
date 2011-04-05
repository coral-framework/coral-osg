-----------------------------
-- Setup
-----------------------------

require "testkit.Unit"

local vl = require "vl"

local m1
local m2

-----------------------------
-- Mat4 Tests
-----------------------------

function setIdentityElementEqualsTest()
	m1 = vl.Mat4()
	m1:setIdentity()
	ASSERT_TRUE( compareDiagonalWithScalar( m1, 1.0 ) )
	
	m1:setElement( 0, 0, 0 )
	m1:setElement( 1, 1, 0 )
	m1:setElement( 2, 2, 0 )
	m1:setElement( 3, 3, 0 )
	ASSERT_TRUE( m1:isNull() )
end

function addMatrixTest()
	m1 = vl.Mat4()
	m2 = vl.Mat4()
	m1:add( m2 )
	ASSERT_TRUE( compareDiagonalWithScalar( m1, 2 ) )
end

function subtractMulScalarMatrixTest()
	local m3 = vl.Mat4()
	local m4 = vl.Mat4()
	m3:mulScalar( 5 )
	m4:mulScalar( 4 )
	m3:sub( m4 )
	m4:setIdentity()
	compareMatrixWithTolerance( m3, m4 )
end

function inverseMultiplyTest()
	local mIdentity = vl.Mat4()
	local mInvertible = vl.Mat4()
	mInvertible:fill( 3 )
	mInvertible:add( mIdentity )
	
	local mCopy = vl.Mat4()
	mCopy:copy( mInvertible )
	mInvertible:invert()
	mInvertible:posMul( mCopy );
	compareMatrixWithTolerance( mInvertible, mIdentity );
end

function scalarOperationTest()
	m1 = vl.Mat4()
	m2 = vl.Mat4()
	m1:addScalar( 1 )
	m1:addScalar( 1 )
	m2:addScalar( 2 )
	compareMatrixWithTolerance( m1, m2 );
	
	m1:subScalar( 1 )
	m1:subScalar( 1 )
	m2:subScalar( 2 )
	compareMatrixWithTolerance( m1, m2 );
	
	m1:mulScalar( 0.5 )
	m2:divScalar( 2 )
	compareMatrixWithTolerance( m1, m2 );
end

function localTransformsTest()
	m1 = vl.Mat4()
	m2 = vl.Mat4()
	m1:setIdentity()
	m1:rotate( 90, vl.Vec3( 1, 0, 0 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 1 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 2 ), -1.0 )
	
	m1:setIdentity()
	m1:rotateFromTo( vl.Vec3( 0, 1, 0 ), vl.Vec3( 0, 0, 1 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 1 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 2 ), -1.0 )
	
	m1:setIdentity()
	m1:translate( vl.Vec3( 1, 0, 0 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 3 ), 1.0 )
	
	m1:setIdentity()
	m1:scale( 2, 2, 2 )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 2.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 2.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 2.0 )
end
	
function setTransformsTest()
	m1 = vl.Mat4()
	m2 = vl.Mat4()
	m1:setPerspective( 90, 1, 1, 10 )
	m2:setFrustum( -1, 1, -1, 1, 1, 10 )
	compareMatrixWithTolerance( m1, m2 );
	
	m1:setOrtho( -1, 1, -1, 1, 1, 10 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), -0.2222222222222 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 3 ), -1.2222222222222 )
	
	m1:setLookAt( vl.Vec3( 0, 0, 0 ), vl.Vec3( 0, 0, 1 ), vl.Vec3( 0, 1, 0 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), -1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), -1.0 )
	
	m1:setRotationAngleAxis( 90, vl.Vec3( 1, 0, 0 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 1 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 2 ), -1.0 )
	
	m1:setRotationFromTo( vl.Vec3( 0, 1, 0 ), vl.Vec3( 0, 0, 1 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 1 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 2 ), -1.0 )
	
	m1:setRotationXYZ( 90, 90, 0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 0 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 0 ), 0.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 1 ), 1.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 2 ), 1.0 )
	
	m1:setOrtho2D( -1, 1, -1, 1 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), -1.0 )
	
	m1:setTranslation( vl.Vec3( 1, 0, 0 ) )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 3 ), 1.0 )
	
	m1:setScaling( 2, 2, 2 )
	ASSERT_DOUBLE_EQ( m1:getElement( 0, 0 ), 2.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 1, 1 ), 2.0 )
	ASSERT_DOUBLE_EQ( m1:getElement( 2, 2 ), 2.0 )
end

function invertTransposeTest()
	m1 = vl.Mat4()
	m2 = vl.Mat4()
	m2:setRotationAngleAxis( 90, vl.Vec3( 1, 0, 0 ) )
	m1:copy( m2 )
	m1:invert()
	m2:transpose()
	compareMatrixWithTolerance( m1, m2 );
	
	m2:transpose()
	m2:preMul( m1 )
	m1:setIdentity()
	compareMatrixWithTolerance( m1, m2 );
end

