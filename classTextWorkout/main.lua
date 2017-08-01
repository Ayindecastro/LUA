

local width = display.contentWidth
local height = display.contentHeight
local background = display.newRect(width/2,height/2,width,height)
background:setFillColor(0, 0.4, 0.4)
local prompt = display.newText("Enter a Number",375,300,nil,64)
local textfield = native.newTextField(width/2, height/3.5,width, 50)
local submitButton = display.newRect(375,600,300,70)
local sumbit = display.newText("SUBMIT",375,596,nil,64)
sumbit:setFillColor(0,0,0)
textfield.placeholder="Enter your name"


local function mytextfield( event )

if (textfield.text ~= "" and tonumber(textfield.text)~=nil) then

	local answer = textfield.text *7

   print(answer)

	textfield:removeSelf()
	submitButton:removeSelf()
	prompt:removeSelf()
	sumbit:removeSelf()

	local result = textfield.text
	local secAliveText = display.newText(answer, width/2, height/5.3, native.systemFont, 80)

else
	textfield.placeholder="Invalid Value"


 end

	--textfield.text
	


	

end 

submitButton:addEventListener("tap", mytextfield)