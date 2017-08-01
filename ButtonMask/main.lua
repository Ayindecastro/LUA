local button = display.newImage("Circle.png",300,300)


local mask = graphics.newMask("mask.png")

button:setMask(mask)

button.maskScaleX=.5
button.maskScaleY=.5

function test( event )
	
	print ("Hello")

end

button:addEventListener("tap",test )



