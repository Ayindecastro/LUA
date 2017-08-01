--------------------------------------------
-- QUIZ CATEGORIES
--------------------------------------------

-- Create our local M table
-- This will contain all the category information
local M = {
	{
		title = "Basketball", -- The title displays on the main menu
		subtitle = "Test Your NBA Draft knowledge!", -- Any subtitle you want displayed.
		colour = {229/255, 91/255, 212/255}, -- This is the colour scheme 
		icon = "", 	-- The imageSheet name for the icon on the uiSheet made in globals.lua
		questions = "helpers.questions.basketball", -- The path to this categories questions
		timePerQuestion = 10, 	-- Seconds allowed per question, set to 0 remove the timer.
	},
	{
		title = "Soccer", 
		subtitle = "Test Your BPL knowledge!!", 
		colour = {229/255, 91/255, 185/255},
		icon = "", 
		questions = "helpers.questions.soccer",
		timePerQuestion = 20,
	},
	{


	
		title = "Football", 
		subtitle = "Test Your NFL knowledge!", 
		colour = {229/255, 91/255, 146/255},
		icon = "", 
		questions = "helpers.questions.football",
		timePerQuestion = 0, -- No timer for these questions.
	},
	{
		title = "Baseball", 
		subtitle = "Test Your MLB knowledge!", 
		colour = {229/255, 91/255, 136/255},
		icon = "", 
		questions = "helpers.questions.baseball",
		timePerQuestion = 10,
	},
	{
		title = "Hockey", 
		subtitle = "Test Your NHL knowledge!", 
		colour = { 229/255, 91/255, 123/255},
		icon = "", 
		questions = "helpers.questions.hockey",
		timePerQuestion = 10,
	},
}

--Return it now
return M