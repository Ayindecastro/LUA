-- Data (string) to write

local table = {}
table["muffin"]=1
table["bacon"]=2
table["eggs"]=3
local outString= ""

  for k,v in pairs(table) do
    	outString=outString..k..","..v.."\n"

    	print(outString)
    end

    

local saveData = "Hello!"

  -- for k,v in pairs(table) do
  --   	local item = string.sub(v, 1, string.find(v, ",")-1)
  --   	local price = string.sub(v, string.find(v, ",")+1)
  --   	table[item] = price
  --   end


 
-- Path for the file to write
local path = system.pathForFile( "out.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "w" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Write data to file
    file:write( outString	)
    -- Close the file handle
    io.close( file )
end
 
file = nil






  