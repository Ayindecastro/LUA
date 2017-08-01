local json = require( "json" )    -- Bring in the JSON library to convert JSON to a Lua Table

function getZip(event)
    -- for k,v in pairs(event) do
    --     print(k,v)
    -- end

    if(event.status == 200) then    --if the HTTP response has a status code of 200 (OK), proceed
        print(event.response)
        local response = json.decode(event.response)  -- turn the JSON response into a Lua table
        print(response.latitude)      -- Print out the zip code as determined by the response
    end


end

network.request( "http://freegeoip.net/json/", "GET", getZip )    -- Make an http GET request to the specified website. When there is a response, call the get zip function

function getWeather( event )
	
    if(event.status == 200) then    --if the HTTP response has a status code of 200 (OK), proceed
        print(event.response.main)
        local response1 = json.decode(event.response)  -- turn the JSON response into a Lua table
        print(response1.main.temp)      -- Print out the zip code as determined by the response
    end
end
network.request("http://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b1b15e88fa797225412429c1c50c122a1","GET",getWeather)


api.openweathermap.org/data/2.5/weather?zip={zip code},{country code}
