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
local mR = math.random 

-- Load our utils and main categories
local utils = require("helpers.globals")
local categories = require("helpers.categories")

-- Display Groups
local screenGroup
local quizGroup                 -- Holds the quiz UI etc
local uiGroup                   -- Holds the navBar on other UI
local overGroup                 -- Only created when we tap on the pause button or get gameover

-- Game variables
local category = {}             -- The chosen category once loaded.
local questions = {}            -- The category quiz questions once loaded.
local colour = {}               -- Category colour once loaded 
local onCategory = 0            -- Tracks the category we are on (used for gameOver)
local onQuestion = 0            -- Tracks the question we are on
local currentScore = 0          -- The player's score
local timePerQuestion = 0       -- Set in categories.lua. 0 removes the timer.
local timerEnabled = true      -- Stops or allows our countdown timer, based off timePerQuestion
local touchEnabled = false      -- Stops button touches

-- Transitions and timers
local delay_timer               -- Game over delay for changing scene
local timer_trans               -- Transition for our timer
local result_trans              -- Transition for "Correct!"

-- Display objects
local over_rect                 -- Pre-declare so we can alter it from the day/night button as well.
local question_rect             -- Pre-declare so we can access anywhere
local timer_rect                
local timer_bar                 -- The countdown bar
local label_question            -- The question number label
local label_result              -- The "Correct" text label
local answer_rect               

-- Functions
local updateScore
local startTimer
local gameOver
local buttonTouched
local createQuestion

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
        
        if id == "answer" then 
            t.alpha = 0.6
        else
            t.xScale = 0.9
            t.yScale = 0.9
        end
        
    elseif t.isFocus then
        if event.phase == "ended" then
            display.getCurrentStage():setFocus( nil )
            t.isFocus = false
            
            if id == "answer" then 
                t.alpha = 1
            else
                t.xScale = 1
                t.yScale = 1
            end

            -- Check that touch finished in the button.
            local b = t.contentBounds 
            if event.x >= b.xMin and event.x <= b.xMax and event.y >= b.yMin and event.y <= b.yMax then                 
                utils.playSound("select")

                if id == "answer" then 
                    if timer_trans ~= nil then
                        transition.cancel(timer_trans)
                        timer_trans = nil 
                    end
                    if result_trans ~= nil then
                        transition.cancel(result_trans)
                        result_trans = nil 
                    end
                    if label_result ~= nil then
                        display.remove(label_result)
                        label_result = nil 
                    end

                    -- Show some text that we can transition
                    label_result = display.newText({parent=uiGroup, text="", font=native.systemFont, fontSize=18})
                    label_result.anchorX = 0 
                    label_result.x = label_question.x + label_question.width/2 + 24
                    label_result.y = label_question.y 
                    
                    if t.index == questions[onQuestion].answer then 
                        label_result.text = "Correct!"
                        label_result:setFillColor(0,0.6,0)
                        utils.playSound("score")
                        updateScore(1)
                       
                    else
                        label_result.text = "Incorrect..."
                        label_result:setFillColor(0.8,0,0)
                        utils.playSound("incorrect")
                    end

                    result_trans = transition.to(label_result, {time=1600, alpha=0.1, y=label_result.y-18, onComplete=function()
                        display.remove(label_result)
                        label_result = nil 
                    end})

                    -- Now create the next quesiton
                    createQuestion()
                end
            end
        end
    end
    return true
end

-- End the game
gameOver = function()
    touchEnabled = false 
    utils.playSound("gameover")
    
    delay_timer = timer.performWithDelay(600, function()
        utils.playSound("clap")
        composer.gotoScene( "scenes.gameOver", {effect="slideLeft", time=300, params={
            currentScore=currentScore,
            onCategory=onCategory,
            numQuestions=#questions
        }})
    end, 1)
end

-- Easily add to our score, also controls the +1 animation
updateScore = function(amount)
    if amount ~= nil then 
        currentScore = currentScore + amount
        label_question.text = currentScore .. " / " .. #questions
    end
end

-- Update our timer bar.
startTimer = function(delay)
    if timerEnabled == true and timer_bar ~= nil then 
        if timer_trans ~= nil then
            transition.cancel(timer_trans)
            timer_trans = nil 
        end

        -- Reset xScale and set delay
        local time = timePerQuestion * 1000
        local startDelay = delay 
        timer_bar.xScale = 1

        if startDelay == nil then 
            startDelay = 0 
        end

        timer_trans = transition.to(timer_bar, {time=time, delay=startDelay, xScale=0, onComplete=function()
            createQuestion()
        end})
    end
end

-- Create a quesiton, iterates.
createQuestion = function()
    -- Add one 
    onQuestion = onQuestion + 1

    -- Make sure we have a question and haven't finished.
    if questions[onQuestion] == nil or onQuestion > #questions then 
        gameOver()

    else
        -- Remove anything old
        for i=quizGroup.numChildren, 1, -1 do 
            if quizGroup[i] ~= nil then 
                display.remove(quizGroup[i])
                quizGroup[i] = nil 
            end
        end

        -- Start out timer, add a delay if we are on quesiton 1
        local delay = 0 
        if onQuestion == 1 then 
            delay = 1000 
        end
        startTimer(delay)

        -- Create the question and answers.
        local numberX = 32
        local questionX = 24
        local questionW = _W-(questionX*2)
        local q = questions[onQuestion]
        local image 

        if q.image ~= nil and q.image.file ~= nil then 
            image = display.newImageRect(quizGroup, q.image.file, q.image.width, q.image.height)
            image.anchorX = 0 
            image.x = numberX/2
            image.y = question_rect.y+question_rect.height/2

            questionX = image.x + image.width + numberX/2
            questionW = _W-questionX-numberX
        end

        local question = display.newText({parent=quizGroup, text=q.question, width=questionW, height=0, font=native.systemFont, fontSize=18})
        question.x = questionX
        question.y = question_rect.y+question_rect.height/2
        question.anchorX = 0 
        question:setFillColor(1)

        -- The answers all need to fit in the bottom area, so we make sure they can!
        local areaPadding = 12  -- Top and bottom padding
        local topPadding = 16   -- Extra padding for the top for some added space
        local answerOffset = 6  -- y offset per answer
        local area = answer_rect.height - (areaPadding*2)
        local answerHeight = (area-topPadding-(answerOffset*#q.answers))/#q.answers 
        local textX = numberX + 20
        local textW = _W - textX - 24

        for i=1, #q.answers do 
            local y = answer_rect.y + areaPadding + topPadding + ((answerHeight+answerOffset)*(i-1)) 

            local rect = display.newRect(quizGroup, _W*0.5, y, _W, answerHeight)
            rect.anchorY = 0 
            rect.id = "answer"
            rect.index = i 
            rect:setFillColor(0.4)
            rect:addEventListener("touch", buttonTouched)

            local arrow = display.newSprite(utils.uiSheet, {frames={utils.uiSheetInfo:getFrameIndex("arrow")}})
            arrow.x = arrow.width/2 + 4
            arrow.y = rect.y + rect.height/2
            quizGroup:insert(arrow)

            if arrow.height > rect.height-8 then 
                arrow.height = rect.height-8
            end

            local number = display.newText({parent=quizGroup, text=i..".", font=native.systemFont, fontSize=16})
            number.x = numberX
            number.y = rect.y+rect.height/2
            number.anchorX = 0 
            number:setFillColor(1)

            local answer = display.newText({parent=quizGroup, text=q.answers[i], width=textW, height=0, font=native.systemFont, fontSize=16})
            answer.x = textX
            answer.y = number.y
            answer.anchorX = 0 
            answer:setFillColor(1)
        end
    end
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
    quizGroup = display.newGroup()
    screenGroup:insert(uiGroup)
    screenGroup:insert(quizGroup)

    -- Set our categories and questions
    if event.params then 
        if event.params.category then 
            onCategory = event.params.category
            category = categories[onCategory]
            questions = require( category.questions )
            colour = category.colour
            timePerQuestion = category.timePerQuestion

            if timePerQuestion == nil or timePerQuestion == 0 then 
                timerEnabled = false
            end
        end
    end

    -- Display our UI
    -- The top bar that is made in a utility function
    local options = {
        title = category.title, 
        backScene = "scenes.menu", -- Set this to a scene name if you want a back button
    }
    local navBar = utils.createNavBar(options)
    uiGroup:insert(navBar)

    local top = navBar.y + navBar.height 
    local height = _H - top

    question_rect = display.newRect(uiGroup, _W*0.5, top, _W, 120 )
    question_rect.anchorY = 0 
    question_rect:setFillColor(colour[1], colour[2], colour[3])

    timer_rect = display.newRect(uiGroup, _W*0.5, question_rect.y+question_rect.height, _W, 80 )
    timer_rect.anchorY = 0 
    timer_rect:setFillColor(1)

    answer_rect = display.newRect(uiGroup, _W*0.5, timer_rect.y+timer_rect.height, _W, _H-(timer_rect.y+timer_rect.height))
    answer_rect.anchorY = 0 
    answer_rect:setFillColor(0.9)

    -- Now the score/quesiton num/time remaining 
    if timerEnabled == true then 
        timer_bar = display.newRect(uiGroup, 0, timer_rect.y+timer_rect.height-20, _W, 8)
        timer_bar.anchorX = 0 
        timer_bar:setFillColor(colour[1], colour[2], colour[3])
    end

    label_question = display.newText({parent=uiGroup, text="0 / "..#questions, font=native.systemFont, fontSize=24}) 
    label_question.x = _W*0.5
    label_question.y = timer_rect.y+28
    label_question:setFillColor(colour[1], colour[2], colour[3])

    -- Now make our first question
    createQuestion()
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

        -- Now that the scene has appeared, allow touch
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

        -- Stop transitions if needed
        if timer_trans then 
            transition.cancel(timer_trans)
            timer_trans = nil 
        end
        if result_trans then 
            transition.cancel(result_trans)
            result_trans = nil 
        end
        if delay_timer ~= nil then 
            timer.cancel(delay_timer)
            delay_timer = nil 
        end

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
