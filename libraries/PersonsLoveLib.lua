local PersonsLoveLib = {}

print("--------------------------------------")
print("PersonsLoveLib is installed & working!")
print("--------------------------------------")
print()

function PersonsLoveLib.sliceSheet(image, fw, fh)
    local quads = {}
    for y = 0, image:getHeight() - fh, fh do
        for x = 0, image:getWidth() - fw, fw do
            table.insert(quads, love.graphics.newQuad(x, y, fw, fh, image:getDimensions()))
        end
    end
    return quads
end

return PersonsLoveLib