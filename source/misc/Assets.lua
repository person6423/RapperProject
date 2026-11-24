local PersonsLoveLib = require "libraries.PersonsLoveLib"

local manifest = love.filesystem.load("source/misc/AssetManifest.lua")()

local Assets = { images = {}, audio = {}, quads = {} }

local function baseName(name)
    return (name:gsub("%.%w+$", ""))
end

function Assets.loadAssetGroup(groupName)
    local group = assert(manifest[groupName], "no such asset group: " .. groupName)

    for _, a in ipairs(group.assets) do
    
        local key  = baseName(a.name)
        local path = "assets/" .. group.path .. a.name

        if path:match("%.wav$") then
        
            Assets.audio[key] = love.audio.newSource(path, a.audioType or "static")

        elseif path:match("%.png$") then

            local img = love.graphics.newImage(path)
            Assets.images[key] = love.graphics.newImage(path)

            if a.rows or a.cols then
                local rows, cols = a.rows or 1, a.cols or 1
                local fw, fh = img:getWidth() / cols, img:getHeight() / rows
                Assets.quads[key] = PersonsLoveLib.sliceSheet(img, fw, fh)
            end

        end
    end
end

return Assets