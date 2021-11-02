local Hud = require( "level.playground.hud.hud" )

local KEYCARD_BLUE 	= hash( "keyblue" )
local KEYCARD_RED 	= hash( "keyred" )
local KEYCARD_GOLD 	= hash( "keygold" )

local function newGui()
	return Hud.new( "/hud" )
end


-------------------
Stats = {}
Stats.__index = Stats

function Stats.new()
	local this = {}
	setmetatable( this, Stats )

	this.health = 100
	this.hearts = { all = 3,  active = 3 }
	this.heat = 0
	this.money = 0
	this.keycards = {}
	this.keycards[ KEYCARD_BLUE ] 	= 0
	this.keycards[ KEYCARD_RED ] 	= 0
	this.keycards[ KEYCARD_GOLD ] 	= 0

	return this
end


function Stats:initGui()
	self.hud = Hud.new( "/hud" )
	self:updateHud()
end


function Stats:setMoney( money )
	if money == nil then return end
	self.money = money
	if self.hud == nil then self:initGui() end
	self.hud:setMoney( money )
end

function Stats:getMoney()
	return self.money
end

function Stats:addMoney( delta )
	if delta == nil then return end
	self:setMoney( self:getMoney() + delta )
	return self.money
end


function Stats:setHealth( health )
	if health == nil then return end
	self.health = health
	if self.hud == nil then self:initGui() end
	self.hud:setHealth( health )
end

function Stats:getHealth()
	return self.health
end


function Stats:setHearts( all, active )
	self.hearts = { all = all, active = active }
	if self.hud == nil then self:initGui() end
	self.hud:setHearts( all, active )
end

function Stats:getHearts()
	return self.hearts.all, self.hearts.active
end


function Stats:setHeat( heat )
	if heat == nil then return end
	self.heat = heat
	if self.hud == nil then self:initGui() end
	self.hud:setHeat( heat )
end

function Stats:getHeat()
	return self.heat
end

function Stats:addHeat( delta )
	if delta == nil then return end
	self:setHeat( self:getHeat() + delta )
	return self.heat
end


function Stats:setKeycards( type, value )
	if( type == nil ) or ( value == nil ) then return end
	self.keycards[ type ] = value
	
	if self.hud == nil then self:initGui() end
	self.hud:setKeycards( type, value )
end

function Stats:getKeycards( type )
	return self.keycards[ type ]
end

function Stats:addKeycard( type, delta )
	if( type == nil ) or ( delta == nil ) then return end
	self:setKeycards( type, self:getKeycards( type ) + delta )
	return self.keycards[ type ]
end



function Stats:updateHud()
	if self.hud == nil then self:initGui() end
	self.hud:setMoney( self:getMoney() )
	self.hud:setHealth( self:getHealth() )
	self.hud:setHeat( self:getHeat() )
	self.hud:setHearts( self:getHearts() )
	self.hud:setKeycards( KEYCARD_BLUE, self:getKeycards( KEYCARD_BLUE ) )
	self.hud:setKeycards( KEYCARD_RED, self:getKeycards( KEYCARD_RED ) )
	self.hud:setKeycards( KEYCARD_GOLD, self:getKeycards( KEYCARD_GOLD ) )
end


return Stats

