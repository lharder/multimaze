local MultiLang = {}

local content = {}
-- gets generated automatically 
content[ "DE" ] = {}

-- EN translation
content[ "EN" ] = {}
content[ "EN" ][ "Setup" ] = "Setup"
content[ "EN" ][ "Callsign" ] = "Callsign"
content[ "EN" ][ "Ok" ] = "Ok"
content[ "EN" ][ "Schnelligkeit" ] = "Agility"
content[ "EN" ][ "Nahkampf" ] = "Melee combat"
content[ "EN" ][ "Fernkampf" ] = "Ranged combat"
content[ "EN" ][ "Technologie" ] = "Technology"
content[ "EN" ][ "Gesundheit" ] = "Health"

-- create DE language set from keys of EN
for key, value in pairs( content[ "EN" ] ) do
	content[ "DE" ][ key ] = key
end


function MultiLang.new() 
	local this = {}
	
	function this:getLanguage()
		local lang = "EN"
		local info = sys.get_sys_info()
		pprint( "Language: " .. info.device_language .. "/" .. info.language .. "/" .. info.territory )
		if info ~= nil then 
			local regOrLangDE = string.lower( info.device_language ):indexOf( "de" ) > -1
			if regOrLangDE or string.lower( info.language ) == "de" or string.lower( info.territory ) == "de" then
				lang = "DE"
			end
		end
		pprint( "Using " .. lang )

		return lang
	end
	

	function this:get( key )
		return content[ this.loc ][ key ]
	end

	
	this.loc = this:getLanguage()
	
	return this
end


return MultiLang.new()

