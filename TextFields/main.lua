local daysInYear = 365.2425   -- # days based on gregorian cal
local weeksInYear = daysInYear / 7
local daysInMonth = daysInYear / 12   --average # days a month
local weeksInMonth = daysInMonth / 7 -- # of weeks in a month
local secInMin = 60    -- # of seconds in a minute
local secInHour = 60 * secInMin
local secInDay = 24 * secInHour
local secInWeek = 7 * secInDay
local secInMonth = daysInMonth *secInDay  -- ave # of sec/month
local secInYear = daysInYear *secInDay   --# seconds in a year
local todaysDate = os.date("*t")
print (os.date())
print (todaysDate.isdst,todaysDate.yday,todaysDate.wday)
--print (todaysDate.year, todaysDate.month, todaysDate.day)
local width = display.contentWidth
local height = display.contentHeight
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local background = display.newImageRect( "background.png", width, height)
background.x = centerX
background.y = centerY

local submit = display.newRect(width/2,height/1.15,width/2,height/12)
local text = display.newText("Submit",width/2,height/1.15,nil,40)
text:setFillColor(.968627451,.1921568627,.6078431373)
submit:setFillColor(0.968627451,.9176470588,.9098039216)


-- Get the users name and birthdate
local nameInstructions = display.newText("Enter your first name", width/2,
height/5, native.systemFont, 48 )
local usersName = native.newTextField(width/2, height/3.5,width, 50)
usersName.inputType = "default"
local bdayInstructions = display.newText("Enter your birthdate", width/2, height/2.3, native.systemFont, 50)
local bdayInstructions2 = display.newText("(mm/dd/yyyy)",width/2, height/2.1, native.systemFont, 50)
local bday = native.newTextField(width/2, height/1.75,width, 50)
bday.inputType = "default"

local function keyboardListener (event)
     native.setKeyboardFocus(nil)
end

local function calculateAge()
     -- Get the birth year, month, and day
     local bdayLen = string.len(bday.text)
     local birthYear = string.sub(bday.text, bdayLen-3, bdayLen)
     local birthMonth = string.sub(bday.text, 1,2)
     local birthDay = string.sub(bday.text, 4, 5)
     bday:removeSelf()
     usersName:removeSelf()
     nameInstructions:removeSelf()
     bdayInstructions2:removeSelf()
     bdayInstructions:removeSelf()
     submit:removeSelf()
     text:removeSelf()
     -- How many seconds from 1/1/1 to today
local totalSecToday = (todaysDate.year * secInYear) + (todaysDate.month * secInMonth) + (todaysDate.day * secInDay)
     --How many seconds from year 0 to birthdate
local totalSecBday = (birthYear * secInYear) + (birthMonth * secInMonth) + (birthDay * secInDay)
local totalSecAlive = totalSecToday - totalSecBday
local secAliveText = display.newText(usersName.text, width/2, height/5.3, native.systemFont, 50)
local secAliveText = display.newText(" You have been alive for :", width/2, height/4, native.systemFont, 50)
local secAlive = display.newText(totalSecAlive.." seconds", width/2, height/3.3, native.systemFont, 50)
local secAliveText2 = display.newText("and counting", width/2, height/2.8, native.systemFont, 50)
--   print(birthYear, birthMonth, birthDay)
 end



background:addEventListener("tap", keyboardListener)
submit:addEventListener("tap", calculateAge)

