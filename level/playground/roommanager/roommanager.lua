local Set = require( "deflibs.set" )
local Roomtype = require( "level.playground.roommanager.roomtype" )
local Room = require( "level.playground.roommanager.room" )
local Serializable = require( "nexus.serializable" )


local Roommanager = {}
Roommanager.__index = Roommanager


local function sortBy( list, key )
	return table.sort( list, function( one, two )
		return one[ key ] < two[ key ]
	end )
end


local function newRoom( self, ... )
	local id = #self.rooms + 1
	local roomtype = self:selectType( ... )
	local room = Room.new( roomtype, id )
	table.insert( self.rooms, room )

	return room
end


---------------------------------
function Roommanager.new()
	local this = {}
	setmetatable( this, Roommanager )

	-- room definitions: may show up in several instances each!
	this.roomtypes = {}
	this.roomtypes[ "start" ] 		= Roomtype.new( require( "assets.tiles.room001" ), "start", "2doors" ) 
	this.roomtypes[ "dungeon01" ] 	= Roomtype.new( require( "assets.tiles.room002" ), "dungeon", "2doors", "medium" ) 
	this.roomtypes[ "dungeon02" ] 	= Roomtype.new( require( "assets.tiles.room003" ), "dungeon", "2doors", "small" ) 

	-- add room keys as ids
	for key, roomtype in pairs( this.roomtypes ) do 
		roomtype.key = key
	end
	
	-- rooms as randomly selected and defined for a specific game
	this.rooms = {}
	
	return this
end


-- select a room type that fits the given tags
function Roommanager.selectType( self, ... )
	-- select a room with the given tags
	local hits = {}
	for id, roomtype in pairs( self.roomtypes ) do 
		if roomtype:isMatch( ... ) then 
			table.insert( hits, roomtype )
		end
	end
	if #hits == 0 then return hits end

	-- from those rooms that have been used 
	-- least in sorted order least to most....
	sortBy( hits, "used" )
	local cnt = 1
	local least = hits[ 1 ].used
	for i = 2, #hits, 1 do
		if hits[ i ].used > least then 
			break
		else
			cnt = cnt + 1
		end
	end

	-- ...select one randomly
	local selected = math.random( 1, cnt )
	local roomtype = hits[ selected ]
	roomtype.used = roomtype.used + 1
	
	return roomtype
end


function Roommanager:setup()
	local roomA = newRoom( self, "start" )
	local roomB = newRoom( self, "dungeon" )
	local roomC = newRoom( self, "dungeon" )

	roomA:connect( roomB )
	roomA:connect( roomC )

	roomB:connect( roomC )
end


-- Returns an instance of a room in a specific game constellation
-- Every room as created in Tiled has a roomtype. There can be multiple 
-- instances of each roomtype in a constellation for a specific game 
-- with a random combination of rooms. Roommanager:get( id ) returns 
-- the instance with a given id
function Roommanager:get( id )
	return self.rooms[ id ]
end 


function Roommanager:put( id, room )
	self.rooms[ id ] = room
end 


function Roommanager:setCurrent( id )
	self.current = self:get( id )
end 


function Roommanager:getCurrent()
	return self.current
end 


function Roommanager:roomtype( key )
	return self.roomtypes[ key ]
end 


function Roommanager:serialize()
	local rooms = Serializable.new()
	for id, room in pairs( self.rooms ) do 
		rooms:put( "" .. id, room:serialize() )
	end
	
	return rooms:serialize()
end


function Roommanager:deserialize( model )
	local obj = Serializable.deserialize( model.rooms, true )
	self.rooms = {}

	-- create rooms
	local id = 0
	for iStr, serializedRoom in pairs( obj ) do
		local roominfo = Serializable.deserialize( serializedRoom, true )
		roominfo.doors = Serializable.deserialize( roominfo.doors, true )

		local parts
		for name, doorinfo in pairs( roominfo.doors ) do
			parts = doorinfo:split( "|" )
			roominfo.doors[ name ] = { roomid = tonumber( parts[ 1 ] ),  doorname = parts[ 2 ] }
		end
		
		id = tonumber( iStr )
		self.rooms[ id ] = Room.new( roominfo.roomtype, roominfo.id )
		self.rooms[ id ].doors = roominfo.doors 
		self.rooms[ id ].roomtype = self.roomtypes[ roominfo.roomtype ]
	end
	
	return self.rooms
end



return Roommanager

