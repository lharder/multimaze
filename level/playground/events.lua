local Envelope = require( "nexus.envelope" )

local Events = {}

Events.CREATE_PLAYER 		= 1
Events.CREATE_ROBOT			= 2
Events.MOVE_TO 				= 3
Events.POSITION_REACHED 	= 4
Events.OBJECT_INTERACT 		= 5
Events.CREATE_SHOT			= 6
Events.DELETE_OBJECT		= 7

Events.names = {}
Events.names[ 1 ] = "CREATE_PLAYER"
Events.names[ 2 ] = "CREATE_ROBOT"
Events.names[ 3 ] = "MOVE_TO"
Events.names[ 4 ] = "POSITION_REACHED"
Events.names[ 5 ] = "OBJECT_INTERACT"
Events.names[ 6 ] = "CREATE_SHOT"
Events.names[ 7 ] = "DELETE_OBJECT"


function Events.newCreatePlayer( gid, pos, speed, name, isLocalHero )
	local env = Envelope.new( Events.CREATE_PLAYER, "playground:/level" )
	if isLocalHero then
		env:putString( "factory", "playground:/factories#localplayerfactory" )
	else
		env:putString( "factory", "playground:/factories#remoteplayerfactory" )
	end
	env:putString( "gid", gid )
	env:putVector3( "pos", pos )
	env:putString( "name", name )
	env:putNumber( "speed", speed )
	env:putBool( "isLocalHero", isLocalHero )

	return env
end


function Events.newCreateRobot( gid, pos, speed, name )
	local env = Envelope.new( Events.CREATE_ROBOT, "playground:/level", false )
	env:putString( "factory", "playground:/factories#robotfactory" )
	env:putString( "gid", gid )
	env:putVector3( "pos", pos )
	env:putNumber( "speed", speed )
	env:putString( "name", name )
	return env
end


function Events.newMoveTo( gid, pos )
	local env = Envelope.new( Events.MOVE_TO, gid, false )
	env:putVector3( "pos", pos )
	return env
end


function Events.newPositionReached( gid, pos )
	local env = Envelope.new( Events.POSITION_REACHED, gid )
	env:putVector3( "pos", pos )
	return env
end


function Events.newObjectInteract( gid )
	local env = Envelope.new( Events.OBJECT_INTERACT, gid )
	return env
end


function Events.newCreateShot( parentGid, gid, dir )
	local env = Envelope.new( Events.CREATE_SHOT, parentGid )
	env:putString( "factory", "playground:/factories#remotelaserfactory" )
	env:putString( "gid", gid )
	env:putVector3( "dir", dir )
	return env
end


function Events.newDeleteObject( gid )
	local env = Envelope.new( Events.DELETE_OBJECT, gid )
	env:putString( "gid", gid )
	return env
end


function Events.getName( evt )
	-- no need to send these strings over the
	-- wire, but useful for debugging....
	return( Events.names[ evt:getType() ] )
end


return Events


