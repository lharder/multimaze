local Hud = require( "level.playground.hud.hud" )


Stats = {}
Stats.__index = Stats


function Stats.new()
	local this = {}
	setmetatable( this, Stats )

	this.health = 100
	this.hearts = { all = 3,  active = 3 }
	this.heat = 0
	this.money = 0

	this.hud = Hud.new( "/hud" )
	this:updateHud()

	return this
end


function Stats:setMoney( money )
	if money == nil then return end
	self.money = money
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
	self.hud:setHealth( health )
end

function Stats:getHealth()
	return self.health
end


function Stats:setHearts( all, active )
	self.hearts = { all = all, active = active }
	self.hud:setHearts( all, active )
end

function Stats:getHearts()
	return self.hearts.all, self.hearts.active
end


function Stats:setHeat( heat )
	if heat == nil then return end
	self.heat = heat
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



function Stats:updateHud()
	self.hud:setMoney( self:getMoney() )
	self.hud:setHealth( self:getHealth() )
	self.hud:setHeat( self:getHeat() )
	self.hud:setHearts( self:getHearts() )
end


return Stats

