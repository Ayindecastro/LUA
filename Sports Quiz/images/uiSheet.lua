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
            x=44,
            y=119,
            width=20,
            height=64,

        },
        {
            -- button_back
            x=68,
            y=2,
            width=50,
            height=32,

        },
        {
            -- button_settings
            x=2,
            y=119,
            width=40,
            height=40,

        },
        {
            -- icon_cinema
            x=68,
            y=36,
            width=49,
            height=64,

        },
        {
            -- icon_games
            x=2,
            y=68,
            width=64,
            height=49,

        },
        {
            -- icon_basketball
            x=2,
            y=2,
            width=64,
            height=64,

        },
        {
            -- icon_music
            x=68,
            y=102,
            width=49,
            height=49,

        },
    },
    
    sheetContentWidth = 128,
    sheetContentHeight = 256
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
