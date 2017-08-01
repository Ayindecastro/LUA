local width = display.contentWidth
local height = display.contentHeight

local xmove = 1

local rect=display.newRect(300,200,100,100)

function move( event )

	-- rect.y=rect.y+100
	transition.to(event.target,{time=500,y=(event.target.y+100)%display.contentHeight, x=(event.target.x+100)%display.contentWidth})
end



rect:addEventListener( "tap", move) 
