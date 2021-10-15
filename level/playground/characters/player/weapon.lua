
Weapon = {}
Weapon.__index = Weapon

function Weapon.new( name, dammage, heat, cool, price )
	local this = {}
	setmetatable( this, Weapon )

	this.name = name
	this.dammage = dammage
	this.heat = heat
	this.cool = cool
	this.price = price

	return this
end


Weapon.PULSE_RIFLE = Weapon.new( R:txt( "Pulsgewehr" ), 15, 12, 15, 240 )

return Weapon

