local M = {}
M.PI = 3.1415926535
M.PI_2 = 3.1415926535 * 0.5
M.PI_4 = 3.1415926535 * 0.25

local M_PI2_DIV_360 = 2 * M.PI / 360
-------------------------------------------------------------------------------
-- Vectors Constructors
-------------------------------------------------------------------------------
function M.deg2rad( degrees )
	return M_PI2_DIV_360 * degrees
end

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
function M.Matrix()
	return co.new( "coOsg.Matrix" )
end

function M.QuatCopy( other )
	local v = co.new( "coOsg.Quat" )
	v.x = other.x
	v.y = other.y
	v.z = other.z
	v.w = other.w
	return v
end

function M.Quat()
	return co.new( "coOsg.Quat" )
end

function M.QuatFromRotation( angle, x, y, z )
	local v = co.new( "coOsg.Quat" )
	v:makeRotate( angle, M.Vec3( x, y, z ) );
	return v
end

function M.QuatFromCoordinates( x, y, z, w )
	local q = co.new( "coOsg.Quat" )
	q.x = x
	q.y = y
	q.z = z
	q.w = w
	return q
end

return M

