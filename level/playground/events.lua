local Envelope = require( "nexus.envelope" )

local Events = {}

Events.CREATE_PLAYER 			= 1
Events.MOVE_TO 					= 2
Events.OBJECT_READY_TO_INTERACT = 3
Events.OBJECT_INTERACT 			= 4
Events.CREATE_SHOT				= 5
Events.DELETE_OBJECT			= 6
Events.DOOR_SET_ROOM			= 7
Events.NEW_ROOM_CONFIG			= 8

Events.names = {}
Events.names[ 1 ] = "CREATE_PLAYER"
Events.names[ 2 ] = "MOVE_TO"
Events.names[ 3 ] = "OBJECT_READY_TO_INTERACT"
Events.names[ 4 ] = "OBJECT_INTERACT"
Events.names[ 5 ] = "CREATE_SHOT"
Events.names[ 6 ] = "DELETE_OBJECT"
Events.names[ 7 ] = "DOOR_SET_ROOM"
Events.names[ 8 ] = "NEW_ROOM_CONFIG"


function Events.newCreatePlayer( gid, pos, speed, name, isLocalHero )
	if gid == nil or pos == nil or speed == nil or name == nil or isLocalHero == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.CREATE_PLAYER, "playground:/level" )
	if isLocalHero then
		env:putString( "factory", "playground:/factories#localherofactory" )
	else
		env:putString( "factory", "playground:/factories#remoteherofactory" )
	end
	env:putString( "gid", gid )
	env:putVector3( "pos", pos )
	env:putString( "name", name )
	env:putNumber( "speed", speed )
	env:putBool( "isLocalHero", isLocalHero )

	return env
end



function Events.newMoveTo( gid, pos )
	if gid == nil or pos == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.MOVE_TO, gid, false )
	env:putVector3( "pos", pos )
	return env
end


function Events.newObjectInteract( gid, gidInteractWith )
	if gid == nil or gidInteractWith == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.OBJECT_INTERACT, gid )
	env:putString( "interactWith", gidInteractWith )
	return env
end


function Events.newObjectReadyToInteract( gid, gidInteractWith, isReady )
	if gid == nil or gidInteractWith == nil or isReady == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.OBJECT_READY_TO_INTERACT, gid )
	env:putString( "player", gidInteractWith )
	env:putBool( "isReady", isReady )
	return env
end


function Events.newCreateShot( parentGid, gid, angle, maxPos )
	if parentGid == nil or gid == nil or angle == nil or maxPos == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.CREATE_SHOT, parentGid )
	env:putString( "factory", "playground:/factories#locallaserfactory" )
	env:putString( "gid", gid )
	env:putVector3( "angle", angle )
	env:putVector3( "maxPos", maxPos )
	return env
end


function Events.newDeleteObject( gid )
	if gid == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.DELETE_OBJECT, gid )
	env:putString( "gid", gid )
	return env
end


function Events.newRoomConfig( gid, rooms )
	if gid == nil or rooms == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.NEW_ROOM_CONFIG, "playground:/level" )
	env:putString( "rooms", rooms )
	return env
end


function Events.newDoorSetRoom( gid, roomid, roomkey )
	if gid == nil or roomid == nil or roomkey == nil then 
		pprint( "Parameters must not be nil!" )
		return 
	end
	local env = Envelope.new( Events.DOOR_SET_ROOM, gid )
	env:putString( "roomid", roomid )
	env:putString( "roomkey", roomkey )
	return env
end


function Events.getName( evt )
	-- no need to send these strings over the
	-- wire, but useful for debugging....
	return( Events.names[ evt:getType() ] )
end

return Events


