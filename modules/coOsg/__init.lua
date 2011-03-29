local M = {}

function M.Vec3( x, y, z )
	local vec3 = co.new( "coOsg.Vec3" )
	vec3:set( x, y, z )
	return vec3
end


return M

