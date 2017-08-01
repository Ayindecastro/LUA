local rect1 = display.newRect(100,300,100,100)
local rect2 = display.newRect(100,500,100,100)
local rect3 = display.newRect(100,700,100,100)
local rect4 = display.newRect(100,900,100,100)

local array1 = {rect1,rect2,rect3,rect4}

local group = display.newGroup (rect1,rect2,rect3,rect4)

transition.to(group, {x=group.x + 400, time=2000})