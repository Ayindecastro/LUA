local json = require( "json" )

local w = display.contentWidth
local h = display.contentHeight

local button = display.newRect(w/2, h/2, 250, 100)
local buttonText = display.newText("Get Weather", w/2, h/2, nil, 32)
buttonText:setFillColor(0)

local display_text = display.newText("", w/2, h/3, nil, 48)

function getZip(event)
    -- local response = event
    -- for k,v in pairs(response) do
    --     print(k,v)
    -- end

    -- local headers = event.responseHeaders
    -- for k,v in pairs(headers) do
    --     print(k,v)
    -- end

    if(event.status == 200) then
        local response = json.decode(event.response)
        -- ipAddress.text = (response.zip_code)
        network.request( "http://api.wunderground.com/api/8af68b0ba33b6601/conditions/q/CA/"..response.zip_code..".json", "GET", getTemp )
    end
end

function getTemp(event) 
    if(event.status == 200) then
        local response = json.decode(event.response)
        print(response.current_observation.temperature_string)
        display_text.text = response.current_observation.temperature_string
    end
end

function getIP(event)
    network.request( "http://freegeoip.net/json/", "GET", getZip )
end

button:addEventListener("tap", getIP)