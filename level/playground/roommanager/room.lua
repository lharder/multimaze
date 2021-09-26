local Serializable = require( "nexus.serializable" )
local lua = require( "deflibs.lualib" )

local Room = {}
Room.__index = Room


local function selectFreeDoorName( room )
	local nextDoorIndex = lua.length( room.doors ) + 1
	if nextDoorIndex > lua.length( room.roomtype.doorNames ) then return nil end
	
	return room.roomtype.doorNames[ nextDoorIndex ]
end


----------------------------
function Room.new( roomtype, id )
	local this = {}
	setmetatable( this, Room )

	this.id = id
	this.roomtype = roomtype
	this.doors = {}
	
	return this
end



function Room:connect( other )
	if other == nil then return false end
	if self.roomtype.maxDoors <= #self.doors then return false end
	if other.roomtype.maxDoors <= #other.doors then return false end

	local selfDoorName = selectFreeDoorName( self )
	self.doors[ selfDoorName ] = other.id 

	local otherDoorName = selectFreeDoorName( other )
	other.doors[ otherDoorName ] = self.id 

	return true
end


function Room:serialize()
	local ser = Serializable.new()
	ser:putNumber( "id", self.id )
	ser:putString( "roomtype", self.roomtype.key )

	local doors = Serializable.new()
	for key, roomId in pairs( self.doors ) do
		doors:putNumber( key, roomId )
	end
	ser:putString( "doors", doors:serialize() )
	
	return ser:serialize()
end


function Room:getObjByName( name )
	for i, obj in pairs( self.roomtype.data.layers[ "objects" ].objects ) do
		if name == obj.name then return obj end
	end
	return nil
end


return Room
