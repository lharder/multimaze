local Set = require( "deflibs.set" )
local Room = require( "level.playground.roommanager.room" )

local Roomtype = {}
Roomtype.__index = Roomtype


local function setup( roomtype )
	-- make layers available by their names
	local layers = {}
	for i, layer in pairs( roomtype.data.layers ) do
		layers[ layer.name ] = layer
	end
	roomtype.data.layers = layers

	-- prepare objects for better access
	roomtype.maxDoors = 0
	roomtype.doorNames = {}
	local yMax = roomtype.data.height * roomtype.data.tileheight  
	for name, obj in pairs( layers[ "objects" ].objects ) do
		-- calculate proper coordinates (inverted y-axis in Tiled)
		obj.y = yMax - obj.y
		
		-- count doors
		if obj.type == "door" then 
			roomtype.maxDoors = roomtype.maxDoors + 1 
			table.insert( roomtype.doorNames, obj.name )
		end
	end
end


----------------------------
function Roomtype.new( data, ... )
	local this = {}
	setmetatable( this, Roomtype )

	-- set by roommanager
	this.key = ""			
	
	this.data = data
	this.used = 0
	
	this.tags = Set.new({ ... })
	
	setup( this )
	
	return this
end


function Roomtype.isMatch( self, ... )
	local needed = Set.new({ ... })
	local common = self.tags:intersection( needed )
	return common:equals( needed )
end

--[[
function Roomtype:newRoom( id )
	return Room.new( self, id )
end
--]]

return Roomtype

