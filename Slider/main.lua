local widget = require( "widget" )
widget.setTheme("widget_theme_android")

local w = display.contentWidth
local h = display.contentHeight

-- Function to handle button events



--- RUN ON IPHONE 6

--- RUN ON IPHONE 6


--- RUN ON IPHONE 6


--- RUN ON IPHONE 6


--- RUN ON IPHONE 6

     
-- Slider listener



-- Slider listener

red=0
green=0
blue=0


start1=1
start2=1
start3=1


-- redchange = red * 255
-- greenchange = green *255
-- bluechange= blue *255

display.setDefault("background",red,green,blue)


local square = display.newRect(w/2,h/1.1,w,800)
square:setFillColor(173/255,26/255,80/255)


local square2 = display.newRect(w/2,h/1.75,w,100)
square2:setFillColor(1,1,1)


local rgbtext= display.newText("("..red..","..green..","..blue..")",w/2,h/3.5,nil,64)
rgbtext:setFillColor(1,1,1)


local function allSliders( event )

    print(slider1.value/100)
    red = slider1.value/100
    green = slider2.value/100
    blue = slider3.value/100

      
     redchange = red * 255
     bluechange= blue * 255
     greenchange= green *255

     display.setDefault("background",red,green,blue) 


    if red>=.5 and blue>=.5 and green>=.5 then
          rgbtext:setFillColor(0,0,0)

   else 
    rgbtext:setFillColor(1,1,1)

  end

  rgbtext.text = "("..(redchange)..","..(greenchange)..","..(bluechange)..")"

end

-- if red==1 and blue==1 and green==1 then
--           rgbtext:setFillColor(0,0,0)
--  else 
--  rgbtext:setFillColor(1,1,1)

--   end


-- local function sliderListener( event )
--     print(event.value/100)
--      red = event.value/100
--      display.setDefault("background",red,green,blue)
-- redchange = red * 255
-- greenchange = green * 255
-- bluechange= blue * 255

-- rgbtext.text = "("..(redchange)..","..(greenchange)..","..(bluechange)..")"

-- if red==1 and blue==1 and green==1 then
--           rgbtext:setFillColor(0,0,0)
--  else 
--  rgbtext:setFillColor(1,1,1)

--   end


-- end
 
-- Create the widget
 slider1 = widget.newSlider(
    {
        top = 1000,
        left = w/3,
        orientation = "vertical",
        height = 200,
        value = 0,  -- Start slider at 10% (optional)
        listener = allSliders

    }
)

-- local function sliderListener2( event )
--     print(event.value/100)

--     green = event.value/100

--    display.setDefault("background",red,green,blue)
--    redchange = red * 255
-- greenchange = green * 255
-- bluechange= blue * 255

-- if red>0.5 and blue>0.5 and green>0.5 then
  
--           rgbtext:setFillColor(0,0,0)
--  else 

--  rgbtext:setFillColor(1,1,1)

  
--   end

 -- rgbtext.text = "("..(redchange)..","..(greenchange)..","..(bluechange)..")"
-- end
 
-- Create the widget
 slider2 = widget.newSlider(
    {
        top = 1000,
        left = w/2,
        orientation = "vertical",
        height = 200,
        value = 0,  -- Start slider at 10% (optional)
        listener = allSliders
    }
)

-- local function sliderListener3( event )
--     print(event.value/100)

--     blue=event.value/100

--        display.setDefault("background",red,green,blue)
-- redchange = red * 255
-- greenchange = green * 255
-- bluechange= blue * 255
-- rgbtext.text = "("..(redchange)..","..(greenchange)..","..(bluechange)..")"

-- if red==1 and blue==1 and green==1 then
--           rgbtext:setFillColor(0,0,0)

--    else 
--  rgbtext:setFillColor(1,1,1)

--   end


-- end
 slider3 = widget.newSlider(
    {
        top = 1000,
        left = w/1.5,
        orientation = "vertical",
        height = 200,
        value = 0,  -- Start slider at 10% (optional)
        listener = allSliders
    }
)

 

-- Create the widget










