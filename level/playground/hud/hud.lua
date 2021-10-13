local defgui = require( "defgui.defgui" )


local Hud = {}
Hud.__index = Hud


function Hud.new( url )
	local this = {}
	setmetatable( this, Hud )

	this.url = url
	
	this.props = {}
	this.props.money = 0
	this.props.health = 100
	this.props.hearts = 3
	this.props.heat = 0
	
	return this
end



function Hud:setMoney( money )
	self.props.money = money
	msg.post( self.url, "money", { value = money } )
end

function Hud:getMoney()
	return self.props.money
end


function Hud:setHealth( health )
	self.props.health = health
	msg.post( self.url, "health", { value = health } )
end

function Hud:getHealth()
	return self.props.health
end


function Hud:setHearts( all, active )
	self.props.hearts = { all = all, active = active }
	msg.post( self.url, "hearts", self.props.hearts )
end

function Hud:getHearts()
	return self.props.hearts
end


function Hud:setHeat( heat )
	self.props.heat = heat
	msg.post( self.url, "heat", { value = heat } )
end

function Hud:getHeat()
	return self.props.heat
end


return Hud

