require( "deflibs.defold" )

local lua = require( "deflibs.lualib" )

local MSG_SET_PROPS = hash( "setProps" )

local function drawLine( from, to )
	msg.post( "@render:", "draw_line", { start_point = from, end_point = to, color = vmath.vector4( 0,1,0,1 ) } )
end



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
	this.objsByName = {}
	this.objsByPos = {}
	
	map.xMaxPix = map.width * map.tilewidth
	map.yMaxPix = ( map.height - 2 ) * map.tileheight
	-- pprint( "MaxPix x: " .. map.xMaxPix .. ", y: " ..map.yMaxPix )
	
	-- make layers available by their names
	local layers = {}
	for i, layer in pairs( map.layers ) do
		layers[ layer.name ] = map.layers[ i ]
	end
	map.layers = layers

	return this
end


function Tilemap:pixToGrid( xPix, yPix )
	xPix = xPix + 32 -- self.map.tilewidth / 2
	yPix = yPix + 32 -- self.map.tileheight / 2
	local xGrid = lua.round( xPix / self.map.tilewidth )
	local yGrid = self.map.height - lua.round( yPix / self.map.tileheight ) 
	
	return xGrid, yGrid
end


function Tilemap:getTileValue( xPix, yPix, layername )
	if layername == nil then layername = "walls" end

	local xGrid, yGrid = self:pixToGrid( xPix, yPix )
	local index = lua.round( xGrid + self.map.width * yGrid ) 

	-- pprint( "#" .. index .. " (" .. xGrid .. "/" .. yGrid .. "): " .. self.map.layers[ layername ].data[ index ]  )
	-- return Tile.new( self.map.layers[ layername ].data[ index ] )
	return self.map.layers[ layername ].data[ index ]
end


function Tilemap:isInBounds( xPix, yPix )
	return (( xPix > 0 ) and ( xPix < self.map.xMaxPix ) and
			( yPix > 0 ) and ( yPix < self.map.yMaxPix ))
end


-- Checks if a direct walk from x1 to x2 is possible:
-- no obstacle on yPos allowed, solid ground underneath required
function Tilemap:isWalkable( xPixFrom, yPix, xPixTo )
	local walkable = true
	local min = math.min( xPixFrom, xPixTo )
	local max = math.max( xPixFrom, xPixTo )
	for xPix = min, max, 64 do 
		-- local free = self:isPassable( xPix, yPix )
		-- local solid = not self:isPassable( xPix, yPix - 40 )
		-- if( not free ) or ( not solid ) then 
		if(	not self:isPassable( xPix, yPix ) or 
		  ( self:isPassable( xPix, yPix - 40 ) ) ) then
			walkable = false 
		end
	end
	
	return walkable
end


-- Checks if a given position on the map is passable
function Tilemap:isPassable( xPix, yPix )
	-- level coordinates' boundaries
	if not self:isInBounds( xPix, yPix ) then return false end

	-- check if a wall is in the way
	if self:getTileValue( xPix, yPix ) > 0 then return false end
	
	-- check if a blocking object is in the way?
	-- Currently, objects never block passage!
	--[[
	if isOk then 
		local xGrid, yGrid = self:pixToGrid( xPix, yPix )
		local id = self.objsByPos[ xGrid .. "-" .. yGrid ]
		if id ~= nil then
			-- there is an object, not passable by default
			isOk = false

			-- possibly the object is "open"?
			local open = goGetProperty( msg.url( nil, id, "script" ), "open" )
			if open ~= nil then isOk = open end
		end
	end
	--]]
	
	return true
end


function Tilemap:setup( isServer )
	local tileNo
	local tile
	local obj 
	local tiles = self.map.tilesets[ 1 ]
	local yMax = self.map.height * self.map.tileheight
	
	for _, layer in pairs( self.map.layers ) do
		
		-- object layer -----------------------------
		if layer.type == "objectgroup" then 
			for i, obj in ipairs( layer.objects ) do
				
				self.isLocalHero = isServer
				local facUrl = "/factories#" .. obj.properties[ "factory" ]
				-- pprint( obj.name .. ", " .. facUrl )
				local cid = self:createObject( facUrl, vmath.vector3( 
					obj.x + 32, 
					yMax - obj.y + 32,
					0.3 
				), obj )
			end
			
		else	
			
			-- tilelayers ----------------------------
			local i = 1 
			local x = 1 
			local y = layer.height
			while i <= layer.height * layer.width do 
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
	pprint( url )
	local id = factory.create( url, pos, nil, { 
		isLocalHero = self.isLocalHero 
	})

	local name = obj.name 
	if name == "" then name = id end
	
	GAME.client.registry:set( name, id ) 
	
	self.objsByName[ name ] = id
	msg.post( id, MSG_SET_PROPS, obj )

	local yMax = self.map.height * self.map.tileheight
	local gridLeft, gridBottom = self:pixToGrid( obj.x, yMax - obj.y )
	local gridRight = gridLeft + lua.round( obj.width / self.map.tilewidth ) - 1
	local gridTop = gridBottom - lua.round( obj.height / self.map.tileheight ) + 1
	for y = math.min( gridBottom, gridTop ), math.max( gridBottom, gridTop ), 1 do
		for x = gridLeft, gridRight, 1 do
			self.objsByPos[ x .. "-" .. y ] = id
			-- pprint( x .. "-" .. y .. ": " .. id .. ", " .. obj.name )
		end
	end
	
	return id
end



-- returns the gameobject ID for 
-- a map object with a given name
function Tilemap:getObjId( name )
	return self.objsByName[ name ]
end

return Tilemap

