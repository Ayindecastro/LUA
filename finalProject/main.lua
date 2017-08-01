-- RUN ON IPHONE 6

local widget = require( "widget" )


width=display.contentWidth-- sets width
height=display.contentHeight -- sets height
display.setDefault("background",255/255,56.1/255,91.8/255)-- sets background color



 

local endBox = display.newRect(width,height,width,height/1.30) --box to change color
endBox.x=width/2 -- x of box
endBox:setFillColor(255/255,56.1/255,91.8/255) -- fill color of box
local male = display.newText("Male",width/3,height/5.5,nil,48)

local female = display.newText("Female",width/1.5,height/5.5,nil,48)
local widget = require( "widget" )
 
 
-- Handle press events for the buttons
local function onSwitchPress( event ) -- functions that updates alcholLevel and prints status of radioButton
    local switch = event.target
    
    print( "Male is: "..tostring(radioButton1.isOn) )
    print( "Female is: "..tostring(radioButton2.isOn) )
    displayAlcoholLevel()
end
 
-- Image sheet options and declaration
local options = { -- sets options
    width =383/2,
    height = 191,
    numFrames = 2
   
}
local radioButtonSheet = graphics.newImageSheet( "radioButtonSheet.png", options ) -- creates radioButtonSheet
 
-- Create a group for the radio button set
local radioGroup = display.newGroup() -- displays radioGroup
 
-- Create two associated radio buttons (inserted into the same display group)
 radioButton1 = widget.newSwitch( -- sets paramaters of radioButton1
    {
      
        left = width/3,
        top = height/4.5,
        style = "radio",
        id = "RadioButton1",
        initialSwitchState = true,
         sheet = radioButtonSheet,
        frameOff = 1,
        frameOn = 2,
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton1 )
 
 radioButton2 = widget.newSwitch( -- sets paramaters of radioButton2
    {
        left = width/1.6,
        top = height/4.5,
        style = "radio",
        id = "RadioButton2",
         sheet = radioButtonSheet,
        frameOff = 1,
        frameOn = 2,
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton2 ) -- inserts radioButton2 to the radio group
------------------------------





local headingText = display.newText("Blood Alcohol Calculator",width/2,height/11,nil,48)
local  divider = display.newRect(width/2,height/8,width,height/100) -- divided header from the game
divider:setFillColor(1,1,1)

local helpRect= display.newRect(width/2,height/1.07,width/2,width/7)
local helpText = display.newText("Request an Uber",width/2,height/1.07,nil,38)
helpText:setFillColor(255/255,56.1/255,91.8/255)



 
 function callUber( event ) -- opens uber app or app store
  
  local url = "uber://"
 
if ( system.canOpenURL( url ) ) then
    system.openURL( url )

else
   system.openURL("https://itunes.apple.com/us/app/uber/id368677368?mt=8")

end

 end


helpRect:addEventListener("tap",callUber)


--units needed for calculation 
local Weight = display.newText("Weight",width/9,height/3,nil,40)
local Hours = display.newText("Hours",width/3,height/3,nil,40)
local Wine = display.newText("Wine",width/1.9,height/3,nil,40)
local Beer = display.newText("Beer",width/1.45,height/3,nil,40)
local Lquior = display.newText("Liquor",width/1.13,height/3,nil,40)

local WeightUnit = display.newText("(lbs)",width/9,height/2.5,nil,28)
local HoursUnit = display.newText("(hrs)",width/3,height/2.5,nil,28)
local WineUnit = display.newText("(5 oz)",width/1.9,height/2.5,nil,28)
local BeerUnit = display.newText("(12 oz)",width/1.45,height/2.5,nil,28)
local LquiorUnit = display.newText("(1.5 oz)",width/1.13,height/2.5,nil,28)
-------------

local weights = {} -- array for weights 
for i=80,500,5 do
table.insert(weights,i.."")
end


local columnData =  --sets whats goes in column data
    { 
       {
        align = "center",
        width = display.contentWidth/5,
        labelPadding = 20,
        startIndex = 1,
        labels = weights
    },
    {
        align = "center",
        width = display.contentWidth/5,
        labelPadding = 10,
        startIndex = 1,
        labels = { "0",".5","1","2","3","4","5","6","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24",}
    },
    {
        align = "center",
        width = display.contentWidth/5,
        labelPadding = 10,
        startIndex = 1,
        labels = {"0", "1","2","3","4","5","6","6","7","8","9","10","11","12",}
    },

      {
        align = "center",
        width = display.contentWidth/5,
        labelPadding = 10,
        startIndex = 1,
        labels = {"0","1","2","3","4","5","6","6","7","8","9","10","11","12",}
    },

      {
        align = "center",
        width = display.contentWidth/5,
        labelPadding = 10,
        startIndex = 1,
        labels = {"0", "1","2","3","4","5","6","6","7","8","9","10","11","12",}
    },


}


local alcoholText = display.newText("", display.contentWidth/2, display.contentHeight/1.35, nil, 48) -- sets alcoholText
local drunknotif = display.newText("", display.contentWidth/2, display.contentHeight/1.2, nil, 48)  -- dets drunkNotif


function displayAlcoholLevel(event) -- function that displays the Alcohol Level


    local values = pickerWheel:getValues()
    local userWeight = values[1].value
    tonumber(userWeight)
    local userHours = values[2].value
    tonumber(userHours)
    local userWine = values[3].value
    tonumber(userWine)
    userWine=userWine*5*.116
    local userBeer = values[4].value
    tonumber(userBeer)
    userBeer=userBeer*12*.045
    local userLiquor = values[5].value
    tonumber(userLiquor)
    userLiquor=userLiquor*1.5*.37
    local userAlcoholTotal = userLiquor + userBeer + userWine

    local weightModifier = .73 

    if radioButton2.isOn then

        weightModifier=.66
    end





    local outputText = ((userAlcoholTotal*5.14)/(userWeight*weightModifier)) +(-.015 * userHours)
    print(outputText) -- formula for outputText

    outputString= string.format("%3.2f",tostring(outputText)).."%" -- cuts off decimals

    if outputText<0 then -- makes outputText only display if it is over 0

        outputString=0
 end  


  if outputText<.04 and outputText>0 then -- if statement for sober text

    drunknotif.text= "You are sober"

     endBox:setFillColor(178.5/255,173.4/255,124.95/255)

  
end




 if outputText<.08 and outputText>.04 then -- if statement for impaired text

    drunknotif.text= "You are Impaired"
   endBox:setFillColor(5.1/255,209.1/255,247.35/255)
 

end

 if outputText>.08 then -- if statement of intoxiacted text

    drunknotif.text= "You are Legally Intoxicated"
      endBox:setFillColor(178.5/255,35.7/247.35,247.35/255)

       end





 alcoholText.text = outputString -- sets text of "alcoholText"
end

pickerWheel = widget.newPickerWheel( -- sets dimensions of pickerWheel
{
    top = display.contentHeight/2.3,
    left = 0,
    columns = columnData,
    style = "resizable",
    width = display.contentWidth*2,
    rowHeight = 48,
    fontSize = 24,
    onValueSelected = displayAlcoholLevel,
})


