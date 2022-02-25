local awful = require('awful')
local button = require('awful.widget.button')
local gears = require('gears')

local keyMapWidget = awful.widget.button()
keyMapWidget:buttons(gears.table.join(
    keyMapWidget:buttons(),
    awful.button({}, 1, nil, function ()
        print("Mouse was clicked")
    end)
))

return keyMapWidget
