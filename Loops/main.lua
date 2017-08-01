-- local x = 0

-- --------------------
-- while x <=10 do

-- 	print(x)
-- 	x= x+1

-- end

-- --------------------

-- for i=1,x,2 do
-- 	print(i)
-- end

-- -------------------

-- local y = 10

-- repeat 
-- 	print(y)
-- 	y=y+1


-- until y >=10

local nums={}
nums[1]=1
nums[2]=2

local nums={}
nums[1]=1
nums[2]=2
print(nums[1],nums[2])

for i=1,2 do
    print(nums[i])
end


function click( event )
		event.target:setFillColor(1,0,0)
end

local nums1={}

for i=0,23 do

	nums1[i] = display.newRect(100+150*(i%4), 100+150*math.floor(i/4),100,100)
	nums1[i]:addEventListener("tap",click)
	end

nums1[5]:setFillColor(0,1,0)

	