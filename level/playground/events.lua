local Envelope = require( "nexus.envelope" )

local Events = {}

Events.CREATE_PLAYER 		= 1
Events.MOVE_TO 				= 2
Events.OBJECT_INTERACT 		= 3
Events.CREATE_SHOT			= 4
Events.DELETE_OBJECT		= 5
Events.SELECT_ROOM			= 6

Events.names = {}
Events.names[ 1 ] = "CREATE_PLAYER"
Events.names[ 2 ] = "MOVE_TO"
Events.names[ 3 ] = "OBJECT_INTERACT"
Events.names[ 4 ] = "CREATE_SHOT"
Events.names[ 5 ] = "DELETE_OBJECT"
Events.names[ 6 ] = "SELECT_ROOM"


function Events.newCreatePlayer( gid, pos, speed, name, isLocalHero )
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
	local env = Envelope.new( Events.MOVE_TO, gid, false )
	env:putVector3( "pos", pos )
	return env
end


function Events.newObjectInteract( gid )
	return Envelope.new( Events.OBJECT_INTERACT, gid )
end


function Events.newCreateShot( parentGid, gid, angle, maxPos )
	local env = Envelope.new( Events.CREATE_SHOT, parentGid )
	env:putString( "factory", "playground:/factories#locallaserfactory" )
	env:putString( "gid", gid )
	env:putVector3( "angle", angle )
	env:putVector3( "maxPos", maxPos )
	return env
end


function Events.newDeleteObject( gid )
	local env = Envelope.new( Events.DELETE_OBJECT, gid )
	env:putString( "gid", gid )
	return env
end


function Events.newSelectRoom( roomid, roomkey )
	local env = Envelope.new( Events.SELECT_ROOM, "playground:/level" )
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


