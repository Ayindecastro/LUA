local x= 5
local y=10
local counter = 0
local textObj = display.newText("0",300,300,nil,64)
local rect= display.newRect (300,600,200,200)


if (x<=y) then

 print ("Hello")

end

function count(event)
	

	if (event.y < rect.y) then
		counter = counter + 1 
	end

	if (event.y > rect.y) then
		counter = counter - 1 
	end


	textObj.text = counter

	if (counter >= 15) then

	   textObj:setFillColor(counter/100,0,0)
	end
end


rect:addEventListener( "tap", count)