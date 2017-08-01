
display.setDefault("background",40,40,.4)



local liluzi= display.newImage("liluzi.jpg",display.contentWidth/2,display.contentHeight/2,display.contentWidth/2,display.contentHeight/2)
-- liluzi.x= display.contentWidth/2
-- liluzi.y= display.contentHeight/2

liluzi:scale(1.5,1.5)

local mask = graphics.newMask("liluzimask.png")

liluzi:setMask(mask)

--rect.maskRotation=0

--rect.m

-- max needs a witdh and height that is divisible b 4

-- function playMusic( event )

-- 	local XOTOURLIFE= audio.loadSound( "XOTOURLlif3.mp3" )
-- 	local LUVSCARS= audio.loadSound( "luvscars.mp3" )


--     local songs={XOTOURLlif3,LUVSCARS}
-- 	local playAudio= audio.play( songs[index] , { channel=1, loops=-1, fadein=5000 } )
-- 	-- body


-- end

-- local function playSong(index)

-- 	print("playSong - index: " .. index)
-- 	media.playSound(songTable[index], playNextSong)
-- end

-- function stopMusic( event )

	
-- 	local playAudio= audio.pause(lilAudio)
-- 	-- body
-- end



-- liluzi:addEventListener("tap",playMusic)
-- --liluzi:addEventListener("double tap",stopMusic)











local songTable = {}
songTable[1] = "XOTOURLlif3.mp3"
songTable[2] = "luvscars.mp3"


-- This variable needs to be declared because playSong is calling it
local playNextSong

-- Plays the soung based on the parameter ("index") that is coming in
local function playSong(index)
	print("playSong - index: " .. index)
	media.playSound(songTable[index], playNextSong)
end

-- Stops playback of the extended sound currently opened by the previous call to media.playSound(). // http://docs.coronalabs.com/api/library/media/stopSound.html
local function stopSong()
	print("stopSong")
	media.stopSound()
end

-- Generates and returns a random number. May not be necessary but I like to keep everythin in functions for future flexibility
-- The parameter ("maxNumber") makes sure that this function will return a number from 1 to maxNumber.
local function getRandomNumber(maxNumber)
	return math.random(maxNumber)
end

-- Plays next song. This function is called in the touch event.
-- First it stops the current song being played by calling stopSong()
-- Second it generates random number. #songTable (with the square in front) returns the length of the table songTable
-- which means that if I add another song to the table the new length will be 4 instead of, as it is now, 3. This makes
-- sure that all songs can be choosen and played when playSong is being called.
-- Third it calls the playSong() function with the parameter i, which is set by getRandomNumber. This is now a number
-- from 1 to #songTable. If i = 2 songTable[2] will be played.
playNextSong = function()
	stopSong()
	local i = getRandomNumber(#songTable)
	playSong(i)
end

-- This is the tap event. When tapped playNextSong() is being called. 
local function onTap(event)
	playNextSong()
end

-- local playbutton= display.newCircle(display.contentWidth/4,display.contentHeight/6.5,display.contentWidth/8,100)
-- playbutton:setFillColor(0,1,0)

-- local pausebutton= display.newCircle(display.contentWidth/1.4,display.contentHeight/6.5,display.contentWidth/8,100)
-- playbutton:setFillColor(0,1,0)

 
-- This is just a rectangle. It was the easiest way to create something that I could touch.
-- You can change this to an image, for example a "Play" image.

-- Adds the tap event to the rectangle.
liluzi:addEventListener ( "tap", onTap)









