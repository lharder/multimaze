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
	local otherDoorName = selectFreeDoorName( other )

	self.doors[ selfDoorName ] = { roomid = other.id,  doorname = otherDoorName } 
	other.doors[ otherDoorName ] = { roomid = self.id,  doorname = selfDoorName }

	return true
end


function Room:serialize()
	local ser = Serializable.new()
	ser:putNumber( "id", self.id )
	ser:putString( "roomtype", self.roomtype.key )

	local doors = Serializable.new()
	for key, doorinfo in pairs( self.doors ) do
		doors:putString( key, doorinfo.roomid .. "|" .. doorinfo.doorname )
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


function Room:getObjsByType( type )
	local objs = {}
	for i, obj in pairs( self.roomtype.data.layers[ "objects" ].objects ) do
		if type == obj.type then table.insert( objs, obj ) end
	end
	return objs
end

return Room
