local defgui = require( "defgui.defgui" )


local Hud = {}
Hud.__index = Hud


function Hud.new( url )
	local this = {}
	setmetatable( this, Hud )

	this.url = url
	
	return this
end

function Hud:setMoney( money )
	msg.post( self.url, "money", { value = money } )
end

function Hud:setHealth( health )
	msg.post( self.url, "health", { value = health } )
end

function Hud:setHearts( all, active )
	msg.post( self.url, "hearts", { all = all, active = active } )
end

function Hud:setHeat( heat )
	msg.post( self.url, "heat", { value = heat } )
end


return Hud

