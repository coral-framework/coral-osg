-----------------------------
-- Setup
-----------------------------

require "testkit.Unit"

local coOsg = require "coOsg"
-----------------------------
-- Matrix Tests
-----------------------------
function constructorTest()
	local m1 = coOsg.Matrix()
	assert( m1 )
end

