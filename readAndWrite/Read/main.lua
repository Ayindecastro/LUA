-- Path for the file to read
local path = system.pathForFile( "in.txt")
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    -- print( "Contents of " .. path .. "\n" .. contents )

    -- Close the file handle
    io.close( file )

    local lines = {}
    local count = 1
    local lineEnding = string.find(contents, "\n")
    print(lineEnding)
    while lineEnding ~= nil do
    	local line = string.sub(contents, 1, lineEnding) -- up until and don't unclude lineEnding
    	lines[count] = line
    	count = count + 1
    	contents = string.sub(contents, lineEnding + 1) --- contents starts 16 now 
        print(contents)
    	lineEnding = string.find(contents, "\n")
    end

    local prices = {}
    for k,v in pairs(lines) do
    	local item = string.sub(v, 1, string.find(v, ",")-1)
    	local price = string.sub(v, string.find(v, ",")+1)
    	prices[item] = price
    end

    for k,v in pairs(prices) do
    	print(k,v)
    end
end
 
file = nil





