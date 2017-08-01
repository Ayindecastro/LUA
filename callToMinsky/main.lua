local json = require( "json" ) 


   if(event.status == 200) then
        local response = json.decode(event.response)
        -- ipAddress.text = (response.zip_code)
        network.request( "http://api.wunderground.com/api/8af68b0ba33b6601/conditions/q/CA/"..response.zip_code..".json", "GET", getTemp )
    end
