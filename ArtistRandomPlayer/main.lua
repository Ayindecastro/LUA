local playboycarti = audio.loadSound("playboycarti/PlayboiCartiHalfHalf.mp3")

local drake = audio.loadSound("Drake - Hotline Bling Sound Effect.mp3")


local fettywap = audio.loadSound("Fetty Wap - Squaw Sound Effect.mp3")

local liluzi = audio.loadSound("Lil Uzi Vert - Yah Yah Yah Sound Effect.mp3")

local lilyachty = audio.loadSound("Lil Yachty - Lil Boat Sound Effect.mp3")




function drakeFunc( event )
	audio.stop()
	audio.play(drake)
end

function liluziFunc( event )
	audio.stop()
	audio.play(liluzi)
end

function fettsyWapFunc( event )
	audio.stop()
	audio.play(fettywap)
end
function lilyachtyFunc( event )
	audio.stop()

	audio.play(lilyachty)
end


local drakeButton = display.newImage("drake.jpg",400,1100)
drakeButton.width=display.contentWidth/2
drakeButton.height=display.contentWidth/2

local liluziButton = display.newImage("uzipic.jpg",400,250)

liluziButton.width=display.contentWidth/2
liluziButton.height=display.contentWidth/2

local fettyWapButton = display.newImage("fetty.png",200,680)

fettyWapButton.width=display.contentWidth/2
fettyWapButton.height=display.contentWidth/2

local lilyachtyButton = display.newImage("lil-yachty-id.jpg",600,680)

lilyachtyButton.width=display.contentWidth/2
lilyachtyButton.height=display.contentWidth/2


drakeButton:addEventListener("tap",drakeFunc)
liluziButton:addEventListener("tap",liluziFunc)
fettyWapButton:addEventListener("tap",fettyWapFunc)
lilyachtyButton:addEventListener("tap",lilyachtyFunc)