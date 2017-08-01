local rect= display.newRect(300,300, 100,400)
local rect1= display.newRect(500,300, 100,400)
local rect2= display.newRect(100,300, 100,400)
local circle= display.newCircle(300, 800,100)
rect:setFillColor (0,0,0)
rect1:setFillColor (0,0,0)
rect2:setFillColor (0,0,0)
rect:setStrokeColor (1,0,0)
rect1:setStrokeColor (0,0,1)
rect2:setStrokeColor (0,1,0)
rect.strokeWidth = 3
rect1.strokeWidth = 3
rect2.strokeWidth = 3
circle:setFillColor (1,1,1)
circle:setStrokeColor (0,0,0)
circle.strokeWidth = 3



function changecolor( event )
	
	rect:setStrokeColor(0,1,0)
    print(event.numTaps)
end

function changecolor2( event )
	
	rect1:setStrokeColor(1,0,0)
    print(event.numTaps)
end


function changecolor3( event )
	
	rect2:setStrokeColor(0,0,1)
    print(event.numTaps)
end


function circlebutton( event )
	
	rect2:setStrokeColor(0,0,1)
	rect2:setFillColor(0,0,1)
    print(event.numTaps)
    rect1:setStrokeColor(1,0,0)
    rect1:setFillColor(1,0,0)
    print(event.numTaps)
    rect:setStrokeColor(0,1,0)
    rect:setFillColor(0,1,0)
    print(event.numTaps)

end

circle:addEventListener( "tap", circlebutton)
rect:addEventListener( "tap", changecolor)
rect1:addEventListener( "tap", changecolor2)
rect2:addEventListener( "tap", changecolor3)