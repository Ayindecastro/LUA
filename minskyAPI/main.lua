
local  json = require("json")

function call( event )

	if (event.status == 200) then
	local action = json.decode(event.action)
end


end

local red= 230
local green = 170
local blue = 80

 network.request( "http://192.168.105.9:8000/g/"..green.."", "PUT", call)
 network.request( "http://192.168.105.9:8000/r/"..red.."", "PUT", call)
 network.request( "http://192.168.105.9:8000/g/"..blue.."", "PUT", call)





