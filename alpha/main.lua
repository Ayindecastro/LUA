display.setDefault("background",1,1,1)
local rect1 = display.newImage("westbrook2.png",280,300,100,100)
local rect = display.newImage("durant2.jpg",300,880,500,100)
local gsw = display.newImage("durant3.png",300,850,500,100)
local text = display.newText("TRAITOR",300,550,nil,64)
     text:setFillColor(1,1,1)
     gsw.alpha=0


function changeAlpha( event )

	

transition.to(rect1,{time=1000, rotation=90})
	
	if (rect.alpha==0) then
		transition.to(rect,{time=1000, alpha=1})

		transition.to(text,{time=2000})
		text:setFillColor(1,1,1)
		transition.to(gsw,{time=1000, alpha=0})

		

		elseif(rect.alpha==1) then
		transition.to(rect,{time=1000, alpha=0})

		 
		 transition.to(gsw,{time=1000, alpha=1})


   		
   		transition.to(text,{time=5000})
		text:setFillColor(0,0,0)
     
    end
	end

rect1:addEventListener("tap",changeAlpha)