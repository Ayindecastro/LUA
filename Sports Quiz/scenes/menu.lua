
-------------------------------------------------------------------------
--T and G Apps Ltd.
--www.tandgapps.co.uk
--support@tandgapps.co.uk

--CoronaSDK version 2015.2548+ was used for this template.

--You are not allowed to publish this template to the Appstore as it is.
--You need to work on it, improve it and replace the graphics.

--For questions and/or bugs found, please contact me using our contact
--form on http://www.tandgapps.co.uk/contact-us/
-------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

-----------------------------------------------
--*** Set up our variables etc ***
-----------------------------------------------
-- Some handy maths vars
local _W = display.contentWidth
local _H = display.contentHeight
local mF = math.floor 

-- Load our utils and main categories
local utils = require("helpers.globals")
local categories = require("helpers.categories")
local widget = require( "widget" )

-- Display Groups
local screenGroup
local uiGroup

-- Variables 
local touchEnabled = false

-- Functions
local buttonTapped

-----------------------------------------------
--*** OTHER FUNCTIONS ***
-----------------------------------------------
-- Button tapped - For scrollView items
buttonTapped = function(event)
    local t = event.target
    local category = t.category

    if category ~= nil and touchEnabled == true then 
        utils.playSound("select")
        composer.gotoScene( "scenes.game", {effect="slideLeft", time=300, params={category=category}})
    end

    return true 
end

-----------------------------------------------
-- *** COMPOSER SCENE EVENT FUNCTIONS ***
-----------------------------------------------
-- Called when the scene's view does not exist:
-- Create all your display objects here.
function scene:create( event )
	-- Setup our groups
	screenGroup = self.view
	uiGroup = display.newGroup()
	screenGroup:insert(uiGroup)

    -- Display our UI
    -- The top bar that is made in a utility function
    local options = {
        title = "Sports Quiz", 
        backScene = nil, -- Set this to a scene name if you want a back button
        showSettings = true -- Enables the settings button on the right hand side.
    }
    local navBar = utils.createNavBar(options)
    uiGroup:insert(navBar)

    -- Now our categories. These are just basic rectangles right now, but can be easily
    -- changed to an newImageRect if needed.
    local scrollTop = navBar.y + navBar.height 
    local scrollHeight = _H - scrollTop
    local categoryHeight = 84
    local categoryOffset = 2

    local scrollView = widget.newScrollView{
        top = scrollTop,
        left = 0,
        width = _W,
        height = scrollHeight,
    }
    uiGroup:insert(scrollView)

    for i=1, #categories do 
        local colour = categories[i].colour
        local y = (i-1)*(categoryHeight+categoryOffset) + (categoryHeight/2)
        local textX = 36
        local textW = _W-(textX*2) - 64 -- an extra 64 for icons

        local rect = display.newRect(_W*0.5, y, _W, categoryHeight )
        rect:setFillColor(colour[1], colour[2], colour[3])
        rect.category = i 
        rect:addEventListener("tap", buttonTapped)
        scrollView:insert(rect)

        local arrow = display.newSprite(utils.uiSheet, {frames={utils.uiSheetInfo:getFrameIndex("arrow")}})
        arrow.x = arrow.width/2 + 4
        arrow.y = rect.y 
        scrollView:insert(arrow)

        local title = display.newText({text=categories[i].title, x=textX, y=rect.y-6, width=textW, height=0, font=native.systemFontBold, fontSize=18})
        title.anchorX = 0 
        title:setFillColor(1)
        scrollView:insert(title)

        if categories[i].subtitle and categories[i].subtitle ~= "" then 
            local subtitle = display.newText({text=categories[i].subtitle, x=textX, y=(title.y+title.height/2+2), width=textW, height=0, font=native.systemFont, fontSize=12})
            subtitle.anchorX = 0 
            subtitle.anchorY = 0 
            subtitle:setFillColor(1)
            scrollView:insert(subtitle)
        end

        if categories[i].icon and categories[i].icon ~= "" then 
            local icon = display.newSprite(utils.uiSheet, {frames={utils.uiSheetInfo:getFrameIndex(categories[i].icon)}})
            icon.x = _W - 40
            icon.y = rect.y 
            scrollView:insert(icon)
        end
    end
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        composer.removeHidden() 

        -- Now that the scene has appeared, allow dragging etc
        touchEnabled = true      
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        touchEnabled = false

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end

function scene:destroy( event )
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-- Then add the listeners for the above functions
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
