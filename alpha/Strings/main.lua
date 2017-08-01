local text= "ABCDEF"
print(text:len())

local length=text:len()

print(text:lower())

print(text:reverse())

local find = text:find("CDE")
print(find)

print(text:find("CDE"))

print(text:sub(2,4))

print(string.char(65)) -- ASCII Converter

for i=65,90 do
print(string.char(i))	-- Difference between a capital number and lowercase number is 32

end
