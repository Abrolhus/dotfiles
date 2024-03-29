local gears = require('gears')
local beautiful = require('beautiful')
local wallpaper = {}
wallpaper.set_wallpaper = function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        -- gears.wallpaper.maximized(wallpaper, s, true)
        -- gears.wallpaper.centered(wallpaper, s)
        -- gears.wallpaper.tiled(wallpaper, s)
        gears.wallpaper.fit(wallpaper, s)
    end
end
return wallpaper;

