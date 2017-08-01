--math.randomseed(5)
--print (math.random()) -- some number between 0 and 1
-- print (math.random()+20) -- some number between 20 and 21
-- print (10*math.random()+20) -- some number between 20 and 30
-- print (math.random(10)) -- equivalent of random 0-1 * 10
-- print (math.random(10))--equivalent 10* math.random +20(minimum) Range * random number + minimum value ANY # between 0 and 10
-- there is never true random. Sudo Random

math.floor(4.6) -- 4. ALWAYS ROUNDED DOWN
math.ceil(4.6) -- 4 ALWAYS ROUNDS UP
print (math.round(4.6)) -- 5 Properly Rounds 
print((math.pi))


-- for i=0, display.contentWidth do
-- display.newCircle(i,400+100*ma)



local text = display.newText("Gradien",375,150,nil,100)

local w = display.contentWidth


for i=0,w do
	local sin = 400-math.sin(math.rad(i))*100
	local cos = 700-math.sin(math.rad(i))*100
	local line=display.newLine(i,sin,i,cos) -- start and end points
	line:setStrokeColor(i*3.87/w,i*3.67/w,i*7.78/w)
  --display.newCircle(i,500+math.sin(math.rad(i))*-100,2) -- 200 = radius
	--display.newCircle(i,800+math.cos(math.rad(i))*-100,2) -- 200 = radius

end

--print(math.deg(math.pi))

-- print(math.exp(5)) --- E to the 5th power
-- print(math.pow(2,3))







