--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:041d53a15499bd695f0b310000c74d98:9242b3896a18de6a7cf0e7132803e385:ce435692fc93689f71d24df10a8922dc$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- arrow
            x=176,
            y=476,
            width=80,
            height=256,

        },
        {
            -- button_back
            x=272,
            y=8,
            width=200,
            height=128,

        },
        {
            -- button_settings
            x=8,
            y=476,
            width=160,
            height=160,

        },
        {
            -- icon_cinema
            x=272,
            y=144,
            width=196,
            height=256,

        },
        {
            -- icon_games
            x=8,
            y=272,
            width=256,
            height=196,

        },
        {
            -- icon_general
            x=8,
            y=8,
            width=256,
            height=256,

        },
        {
            -- icon_music
            x=272,
            y=408,
            width=196,
            height=196,

        },
    },
    
    sheetContentWidth = 512,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["arrow"] = 1,
    ["button_back"] = 2,
    ["button_settings"] = 3,
    ["icon_cinema"] = 4,
    ["icon_games"] = 5,
    ["icon_basketball"] = 6,
    ["icon_music"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
