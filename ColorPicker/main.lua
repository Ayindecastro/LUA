
display.setDefault("background",.137254902,.2235294118,.3568627451)

-- Ayind Castro 
local width= display.contentWidth
local height= display.contentHeight

local redchange = 0
local greenchange = 0
local bluechange = 0

local redchange2= 0
local greenchange2 = 0
local bluechange2 = 0
local resetText= display.newText("CLICK TO RESET",width/2,height/1.07,nil,64)
resetText:setFillColor(1,1,1)

local rect= display.newRect(width/2,height/6,width,height/3)
local rgbtext= display.newText("RGB",width/6,height/6,nil,64)


local rgbtext= display.newText("("..redchange..","..greenchange..","..bluechange..")",width/2,height/3.5,nil,64)
rect:setFillColor(.3529411765,.3882352941,.4470588235)

local colorpalatte = display.newRect(width/1.25,height/7.3,200,200)
colorpalatte:setFillColor(redchange, greenchange,bluechange)

local arrowblueUp= display.newImage("arrowup.png")
arrowblueUp.x=width/1.28
arrowblueUp.y=height/2.28

local arrowgreenUp= display.newImage("arrowup.png")
arrowgreenUp.x=width/2.15
arrowgreenUp.y=height/2.28

local arrowredUp= display.newImage("arrowup.png")
arrowredUp.x=width/6.5
arrowredUp.y=height/2.28

local arrowblueDown= display.newImage("arrowdown.png")
arrowblueDown.x=width/1.28
arrowblueDown.y=height/1.26

local arrowgreenDown= display.newImage("arrowdown.png")
arrowgreenDown.x=width/2.15
arrowgreenDown.y=height/1.26

local arrowredDown= display.newImage("arrowdown.png")
arrowredDown.x=width/6.5
arrowredDown.y=height/1.26


local red= display.newRect(width/6.5,height/1.62,100,100)
 red:setFillColor(1, 0 ,0)


local green= display.newRect(width/2.15,height/1.62,100,100)
 green:setFillColor(0, 1 , 0)

 local blue= display.newRect(width/1.28,height/1.62,100,100)
blue:setFillColor(.1607843137, .4431372549 ,.8980392157)


function updatecolor( event )

		rgbtext.text = "("..redchange2..","..greenchange2..","..bluechange2..")"
    colorpalatte:setFillColor(redchange,greenchange,bluechange)
end

function redUp( event )

	redchange = redchange + .01

	redchange2= redchange*255

	redchange2=math.round(redchange2)

	updatecolor()

end

function redDown( event )


	if redchange2>0 then
	redchange = redchange - .01

	redchange2= redchange*255

	redchange2=math.round(redchange2)

	updatecolor()

	end

end

function blueUp( event )

	bluechange = bluechange + .01

	bluechange2= bluechange*255

	bluechange2=math.round(bluechange2)

	updatecolor()
end

function blueDown( event )


	if bluechange2>0 then
		bluechange = bluechange - .01

		bluechange2= bluechange*255

		bluechange2=math.round(bluechange2)

	updatecolor()

end

end

function greenUp( event )
		greenchange = greenchange + .01

		greenchange2= greenchange*255

		greenchange2=math.round(greenchange2)

    updatecolor()

end

function greenDown( event)

	if greenchange2>0 then
		greenchange = greenchange - .01

		greenchange2= greenchange*255

		greenchange2=math.round(greenchange2)

		updatecolor()


	end



end

function resetEverything( ... )

	redchange=0
	bluechange=0
	greenchange=0


	redchange2=0
	bluechange2=0
	greenchange2=0

 updatecolor()

end

arrowredUp:addEventListener( "tap", redUp) -- eventListener for counterButton
arrowredDown:addEventListener("tap", redDown)
arrowblueUp:addEventListener( "tap", blueUp) -- eventListener for counterButton
arrowblueDown:addEventListener("tap", blueDown)
arrowgreenUp:addEventListener("tap", greenUp)
arrowgreenDown:addEventListener("tap", greenDown)
resetText:addEventListener("tap", resetEverything)





