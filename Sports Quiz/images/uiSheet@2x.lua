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
            x=88,
            y=238,
            width=40,
            height=128,

        },
        {
            -- button_back
            x=136,
            y=4,
            width=100,
            height=64,

        },
        {
            -- button_settings
            x=4,
            y=238,
            width=80,
            height=80,

        },
        {
            -- icon_cinema
            x=136,
            y=72,
            width=98,
            height=128,

        },
        {
            -- icon_games
            x=4,
            y=136,
            width=128,
            height=98,

        },
        {
            -- icon_general
            x=4,
            y=4,
            width=128,
            height=128,

        },
        {
            -- icon_music
            x=136,
            y=204,
            width=98,
            height=98,

        },
    },
    
    sheetContentWidth = 256,
    sheetContentHeight = 512
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
