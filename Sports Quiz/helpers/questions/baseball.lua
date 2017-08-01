--------------------------------------------
-- QUESTIONS
--------------------------------------------

-- Create our local M table
-- This will contain all the category questions
local M = {
	{
		question = "What team drafted Kevin Durant?", -- The actual question text
			image = {
			-- file = "images/kevindurant.png",
			-- width = 80,
			-- height = 80
		},

			-- See examples in later questions
		answer = 1, 	-- Set the answer for the question
		answers = { 	-- You can have an many as you like, but they will get small if you have too many.
			"Seattle Supersonics",  
			"Oklahoma City Thunder",
			"San Antonio Spurs",
			"Washington Wizards",
		},
	},
	{
		question = "What team drafted Rudy Gay?",
		image = {
			-- file = "images/rudygay.png",
			-- width = 80,
			-- height = 80
		},
		answer = 3, 
		answers = { 
			"New York Knicks",  
			"San Antonio Spurs",
			"Houston Rockets",
			"Phoenix Suns",
		},
	},
	{
		question = "What team drafted Kobe Bryant?",
		image = {
			-- file = "images/kobebryant.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 4, 
		answers = { 
			"Los Angeles Lakers",  
			"Milwaukee Bucks",
			"Dallas Mavericks",
			"Charlotte Hornets",
		},
	},
	{
		question = "What team drafted Shaq?",
		image = {
			-- file = "images/shaq.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 2, 
		answers = { 
			"Cleveland Cavaliers",  
			"Orlando Magic",
			"Los Angeles Lakers",
			"Chicago Bulls",
			
		},
	},
	{
		question = "What team drafted Dirk Nowitzki?",
		image = {
			-- file = "images/dirk.png",
			-- width = 80,
			-- height = 80
		},
		answer = 4, 
		answers = { 
			"Dallas Mavericks",  
			"Houston Rockets",  
			"Dallas Mavericks",
			"Milwaukee Bucks",
		},
	},
	{
		question = "What team drafted Vince Carter?",
		image = {
			-- file = "images/vincecarter.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 1, 
		answers = { 
			"Golden State Warriors",  
			"New Jersey Nets",
			"Toronto Raptors",
			"Orlando Magic",

		},
	},
}

--Return it now
return M