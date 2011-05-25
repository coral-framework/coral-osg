local M = {}
M.PI = 3.1415926535
M.PI_2 = 3.1415926535 * 0.5
M.PI_4 = 3.1415926535 * 0.25

-- transforms given coordinates to [-1,1] space within given half interval
-- returns two values: normalized value of x and of y
function M.normalizeCoordinates( x, y, halfXInterfal, halfXInterval )
	return ( x / halfXInterfal ) - 1.0, ( y / halfXInterval  ) - 1.0
end

local M_PI2_DIV_360 = 2 * M.PI / 360
-------------------------------------------------------------------------------
-- Vectors Constructors
-------------------------------------------------------------------------------
function M.deg2rad( degrees )
	return M_PI2_DIV_360 * degrees
end

function M.Vec3Copy( v )
	return M.Vec3( v.x, v.y, v.z )
end

function M.Vec3( x, y, z )
	local v = co.new( "coOsg.Vec3" )
	v.x = x or 0
	v.y = y or 0
	v.z = z or 0
	return v
end

-------------------------------------------------------------------------------
-- Quaternion Constructors
-------------------------------------------------------------------------------
function M.Quat( x, y, z, w )
	local q = co.new( "coOsg.Quat" )
	q.x = x or 0
	q.y = y or 0
	q.z = z or 0
	q.w = w or 1
	return q
end

function M.QuatFromRotation( angle, x, y, z )
	local v = co.new( "coOsg.Quat" )
	v:makeRotate( angle, x, y, z );
	return v
end

-------------------------------------------------------------------------------
-- Matrix Constructors
-------------------------------------------------------------------------------
function M.Matrix()
	local m = co.new( "coOsg.Matrix" )
	return m
end

return M

