local Assets = require "source.misc.Assets"

local stageData = {}

stageData.songAsset = Assets.audio.CheepCheepTheCookingChickensRap
stageData.bpm = 100
stageData.chart = 
{
    {
        chartBars = {0, 4},
        notes = {
            {
                type = 1,
                tileX = 0,
            },
            {
                type = 1,
                tileX = 2,
            },
            {
                type = 1,
                tileX = 4,
            },
            {
                type = 2,
                tileX = 7,
            },
            {
                type = 5,
                tileX = 9,
            },
            {
                type = 6,
                tileX = 12,
            },
        }
    },
    {
        chartBars = {2, 6},
        notes = {
            {
                type = 3,
                tileX = 0,
            },
            {
                type = 3,
                tileX = 2,
            },
            {
                type = 3,
                tileX = 4,
            },
            {
                type = 4,
                tileX = 7,
            },
            {
                type = 5,
                tileX = 9,
            },
            {
                type = 6,
                tileX = 12,
            },
        }
    },
}

return stageData