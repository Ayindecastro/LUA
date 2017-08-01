
--- Ayinde Castro 
-- Memory Game

display.setDefault("background",.137254902,.2235294118,.3568627451)


local nums1={} -- nums1 array
local nums2={} -- nums2 array

function click( event ) -- click function 
	print("Hello?") -- bug test
	
	if event.target.alpha == 1 then --- if statement regarding transparency 
		print("YES")

		event.target.alpha = 0 -- changes alpha value to 0 
	
	end

end
local  width = display.contentWidth -- width
local  height = display.contentHeight -- height

 youWin=display.newText("YOU WIN!",width/2,height/2,nil,64) --- You win text
 youWin.alpha=0 -- makes the alpha 0

 local remaining = 6

 local isProcessing = false


function randomize( event )

 remaining=6
 youWin.alpha=0 -- makes the alpha 0

	for i = 0,11 do -- For loop making nums1 nums 2 alpha value to 1 

	 
	  nums1[i].alpha=1 -- makes nums1 alpha = to 1
	  -- nums1[i].alpha=1 -- makes nums1 alpha = to 1
	  nums2[i].alpha=1 -- makes nums2 alpha = to 1
	  -- nums2[i].alpha=1 -- makes nums2 alpha = to 1

end

	squaresRevealed=0 -- sets counter squaresRevealed to 0 

	for i = 0, 20 do -- For loop generating a random number (0,11)

		local new1 = math.random(0,11) -- generates a random number (0,11)
		local new2 = math.random(0,11) -- generates a random number (0,11)


		print(new1 .. ", " .. new2) -- prints new1 & new2

		-- local new2Copy = new2
		local temp1x = nums1[new1].x -- temp var for X
		local temp1y = nums1[new1].y  -- temp var for Y 
		

		nums1[new1].x=nums1[new2].x -- swap
		nums1[new2].x=temp1x -- swap
		nums1[new1].y=nums1[new2].y --swap
		nums1[new2].y=temp1y -- swap

        nums2[new1].x=nums2[new2].x -- swap
		nums2[new2].x=temp1x -- swap
		nums2[new1].y=nums2[new2].y --swap
		nums2[new2].y=temp1y --swap 

	end


end

-- local randomizeButton = display.newRect(300,800,300,100) -- button for Randomize
-- randomizeButton:setFillColor(0,1,1) -- sets color of randomize button 

-- local randomizeText= display.newText("Randomize",300,800,nil,36) -- text for randomizer
-- randomizeText:setFillColor(0,0,0) -- sets text to black 


squaresRevealed = 0 -- sets squaresRevealed to 0
clickedIndex = {} -- sets clickedIndex array



local  divider = display.newRect(width/2,height/5.8,width,height/100) -- divided header from the game
divider:setFillColor(173/255, 26/255, 80/255)
local  memoryGameText = display.newText("MEMORY",width/2,height/8,nil,64) -- text in the header
memoryGameText:setFillColor(173/255, 26/255, 80/255)
 
local  divider2 = display.newRect(display.contentWidth/2,height/1.14,width,height/100) -- a divider
divider2:setFillColor(173/255, 26/255, 80/255)

local home= display.newRect(width/2,height/1.14,300,100) -- home button 
home:setFillColor(173/255, 26/255, 80/255) -- sets color of home button 

local homeText= display.newText("RANDOMIZE",width/2,height/1.14,nil,36) -- home button text
homeText:setFillColor(0,0,0) -- mkes the text black

home:addEventListener("tap",randomize)  -- adds event listener

local myName = display.newText("CREATED BY AYINDE CASTRO",width/2,height/1.03,nil,24)


function tapped( event ) -- fapped function 

	if isProcessing == false then
       isProcessing= true
	



	youWin.alpha=0

	if squaresRevealed == 2  then
		nums2[clickedIndex[1]].alpha=1
		nums2[clickedIndex[2]].alpha=1
		squaresRevealed=0
	end

	squaresRevealed = squaresRevealed +1 -- adds 1 to squaresRevealed
	clickedIndex[squaresRevealed] = event.target.index -- passed squaredRevealed into clicked Index

	print("Squares Revealed: " .. squaresRevealed) -- debugger
	print("Index Revealed: " .. event.target.index) -- debugger

	transition.to(event.target, {time = 000, alpha = 0}) -- transition effect
	local index = event.target.index -- sets index 

	if squaresRevealed == 2 and nums2[clickedIndex[1]].color == nums2[clickedIndex[2]].color and nums2[clickedIndex[1]] ~= nums2[clickedIndex[2]] then
		-- nums1[clickedIndex[1]]:removeSelf() -- removes the block
		-- nums1[clickedIndex[2]]:removeSelf() -- removes the block
		-- nums2[clickedIndex[1]]:removeSelf() -- removes the block
		-- nums2[clickedIndex[2]]:removeSelf() -- removes the block
		--^^ not used dode
		nums1[clickedIndex[1]].alpha=0 -- sets the alpha of 1st clicked rect to 0
		nums1[clickedIndex[2]].alpha=0 -- sets the alpha of 2nd clicked rect to 0

		squaresRevealed=0 -- sets squaredRevealed to 0

		remaining=remaining-1 -- subtracts 1 subtracting
		print(remaining) -- debugging. prints remaining

   		
   end

	


 youWin.alpha=0 -- changes alpha of youWin to 0

if remaining==0 then -- if counter ==0

	youWin.alpha=1 -- changes alpha of youWin to 1
  end

 isProcessing=false
   end
  
end


 
for i=0,11 do -- for look for displaying nums1 & nums2

	nums1[i] = display.newRect(width/5+width/5*(i%4), height/3 + width/5*math.floor(i/4),width/6,width/6)
	nums1[i].index=i
	nums2[i] = display.newRect(width/5+width/5*(i%4), height/3 + width/5*math.floor(i/4),width/6,width/6)
	nums2[i]:addEventListener("tap",tapped)
	nums2[i].index=i

end


	print(display.contentWidth)
	print(display.contentHeight)


nums1[0]:setFillColor(1,1,0)--color
nums1[0].color="Yellow"
nums2[0].color="Yellow"
------------------------------------
nums1[11]:setFillColor(1,0,1) --color
nums1[11].color="Pink"
nums2[11].color="Pink"
--------------------------

------------------------
nums1[1]:setFillColor(0,0,1)--color
nums1[1].color="Blue"
nums2[1].color="Blue"
--------------------------

---------------------------
nums1[9]:setFillColor(0,1,0) --color
nums1[9].color="Green"
nums2[9].color="Green"
-------------------------
nums1[4]:setFillColor(1,1,0)--color
nums2[4].color="Yellow"
nums1[4].color="Yellow"

----------------------------
nums1[5]:setFillColor(0,0,1)--color
nums1[5].color="Blue"
nums2[5].color="Blue"
------------------------
nums1[6]:setFillColor(.058,.99,.42) --color
nums1[6].color="Light Green"
nums2[6].color="Light Green"

-----------------------
nums1[7]:setFillColor(.5,.02,1) -- color 
nums1[7].color="Purple"
nums2[7].color="Purple"
--------------------
nums1[8]:setFillColor(1,0,1)-- color
nums1[8].color="Pink"
nums2[8].color="Pink"
--------------------------------
nums1[3]:setFillColor(.5,.02,1) --color
nums1[3].color="Purple"
nums2[3].color="Purple"
--------------------------
nums1[2]:setFillColor(.058,.99,.42) --color
nums1[2].color="Light Green"
nums2[2].color="Light Green"
-----------------------

nums1[10]:setFillColor(0,1,0) -- color
nums1[10].color="Green"
nums2[10].color="Green"
-----------------------

randomize()


