local red  = display.newRect (100,100,100,100)
red:setFillColor(1,0,0)

local green  = display.newRect (100,300,100,100)
green:setFillColor(0,1,0)


local blue  = display.newRect (100,500,100,100)

blue:setFillColor(0,0,1)

local white = display.newRect (100,700,100,100)

white:setFillColor(0,0,1)


function printbutton( event )
	

if (event.target == red) then

		print("red")

elseif (event.target == green) then

	print ("green")

elseif (event.target == blue) then

  print("blue")
end

end




red:addEventListener("tap",printbutton)
green:addEventListener("tap",printbutton)
blue:addEventListener("tap",printbutton)


