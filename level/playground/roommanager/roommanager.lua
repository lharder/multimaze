local Roommanager = {}
Roommanager.__index = Roommanager



function Roommanager.new(  )
	local this = {}
	setmetatable( this, Roommanager )

	
end


function Roommanager:hello()

end


return Roommanager