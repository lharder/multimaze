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

	-- room definitions: may show up in several instances each!
	this.rooms = {}
	this.rooms[ "start" ] 		= Room.new( require( "assets.tiles.room001" ), "start" ) 
	this.rooms[ "dungeon01" ] 	= Room.new( require( "assets.tiles.room002" ), "dungeon", "medium" ) 
	this.rooms[ "dungeon02" ] 	= Room.new( require( "assets.tiles.room003" ), "dungeon", "small" ) 

	-- add room keys as ids
	for key, room in pairs( this.rooms ) do 
		room.key = key
	end
	
	-- rooms as randomly selected and defined for a specific game
	this.constellation = {}
	
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


-- returns an instance of a room in a specific game constellation
-- Every room as created in Tiled has a unique "key" (analog of the 
-- "class" of a room). There can be multiple instances of such a room 
-- in a constellation for a specific game with random combination of 
-- rooms. Roommanager:get( id ) returns the instance with a given id
function Roommanager:get( id )
	return self.constellation[ id ]
end 


function Roommanager:put( id, room )
	self.constellation[ id ] = room
end 


function Roommanager:room( key )
	return self.rooms[ key ]
end 


return Roommanager

