local Set = require( "deflibs.set" )

local Room = {}
Room.__index = Room


function Room.new( data, ... )
	local this = {}
	setmetatable( this, Room )

	-- set by roommanager
	this.key = ""			
	
	this.data = data
	this.used = 0
	
	this.tags = Set.new({ ... })

	return this
end


function Room.isMatch( self, ... )
	local needed = Set.new({ ... })
	local common = self.tags:intersection( needed )
	return common:equals( needed )
end


return Room

