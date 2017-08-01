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

-- Initial Settings
display.setStatusBar( display.HiddenStatusBar ) --Hide status bar from the beginning

-- Load composer
local composer = require("composer")
composer.recycleOnSceneChange = true

-- Set a default background colour
display.setDefault("background", 1)

-- Now change scene to go to the menu.
composer.gotoScene( "scenes.menu", {effect="fade", time=250})