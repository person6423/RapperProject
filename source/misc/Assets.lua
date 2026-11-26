local PersonsLoveLib = require "libraries.PersonsLoveLib"

local manifest = love.filesystem.load("source/misc/AssetManifest.lua")()

local Assets = { images = {}, audio = {}, quads = {} }

local function baseName(name)
    return (name:gsub("%.%w+$", ""))
end

function Assets.loadAssetGroup(groupName)
    print("Loading asset group: " .. groupName)
    local loadSuccessful = 0

    local group = assert(manifest[groupName], "Asset Group does not exist: " .. groupName)
    local key = "missing"
    local path = "missing"

    for _, a in ipairs(group.assets) do
    
        key = baseName(a.name)
        path = "assets/" .. group.path .. a.name

        if love.filesystem.getInfo(path, "file") == nil then loadSuccessful = 2 end

        if loadSuccessful ~= 0 then
            break
        end

        if path:match("%.wav$") or path:match("%.ogg$") then
        
            local aud = love.audio.newSource(path, a.audioType or "static")
            Assets.audio[key] = aud

            aud:setLooping(a.looping or false)

        elseif path:match("%.png$") then

            local img = love.graphics.newImage(path)
            Assets.images[key] = img

            if a.rows or a.cols then
                local rows, cols = a.rows or 1, a.cols or 1
                local fw, fh = img:getWidth() / cols, img:getHeight() / rows
                Assets.quads[key] = PersonsLoveLib.sliceSheet(img, fw, fh)
            end

        else
            loadSuccessful = 1
        end
    
    end

    local message = ""

    if loadSuccessful == 0 then
        message = "Load successful! : " .. groupName
    elseif loadSuccessful == 1 then
        message = "Load unsuccessful! : Unknown file extention -> " .. path
    elseif loadSuccessful == 2 then
        message = "Load unsuccessful! : Missing asset -> " .. path
    else
        message = "Load unsuccessful! : Unknown Error!"
    end

    print(message)
    if loadSuccessful ~= 0 then
        print()
        assert(false, message)
    end
end

return Assets