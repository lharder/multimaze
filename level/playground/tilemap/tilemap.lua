local lua = require( "deflibs.lualib" )

local TYPE_DOOR = "door"
local TYPE_TERMINAL = "terminal"
local TYPE_BUTTON = "button"

local MSG_SET_PROPS = hash( "setProps" )


-- Tile -----------------------------------
local Tile = {}
function Tile.new( value )
	local t = {}
	t.value = value

	return t
end


-- Tilemap ---------------------------------
local Tilemap = {}
Tilemap.__index = Tilemap

function Tilemap.new( urlTilemap, map )
	local this = {}
	setmetatable( this, Tilemap )

	this.map = map
	this.url = urlTilemap
	this.objects = {}
	
	-- make layers available by their names
	local layers = {}
	for i, layer in pairs( map.layers ) do
		layers[ layer.name ] = map.layers[ i ]
	end
	map.layers = layers

	return this
end


function Tilemap:getTile( xPix, yPix )
	xPix = xPix + self.map.tilewidth / 2
	yPix = yPix + self.map.tileheight / 2
	
	self.offset = vmath.vector3() -- go.get_position( self.url )
	local xGrid = lua.round( ( self.offset.x + xPix ) / self.map.tilewidth )
	local yGrid = self.map.height - lua.round( ( self.offset.y + yPix ) / self.map.tileheight )
	local index = lua.round( xGrid + self.map.width * yGrid )

	-- pprint( "#" .. index .. " (" .. xGrid .. "/" .. yGrid .. "): " .. self.map.layers[ "walls" ].data[ index ]  )
	return Tile.new( self.map.layers[ "walls" ].data[ index ] )
end


function Tilemap:isPassable( xPix, yPix )
	local tile = self:getTile( xPix, yPix )
	return tile.value == 0
end


function Tilemap:render()
	local tileNo
	local tile
	local obj 
	local tiles = self.map.tilesets[ 1 ]
	local yMax = self.map.height * self.map.tileheight
	
	for _, layer in pairs( self.map.layers ) do
		
		-- object layer -----------------------------
		if layer.type == "objectgroup" then 
			for i, obj in ipairs( layer.objects ) do
				
				if obj.type == TYPE_DOOR then 
					self:createObject( "/factories#doorfactory", vmath.vector3( 
						obj.x + self.map.tilewidth, 
						yMax - obj.y + self.map.tileheight - 12, 
						0.3 
					), obj )
					
				elseif obj.type == TYPE_TERMINAL then
					self:createObject( "/factories#terminalfactory", vmath.vector3( 
						obj.x + self.map.tilewidth - 32, 
						yMax - obj.y + self.map.tileheight - 36, 
						0.3
					), obj )

				elseif obj.type == TYPE_BUTTON then
					self:createObject( "/factories#buttonfactory", vmath.vector3( 
						obj.x + self.map.tilewidth - 32, 
						yMax - obj.y + self.map.tileheight - 36, 
						0.3 
					), obj )
				end
			end
			
		else	
			
			-- tilelayers ----------------------------
			local i = 1 
			local x = 1 
			local y = layer.height
			while i < layer.height * layer.width do 
				tileNo = layer.data[ i ] 
				tile = self.map.tilesets[ 1 ].tiles[ tileNo + 1 ]
				tilemap.set_tile( self.url, layer.name, x, y, tileNo )
				
				x = x + 1
				if x > self.map.width then 
					x = 1
					y = y - 1
				end
				i = i + 1
			end
		end
		
	end
end


function Tilemap:createObject( url, pos, obj )
	local id = factory.create( url, pos )
	local name = obj.name or id
	
	self.objects[ name ] = id
	msg.post( id, MSG_SET_PROPS, obj )

	return id
end



-- returns the gameobject ID for 
-- a map object with a given name
function Tilemap:getObjId( name )
	return self.objects[ name ]
end


return Tilemap