local json = require( "json" )    -- Bring in the JSON library to convert JSON to a Lua Table



width = display.contentWidth
height = display.contentHeight
local centerX = display.contentCenterX
local centerY = display.contentCenterY

background = display.newImageRect( "background.png", width, height)
background.x = centerX
background.y = centerY

local instructionsText = display.newText("ENTER STOCK NAME", width/2,
height/5, native.systemFont, 48 )

local stockName = native.newTextField(width/2, height/3.5,width, 50)
stockName.inputType = "default"


local Price = display.newText("",width/2, height/2.5, native.systemFont, 50)
local lowestPrice = display.newText("",width/2, height/2.1, native.systemFont, 50)
local  highestPrice= display.newText("",width/2, height/1.8, native.systemFont, 50)
local  openingPrice = display.newText("",width/2, height/1.6, native.systemFont, 50)


 -- local previousRespeonses  = {  }

local function keyboardListener (event)
     native.setKeyboardFocus(nil)
end


function getStock( event )
	
local userInput= stockName.text

network.request("http://dev.markitondemand.com/MODApis/Api/v2/Quote/jsonp?symbol="..userInput.."&callback=myFunction","GET",parseResponse )
print(userInput)


end

function parseResponse( event )

	print(event.status)
	if(event.status == 200) then
		local currentPrice=string.sub(event.response,12,-2)

        local response = json.decode(currentPrice)

        local theLastPrice = response.LastPrice
        local low = response.Low
        local high = response.High 
        local Open = response.Open
        
        print(theLastPrice)
        print(high)
        print(Open)
        print(low)


        -- print(event.response)

        -- to see what has not gone below opening calue


      
		Price.text="Last Price: ".. theLastPrice
		openingPrice.text="Opening: ".. Open
		highestPrice.text="High: "..high
		lowestPrice.text ="Low: "..low

       
    end	
	-- body
end


local submit = display.newRect(width/2,height/1.15,width/2,height/12)
local text = display.newText("Submit",width/2,height/1.15,nil,40)
text:setFillColor(.968627451,.1921568627,.6078431373)
submit:setFillColor(0.968627451,.9176470588,.9098039216)



-- 

background:addEventListener("tap", keyboardListener)

-- network.request("http://samples.openweathermap.org/data/2.5/weather?zip=94040,us&appid=b1b15e88fa797225412429c1c50c122a1","GET",getStock)

submit:addEventListener("tap",getStock)


