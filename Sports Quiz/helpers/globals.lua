
-- Create our local M table
local M = {}

-- Localise a few other helpful vars
local sqlite3 = require("sqlite3")
local json = require("json")
local composer = require( "composer" ) 
local _W = display.contentWidth
local _H = display.contentHeight

-- Add our UI sprite sheet to M so we can access it elsewhere.
M.uiSheetInfo = require("images.uiSheet")
M.uiSheet = graphics.newImageSheet("images/uiSheet.png", M.uiSheetInfo:getSheet())

-- Sounds
local sounds = {}
sounds["select"] = audio.loadSound("sounds/select.mp3")
sounds["score"] = audio.loadSound("sounds/score.mp3")
sounds["incorrect"] = audio.loadSound("sounds/gameover.mp3")
sounds["clap"] = audio.loadSound("sounds/clapping.mp3")

-- Other helpful variables
M.iOSAppId = "123467678" -- Used for rating the app button
M.platform = "iOS"
if system.getInfo("platformName") == "Android" then
	M.platform = "Android"
end

--------------------------------------------
-- SOUNDS
--------------------------------------------
--Just pass a name to it. e.g. "select"
M.playSound = function(name) 
	if sounds[name] ~= nil then 
		audio.play(sounds[name])
	end
end

--------------------------------------------
-- RATINGS
--------------------------------------------
M.showRatePopup = function()
	local options =
	{
	   iOSAppId = M.iOSAppId,
	   supportedAndroidStores = { "google" },
	}
	native.showPopup( "appStore", options )
end

--------------------------------------------
-- JSON - LOADING/SAVING SCORE FUNCTIONS
--------------------------------------------
M.saveToJson = function( jsonData, filename )
    local filePath = system.pathForFile( filename..".json", system.DocumentsDirectory)
    local file = io.open(filePath, "w")
    file:write( json.encode(jsonData));
    io.close(file); file=nil;
end

M.loadFromJson = function( filename )
    local filePath = system.pathForFile( filename..".json", system.DocumentsDirectory)
    local file = io.open(filePath, "r")
    local jsonParse = {}
    if file ~= nil then 
        local info = file:read("*a")
        if info ~= nil then jsonParse = json.decode(info) end
        io.close(file); file=nil;
    end
    return jsonParse
end

--------------------------------------------
-- NAVBAR
--------------------------------------------
-- Easily create the top bar with scenes to go back to.
M.createNavBar = function(options)
	local nav_group = display.newGroup()

	local rect = display.newRect(nav_group, _W*0.5, 24, _W, 48)
	rect:setFillColor(52/255, 73/255, 93/255)

	local title = display.newText({parent=nav_group, text="", x=0, y=0, font=native.systemFontBold, fontSize=20})
	title.x = rect.x 
	title.y = rect.y 
	title:setFillColor(1)

	if options then 
		local function buttonTouched(event)
			local t = event.target 
		    local scene = t.scene 

		    if event.phase == "began" then 
		        display.getCurrentStage():setFocus( t )
		        t.isFocus = true
		        t.xScale = 0.9
		        t.yScale = 0.9
		        
		    elseif t.isFocus then
		        if event.phase == "ended" then
		            display.getCurrentStage():setFocus( nil )
		            t.isFocus = false
		            t.xScale = 1
		            t.yScale = 1

		            local b = t.contentBounds 
		            if event.x >= b.xMin and event.x <= b.xMax and event.y >= b.yMin and event.y <= b.yMax then 
		                M.playSound("select")

		               	if scene then 
		               		local effect = "slideRight"

		               		if t.effect ~= nil then 
		               			effect = t.effect
		               		end

		               		t:removeEventListener("touch", buttonTouched)
		               		composer.gotoScene( scene, {effect=effect, time=250})
		               	end
		            end
		        end
		    end
		    return true
		end

		if options.title then 
			title.text = options.title
		end

		if options.backScene then 
			local button_back = display.newSprite(M.uiSheet, {frames={M.uiSheetInfo:getFrameIndex("button_back")}})
			button_back.x = button_back.width/2 
			button_back.y = rect.y 
			button_back.scene = options.backScene
			button_back.effect = "slideRight"
			button_back:addEventListener("touch", buttonTouched)
			nav_group:insert(button_back)
		end

		if options.showSettings and options.showSettings == true then 
			local button_settings = display.newSprite(M.uiSheet, {frames={M.uiSheetInfo:getFrameIndex("button_settings")}})
			button_settings.x = _W - button_settings.width/2 - 4
			button_settings.y = rect.y 
			button_settings.scene = "scenes.settings"
			button_settings.effect = "slideLeft"
			button_settings:addEventListener("touch", buttonTouched)
			nav_group:insert(button_settings)
		end		
	end

	return nav_group
end


--Return it now
return M