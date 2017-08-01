
display.setDefault("background",1,1,1)

local sheetOptions = 
{
   width= 162.5,
   height=220.5,
   numFrames=8

}

--local rect = display.newRect(display.contentWidth,display.contentHeight)
--print(sheetOptions)

local imageSheet = graphics.newImageSheet("coolsprite.jpeg",sheetOptions)


local sequenceData =
{
  name="walking",
  frames={1,2,3,4,5,6,7,8},
  time=500,
  loopCount=0



}


local character= display.newSprite(imageSheet, sequenceData)
character.x= display.contentWidth/2
character.y=display.contentHeight/2



function move( event )

	if event.numTaps == 1 then 
	  character:play()


	else
		character:pause()
	end


end


function stop( event )
	character:pause()

end


character:addEventListener("tap",move)



