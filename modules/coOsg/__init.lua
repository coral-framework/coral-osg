local M = {}

-------------------------------------------------------------------------------
-- Vectors Constructors
-------------------------------------------------------------------------------

function M.Vec3( x, y, z )
	local v = co.new( "coOsg.Vec3" )
	v.x = x
	v.y = y
	v.z = z
	return v
end

-------------------------------------------------------------------------------
-- Quaternion and Matrix Constructors
-------------------------------------------------------------------------------
function M.Mat4()
	return co.new( "coOsg.Mat4" )
end

function M.Quat( angle, x, y, z )
	local v = co.new( "coOsg.Quat" )
	v:makeRotate( angle, M.Vec3( x, y, z ) );
	return v
end

-------------------------------------------------------------------------------
-- Convenience functions
-------------------------------------------------------------------------------

-- Mat4
function compareDiagonalWithScalar( m, value )
	return ( value == m:getElement( 0, 0 ) ) and ( value == m:getElement( 1, 1 ) ) and
				( value == m:getElement( 2, 2 ) ) and ( value == m:getElement( 3, 3 ) )
end

function compareMatrixWithTolerance( m1, m2 )
	for i=0,3 do
		for j = 0,3 do
			ASSERT_DOUBLE_EQ( m1:getElement( i, j ), m2:getElement( i, j ), "The m[" .. i .. "][" .. j .. "] element of matrix is " .. m1:getElement( i, j ) .. " when the expected is " .. m2:getElement( i, j ) )
		end
	end
end

-- Quat
function compareQuat( q1, q2 )
	ASSERT_EQ( q1.x, q2.x, "The value of coordinate X is " .. tostring(q1.x) .. " when the expected is " .. tostring(q2.x) )
	ASSERT_EQ( q1.y, q2.y, "The value of coordinate Y is " .. tostring(q1.y) .. " when the expected is " .. tostring(q2.y) )
	ASSERT_EQ( q1.z, q2.z, "The value of coordinate Z is " .. tostring(q1.z) .. " when the expected is " .. tostring(q2.z) )
	ASSERT_EQ( q1.w, q2.w, "The value of coordinate W is " .. tostring(q1.w) .. " when the expected is " .. tostring(q2.w) )
end

function compareQuatWithTolerance( q1, q2 )
	ASSERT_DOUBLE_EQ( q1.x, q2.x, "The value of coordinate X is " .. tostring(q1.x) .. " when the expected is " .. tostring(q2.x) )
	ASSERT_DOUBLE_EQ( q1.y, q2.y, "The value of coordinate Y is " .. tostring(q1.y) .. " when the expected is " .. tostring(q2.y) )
	ASSERT_DOUBLE_EQ( q1.z, q2.z, "The value of coordinate Z is " .. tostring(q1.z) .. " when the expected is " .. tostring(q2.z) )
	ASSERT_DOUBLE_EQ( q1.w, q2.w, "The value of coordinate W is " .. tostring(q1.w) .. " when the expected is " .. tostring(q2.w) )
end

-- Vec3
function compareVec3( v1, v2 )
	ASSERT_EQ( v1.x, v2.x, "The value of coordinate X is " .. tostring(v1.x) .. " when the expected is " .. tostring(v2.x) )
	ASSERT_EQ( v1.y, v2.y, "The value of coordinate Y is " .. tostring(v1.y) .. " when the expected is " .. tostring(v2.y) )
	ASSERT_EQ( v1.z, v2.z, "The value of coordinate Z is " .. tostring(v1.z) .. " when the expected is " .. tostring(v2.z) )
end

function compareVec3WithTolerance( v1, v2 )
	ASSERT_DOUBLE_EQ( v1.x, v2.x, "The value of coordinate X is " .. tostring(v1.x) .. " when the expected is " .. tostring(v2.x) )
	ASSERT_DOUBLE_EQ( v1.y, v2.y, "The value of coordinate Y is " .. tostring(v1.y) .. " when the expected is " .. tostring(v2.y) )
	ASSERT_DOUBLE_EQ( v1.z, v2.z, "The value of coordinate Z is " .. tostring(v1.z) .. " when the expected is " .. tostring(v2.z) )
end

return M

