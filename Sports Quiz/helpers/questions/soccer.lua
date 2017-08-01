--------------------------------------------
-- QUESTIONS
--------------------------------------------

-- Create our local M table
-- This will contain all the category questions
local M = {
	{
		question = "What did Manchester United place in the 2016-2017 season?", -- The actual question text
			image = {
			-- file = "images/kevindurant.png",
			-- width = 80,
			-- height = 80
		},

			-- See examples in later questions
		answer = 4, 	-- Set the answer for the question
		answers = { 	-- You can have an many as you like, but they will get small if you have too many.
			"3rd",  
			"4th",
			"5th",
			"6th",
		},
	},
	{
		question = "What team scored the most goals ever in a BPL season",
		image = {
			-- file = "images/rudygay.png",
			-- width = 80,
			-- height = 80
		},
		answer = 1, 
		answers = { 
			"Chelsea",  
			"Manchester United",
			"Arsenal",
			"Manchester City",
		},
	},
	{
		question = "What team lost went undefeated in a BPL season",
		image = {
			-- file = "images/kobebryant.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 3, 
		answers = { 
			"Manchester United",  
			"Sunderland",
			"Arsenal",
			"Leicester City",
		},
	},
	{
		question = "What BPL team had the largest stadium?",
		image = {
			-- file = "images/shaq.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 1, 
		answers = { 
			"Manchester United",  
			"Liverpool",
			"Arsenal",
			"West Ham",
			
		},
	},
	{
		question = "What time has the most losses of all time in the BPL",
		image = {
			-- file = "images/dirk.png",
			-- width = 80,
			-- height = 80
		},
		answer = 1, 
		answers = { 
			"Aston Villa",  
			"Swansea City",  
			"Watford",
			"Stoke City",
		},
	},
	{
		question = "What team conceded the most goals in a BPL season?",
		image = {
			-- file = "images/vincecarter.jpg",
			-- width = 80,
			-- height = 80
		},
		answer = 2, 
		answers = { 
			"Stoke City",  
			"Derby County",
			"Watford",
			"Aston Villa",

		},
	},
}

--Return it now
return M