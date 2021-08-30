local Set = require( "deflibs.set" )


local Room = {}
Room.__index = Room


function Room.new( filename, ... )
	local this = {}
	setmetatable( this, Room )

	this.filename = filename
	this.data = nil
	this.used = 0

	this.tags = Set.new({ ... })

	return this
end


function Room:load()
	this.data = require( "assets.tiles." .. filename )
end


function Room.isMatch( self, ... )
	local needed = Set.new({ ... })
	local common = self.tags:intersection( needed )
	return common:equals( needed )
end


return Room

