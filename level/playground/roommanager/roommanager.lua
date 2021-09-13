local Set = require( "deflibs.set" )
local Room = require( "level.playground.roommanager.room" )


local Roommanager = {}
Roommanager.__index = Roommanager


local function sortBy( list, key )
	return table.sort( list, function( one, two )
		return one[ key ] < two[ key ]
	end )
end


function Roommanager.new()
	local this = {}
	setmetatable( this, Roommanager )

	this.rooms = {}
	this.rooms[ "start" ] = Room.new( require( "assets.tiles.room001" ), "start" ) 
	this.rooms[ "dungeon01" ] = Room.new( require( "assets.tiles.room002" ), "dungeon", "medium" ) 
	this.rooms[ "dungeon02" ] = Room.new( require( "assets.tiles.room003" ), "dungeon", "small" ) 

	-- add room keys as ids
	for id, room in pairs( this.rooms ) do 
		room.id = id
	end
	
	return this
end


function Roommanager.select( self, ... )
	local needed = Set.new( { ... } )

	-- select a room with the given tags
	local hits = {}
	for id, room in pairs( self.rooms ) do 
		if room:isMatch( needed.tags ) then 
			table.insert( hits, room )
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
	local room = hits[ selected ]
	room.used = room.used + 1
	
	return room
end


function Roommanager:get( id )
	return self.rooms[ id ]
end 


return Roommanager

