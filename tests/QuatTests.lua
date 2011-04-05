-----------------------------
-- Setup
-----------------------------

require "testkit.Unit"

local vl = require "vl"

local q1
local q2
local expected

-----------------------------
-- Quat Tests
-----------------------------

function quatToVec4Test()
	q1 = vl.Quat()
	local v1 = q1:toVec4()
	expected = vl.Vec4( 0.0, 0.0, 0.0, 1.0 )
	compareVec4( v1, expected )
end

function quatToMat4Test()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 1.0 )
	local m1 = q1:toMat4()
	local m2 = vl.Mat4()
	
	m2:setElement( 0, 0, -25 )
	m2:setElement( 1, 0, 10 )
	m2:setElement( 2, 0, 2 )
	m2:setElement( 3, 0, 0 )
	
	m2:setElement( 0, 1, -2 )
	m2:setElement( 1, 1, -19 )
	m2:setElement( 2, 1, 14 )
	m2:setElement( 3, 1, 0 )
	
	m2:setElement( 0, 2, 10 )
	m2:setElement( 1, 2, 10 )
	m2:setElement( 2, 2, -9 )
	m2:setElement( 3, 2, 0 )
	
	m2:setElement( 0, 3, 0 )
	m2:setElement( 1, 3, 0 )
	m2:setElement( 2, 3, 0 )
	m2:setElement( 3, 3, 1 )
	
	compareMatrixWithTolerance( m1, m2 )
end

function multiplyQuaternionByScalarTest()
	local scalar = 2.0
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	expected = vl.QuatFromCoordinates( q1.x * scalar, q1.y * scalar, q1.z * scalar, q1.w * scalar )
	q1:mul( scalar )
	compareQuat( q1, expected )
end

function addTwoQuaternionsTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	q2 = vl.Quat() --(0.0, 0.0, 0.0, 1.0)
	expected = vl.QuatFromCoordinates( q1.x + q2.x, q1.y + q2.y, q1.z + q2.z, q1.w + q2.w )
	q1:add( q2 )
	compareQuat( q1, expected )
end

function subtractTwoQuaternionsTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	q2 = vl.Quat() --(0.0, 0.0, 0.0, 1.0)
	expected = vl.QuatFromCoordinates( q1.x - q2.x, q1.y - q2.y, q1.z - q2.z, q1.w - q2.w )
	q1:sub( q2 )
	compareQuat( q1, expected )
end

function dotProductTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	q2 = vl.Quat() --(0.0, 0.0, 0.0, 1.0)
	expected = q1.x * q2.x + q1.y * q2.y + q1.z * q2.z + q1.w * q2.w
	ASSERT_DOUBLE_EQ( q1:dot( q2 ), expected, "The result of dot product is " .. q1:dot( q2 ) .. " when the expected is " .. expected )

end

function verifyEqualityBetweenTwoVectorsTest()
	q1 = vl.QuatFromCoordinates( 0.0, 0.0, 0.0, 1.0 )
	q2 = vl.Quat() --(0.0, 0.0, 0.0, 1.0)
	ASSERT_TRUE( q1:equals( q2 ) == true, "The quaternions are not equals" )
end

function quatSetFromVectorsTest()
	q1 = vl.Quat()
	local from = vl.Vec3( 0, 1, 0 )
	local to = vl.Vec3( 0, 0, 1 )
	q1:setFromVectors( from, to )
	local m1 = vl.Mat4()
	m1:setRotationFromTo( from, to )
	compareMatrixWithTolerance( m1 , q1:toMat4() )
end

function quatSetFromMatrixTest()
	local m1 = vl.Mat4() -- identity
	q1:setFromMatrix( m1 )
	expected = vl.Quat()
	compareQuat( q1, expected )
end

function quatSetFromEulerXYZTest()
	q1 = vl.Quat()
	q1:setFromEulerXYZ( 90, 45, 45 )
	local m1 = vl.Mat4()
	m1:setRotationXYZ( 90, 45, 45 )
	compareMatrixWithTolerance( q1:toMat4(), m1 )
end

function quatSetFromAxisAngleTest()
	q1 = vl.Quat()
	q1:setFromAxisAngle( vl.Vec3( 1.0, 0.0, 0.0 ), 90 )
	local m1 = vl.Mat4()
	m1:setRotationAngleAxis( 90, vl.Vec3( 1.0, 0.0, 0.0 ) )
	compareMatrixWithTolerance( q1:toMat4(), m1 )
end

function quatSetFromSlerpTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	q2 = vl.Quat()
	expected = vl.QuatFromCoordinates( -1.0, -2.0, -3.0, -2.0 )
	q1:setFromSlerp( 2.0, q1, q2 )
	compareQuatWithTolerance( q1, expected )
end

function quatSetFromSquadTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, 3.0, 4.0 )
	q2 = vl.Quat()
	expected = vl.QuatFromCoordinates( 3.0, 6.0, 9.0, 18.0 )
	q1:setFromSquad( 2.0, q1, q2, q1, q2 )
	compareQuatWithTolerance( q1, expected )
end

function quatSetNoRotationTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, -3.0, 1.0 )
	expected = vl.QuatFromCoordinates( 0.0, 0.0, 0.0, 1.0 )
	q1:setNoRotation()
	compareQuat( q1, expected )
end

function quatLengthTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, -3.0, 1.0 )
	local expected = math.sqrt( q1.x * q1.x + q1.y + q1.y + q1.z * q1.z + q1.w * q1.w );
	ASSERT_DOUBLE_EQ( q1:length(), expected )	
end

function quatNormalizeTest()
	q1 = vl.QuatFromCoordinates( 2.0, 1.0, 2.0, 1.0 )
	local length = math.sqrt( q1.x * q1.x + q1.y * q1.y + q1.z * q1.z + q1.w * q1.w );
	expected = vl.QuatFromCoordinates( q1.x / length, q1.y / length, q1.z / length, q1.w / length )
	q1:normalize()
	compareQuatWithTolerance( q1, expected )
end

function quatConjugateTest()	
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, -3.0, 1.0 )
	expected = vl.QuatFromCoordinates( -q1.x, -q1.y, -q1.z, q1.w )
	q1 = q1:getConjugate()
	compareQuatWithTolerance( q1, expected )
end

function quatInverseTest()
	q1 = vl.QuatFromCoordinates( 1.0, 2.0, -3.0, 1.0 )
	local q2 = q1:getConjugate()
	local lengthSquared = q1:length() * q1:length()
	expected = vl.QuatFromCoordinates( q2.x / lengthSquared, q2.y/ lengthSquared, q2.z/ lengthSquared, q2.w / lengthSquared )
	q1 = q1:getInverse()
	compareQuatWithTolerance( q1, expected )
end

