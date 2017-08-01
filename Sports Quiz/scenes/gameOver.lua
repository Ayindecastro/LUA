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

-- Load our utils, image sheet etc
local utils = require("helpers.globals")
local categories = require("helpers.categories")

-- Display Groups
local screenGroup
local uiGroup

-- Variables 
local touchEnabled = false
local category = {}
local onCategory = 0 
local currentScore = 0  
local highscore = 0 
local numQuestions = 0 
local colour = {}

-- Functions
local buttonTouched

-----------------------------------------------
--*** OTHER FUNCTIONS ***
-----------------------------------------------
-- Button touched 
buttonTouched = function(event)
    local t = event.target 
    local id = t.id 

    if event.phase == "began" and touchEnabled == true then 
        display.getCurrentStage():setFocus( t )
        t.isFocus = true
        t.alpha = 0.6
        
    elseif t.isFocus then
        if event.phase == "ended" then
            display.getCurrentStage():setFocus( nil )
            t.isFocus = false
            t.alpha = 1

            local b = t.contentBounds 
            if event.x >= b.xMin and event.x <= b.xMax and event.y >= b.yMin and event.y <= b.yMax then 
                utils.playSound("select")

                if id == "home" then 
                    composer.gotoScene( "scenes.menu", {effect="slideRight", time=300})

                elseif id == "share" then
                    -- For iOS we try to use the "Activity" sharing method first. If that fails, or we are on Android -
                    -- we default to the social plugin instead. 
                    local shareString = "I just scored " .. currentScore .. " in this awesome game! Go me!"

                    if utils.platform == "iOS" and native.canShowPopup( "activity" ) then 
                        local textItems = {
                            { type = "string", value = shareString }
                        }
                        native.showPopup( "activity", {items=textItems} )

                    else
                        -- We also run extra checks to see if we should share on FB or Twitter on iOS
                        -- Please note that as of build 2015.2649 FB sharing on Android only works if you pass a LINK only.
                        local function shareOnService(service)
                            native.showPopup( "social",
                            {
                                service = service,
                                message = shareString,
                            })
                        end

                        if utils.platform == "iOS" then 
                            local function alertPressed(event)
                                if event.index == 1 then 
                                    shareOnService("facebook")
                                elseif event.index == 2 then 
                                    shareOnService("twitter")
                                end
                            end

                            local alert = native.showAlert(
                                "Share Score", 
                                "Would you like to share your score on Facebook or Twitter?",
                                {"Facebook", "Twitter", "Cancel"}, 
                                alertPressed
                            )
                        else
                            shareOnService()
                        end
                    end
                end
            end
        end
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

    -- Set our category, score etc
    if event.params then 
        if event.params.onCategory then 
            onCategory = event.params.onCategory
            category = categories[onCategory]
            colour = category.colour
        end
        if event.params.currentScore then 
            currentScore = event.params.currentScore
        end
        if event.params.numQuestions then 
            numQuestions = event.params.numQuestions
        end
    end

    -- Display our UI
    -- The top bar that is made in a utility function
    local options = {
        title = "Game Over", 
        backScene = "scenes.menu", -- Set this to a scene name if you want a back button
    }
    local navBar = utils.createNavBar(options)
    uiGroup:insert(navBar)


    -- Figure out if we need to save this currentScore as our highscore
    local highscores = utils.loadFromJson("category_scores")
    
    if highscores[onCategory] ~= nil then 
        highscore = highscores[onCategory]
    else
        highscores[onCategory] = currentScore
    end
    if currentScore > highscore then 
        highscore = currentScore
    end

    utils.saveToJson(highscores, "category_scores")


    -- Now show our bg, score etc
    local bg = display.newRect(uiGroup, _W*0.5, _H*0.5, _W, _H)
    bg:setFillColor(colour[1], colour[2], colour[3])
    navBar:toFront()

    local score_label_1 = display.newText({parent=uiGroup, text="You scored", font=native.systemFont, fontSize=24, align="center"})
    score_label_1.x = _W*0.5 
    score_label_1.y = _H*0.25 
    score_label_1:setFillColor(1)

    local score_label_2 = display.newText({parent=uiGroup, text=currentScore, font=native.systemFontBold, fontSize=64, align="center"})
    score_label_2.x = score_label_1.x
    score_label_2.y = mF(score_label_1.y + score_label_1.height/2 + score_label_2.height/2 + 2)
    score_label_2:setFillColor(1)

    local score_label_3 = display.newText({parent=uiGroup, text="out of", font=native.systemFont, fontSize=24, align="center"})
    score_label_3.x = _W*0.5 
    score_label_3.y = score_label_2.y + score_label_2.height/2 + score_label_3.height/2 + 12
    score_label_3:setFillColor(1)

    local score_label_4 = display.newText({parent=uiGroup, text=numQuestions, font=native.systemFontBold, fontSize=40, align="center"})
    score_label_4.x = score_label_1.x
    score_label_4.y = mF(score_label_3.y + score_label_3.height/2 + score_label_4.height/2 + 2)
    score_label_4:setFillColor(1)

    if currentScore >= highscore then 
        local highscore_label = display.newText({parent=uiGroup, text="Highscore!", font=native.systemFont, fontSize=16, align="center"})
        highscore_label.anchorX = 0
        highscore_label.x = mF(score_label_2.x + score_label_2.width/2 + 24)
        highscore_label.y = score_label_2.y 
        highscore_label:setFillColor(1)
        highscore_label.rotation = -10
    end

    -- Now add a share and home button
    local share_rect = display.newRect(uiGroup, _W*0.5, _H-100, _W, 52)
    share_rect:setFillColor(1)
    share_rect.id = "share"
    share_rect:addEventListener("touch", buttonTouched)

    local share_label = display.newText({parent=uiGroup, text="Share", font=native.systemFont, fontSize=16, align="center"})
    share_label.x = share_rect.x
    share_label.y = share_rect.y 
    share_label:setFillColor(colour[1],colour[2],colour[3])

    local home_rect = display.newRect(uiGroup, _W*0.5, share_rect.y+56, _W, 52)
    home_rect:setFillColor(1)
    home_rect.id = "home"
    home_rect:addEventListener("touch", buttonTouched)

    local home_label = display.newText({parent=uiGroup, text="Home", font=native.systemFont, fontSize=16, align="center"})
    home_label.x = home_rect.x
    home_label.y = home_rect.y 
    home_label:setFillColor(colour[1],colour[2],colour[3])

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
