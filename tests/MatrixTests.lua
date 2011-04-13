-----------------------------
-- Setup
-----------------------------

require "testkit.Unit"

local coOsg = require "coOsg"

-----------------------------
-- Matrix Tests
-----------------------------

local m1 = coOsg.Matrix()
assert ( m1 )

local function validateElement( i, j, expected, value )
	ASSERT_DOUBLE_EQ( value, expected, "The value of m[" .. i .. "][" .. j .. "] is " .. value .. " when the expected is " .. expected )
end

function setAndGetElementTest()
	local expected = 10
	
	m1:makeIdentity()
	m1:setElement( 0, 0, expected )
	m1:setElement( 0, 3, expected )
	m1:setElement( 3, 0, expected )
	m1:setElement( 3, 3, expected )
	
	validateElement( 0, 0, expected, m1:getElement( 0, 0 ) )
	validateElement( 0, 3, expected, m1:getElement( 0, 3 ) )
	validateElement( 3, 0, expected, m1:getElement( 3, 0 ) )
	validateElement( 3, 3, expected, m1:getElement( 3, 3 ) )
	validateElement( 0, 1, 0, m1:getElement( 0, 1 ) )
end

function makeIdentityTest()
	m1:makeIdentity()
	
	local expected = 1
	validateElement( 0, 0, expected, m1:getElement( 0, 0 ) )
	validateElement( 1, 1, expected, m1:getElement( 1, 1 ) )
	validateElement( 2, 2, expected, m1:getElement( 2, 2 ) )
	validateElement( 3, 3, expected, m1:getElement( 3, 3 ) )
	validateElement( 0, 1, 0, m1:getElement( 0, 1 ) )
end

function makeScaleTest()
	local scale = coOsg.Vec3( 1, 2, 3 )
	
	m1:makeScale( scale )
	
	validateElement( 0, 0, scale.x, m1:getElement( 0, 0 ) )
	validateElement( 0, 1, 0, m1:getElement( 0, 1 ) )
	validateElement( 0, 2, 0, m1:getElement( 0, 2 ) )
	validateElement( 0, 3, 0, m1:getElement( 0, 3 ) )
	
	validateElement( 1, 0, 0, m1:getElement( 1, 0 ) )
	validateElement( 1, 1, scale.y, m1:getElement( 1, 1 ) )
	validateElement( 1, 2, 0, m1:getElement( 1, 2 ) )
	validateElement( 1, 3, 0, m1:getElement( 1, 3 ) )
	
	validateElement( 2, 0, 0, m1:getElement( 2, 0 ) )
	validateElement( 2, 1, 0, m1:getElement( 2, 1 ) )
	validateElement( 2, 2, scale.z, m1:getElement( 2, 2 ) )
	validateElement( 2, 3, 0, m1:getElement( 2, 3 ) )
	
	validateElement( 3, 0, 0, m1:getElement( 3, 0 ) )
	validateElement( 3, 1, 0, m1:getElement( 3, 1 ) )
	validateElement( 3, 2, 0, m1:getElement( 3, 2 ) )
	validateElement( 3, 3, 1, m1:getElement( 3, 3 ) )
end

function makeTranslateTest()
	local translation = coOsg.Vec3( 1, 2, 3 )
	
	m1:makeTranslate( translation )
	
	validateElement( 0, 0, 1, m1:getElement( 0, 0 ) )
	validateElement( 0, 1, 0, m1:getElement( 0, 1 ) )
	validateElement( 0, 2, 0, m1:getElement( 0, 2 ) )
	validateElement( 0, 3, 0, m1:getElement( 0, 3 ) )
	
	validateElement( 1, 0, 0, m1:getElement( 1, 0 ) )
	validateElement( 1, 1, 1, m1:getElement( 1, 1 ) )
	validateElement( 1, 2, 0, m1:getElement( 1, 2 ) )
	validateElement( 1, 3, 0, m1:getElement( 1, 3 ) )
	
	validateElement( 2, 0, 0, m1:getElement( 2, 0 ) )
	validateElement( 2, 1, 0, m1:getElement( 2, 1 ) )
	validateElement( 2, 2, 1, m1:getElement( 2, 2 ) )
	validateElement( 2, 3, 0, m1:getElement( 2, 3 ) )
	
	validateElement( 3, 0, translation.x, m1:getElement( 3, 0 ) )
	validateElement( 3, 1, translation.y, m1:getElement( 3, 1 ) )
	validateElement( 3, 2, translation.z, m1:getElement( 3, 2 ) )
	validateElement( 3, 3, 1, m1:getElement( 3, 3 ) )
end

function makeRotate()
	local angle = 90 --degrees
	local axis = coOsg.Vec3( 1, 0, 0 )
	
	m1:makeRotate( angle, axis )
	
	validateElement( 0, 0, 1, m1:getElement( 0, 0 ) )
	validateElement( 0, 1, 0, m1:getElement( 0, 1 ) )
	validateElement( 0, 2, 0, m1:getElement( 0, 2 ) )
	validateElement( 0, 3, 0, m1:getElement( 0, 3 ) )
	
	validateElement( 1, 0, 0, m1:getElement( 1, 0 ) )
	validateElement( 1, 1, math.cos( angle ), m1:getElement( 1, 1 ) )
	validateElement( 1, 2, math.sin( angle ), m1:getElement( 1, 2 ) )
	validateElement( 1, 3, 0, m1:getElement( 1, 3 ) )
	
	validateElement( 2, 0, 0, m1:getElement( 2, 0 ) )
	validateElement( 2, 1, -math.sin( angle ), m1:getElement( 2, 1 ) )
	validateElement( 2, 2, math.cos( angle ), m1:getElement( 2, 2 ) )
	validateElement( 2, 3, 0, m1:getElement( 2, 3 ) )
	
	validateElement( 3, 0, 0, m1:getElement( 3, 0 ) )
	validateElement( 3, 1, 0, m1:getElement( 3, 1 ) )
	validateElement( 3, 2, 0, m1:getElement( 3, 2 ) )
	validateElement( 3, 3, 1, m1:getElement( 3, 3 ) )
end

function preMultiplicationTest()
	local v1 = coOsg.Vec3( 1, 2, 3 )
	
	m1:makeIdentity()
	m1:setElement( 0, 0, 1 )
	m1:setElement( 0, 1, 2 )
	m1:setElement( 0, 2, 3 )
	m1:setElement( 0, 3, 4 )
	
	v1 = m1:preMult( v1 )
	
	validateElement( 0, 0, 0.2, v1.x )
	validateElement( 0, 1, 0.8, v1.y )
	validateElement( 0, 2, 1.2, v1.z )
end

function preMultiplicationTest()
	local v1 = coOsg.Vec3( 1, 2, 3 )
	
	m1:makeIdentity()
	m1:setElement( 0, 0, 1 )
	m1:setElement( 0, 1, 2 )
	m1:setElement( 0, 2, 3 )
	m1:setElement( 0, 3, 4 )
	
	v1 = m1:postMult( v1 )
	
	validateElement( 0, 0, 18, v1.x )
	validateElement( 0, 1, 2, v1.y )
	validateElement( 0, 2, 3, v1.z )
end

