display.setDefault("background",1,1,0)
local counterButton = display.newImage( "add.png") -- Sets the "add" Button
local minusButton = display.newImage("subtract.png") -- Sets the "subtract" button

counterButton.x = display.contentWidth /2 -- Sets the X value of the counterButton
counterButton.y = display.contentHeight/2 -- Sets the Y value of the counterButton

minusButton.x = display.contentWidth /2 -- Sets the X value of the counterButton
minusButton.y = display.contentHeight/2 + 100 -- Sets teh Y value of the counterButton



local x= 0 --Sets X equal to zero
local textobj = display.newText("The button has been clicked ".. x.. " times", 300, 200, "Comic Sans MS", 34) -- Displays textObj
textobj:setFillColor(.1529411765, .4117647059, .9764705882) -- Makes the color of textObj Black

function countit( event ) -- Starts the function

	x = x+1  -- adds one to "X"
	print (textobj.text) -- Prints textObj in the console
	textobj.text= "The button has been clicked " .. x .. " times" -- Changes the X value  of TextObj

end -- ends function 

 
function reductit( event ) --  Starts the function

	x = x-1  -- Subtracts 1 from "X"
	print (textobj.text) -- -- Prints textObj in the console
	textobj.text= "The button has been clicked " .. x .. " times" -- -- Changes the X value  of TextObj




end -- ends function 



counterButton:addEventListener( "tap", countit ) -- eventListener for counterButton

minusButton:addEventListener( "tap", reductit ) -- eventListener for minusButton





