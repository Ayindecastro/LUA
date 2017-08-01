local myButton = display.newImage( "button.png" ) myButton.x = display.contentWidth /2
myButton.y = display.contentHeight/2
local textobj = display.newText("Button Tapped", 100, 50, native.systemFont, 24)
textobj:setFillColor(1, 1, 1)
function moveButtonDown( event )

    textobj.y = textobj.y + 50

    textobj.y= math.random (0 + textobj.height, display.contentHeight - textobj.height)
    textobj.x= math.random (0 + textobj.width, display.contentWidth - textobj.width)

    -- 0 + width/2
    -- contentWidth-width/2
    

end

myButton:addEventListener( "tap", moveButtonDown )