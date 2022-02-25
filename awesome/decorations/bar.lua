local awful = require('awful')
local gears = require("gears")
local wibox = require("wibox")
-- local tagList = require('decorations.tagList')
-- local taskList = require('decorations.taskList')
-- each screen has a bar. Each bar has a bunch of widgets and stuff
local buildBar = function(screen, height)
    local bar = {}
    bar.bar = awful.wibar({ position = "top", screen = screen, height = height})
    local taglist_buttons = require('decorations.tagList')
    local tasklist_buttons = require('decorations.taskList')
    bar.mylauncher = require('decorations.listMenu')
    -- promtbox widget
    bar.mypromptbox = awful.widget.prompt()
    bar.mykeyboardlayout = awful.widget.keyboardlayout()
    bar.mytextclock = wibox.widget.textclock()
    -- layoutbox (click to change layout..)
    bar.mylayoutbox = awful.widget.layoutbox(s)
    bar.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    bar.mytaglist = awful.widget.taglist {
        screen  = screen,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }
    bar.keyMapWidget = require('decorations.widgets')

    -- Create a tasklist widget
    bar.mytasklist = awful.widget.tasklist {
        screen  = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }
    bar.bar:setup {
         layout = wibox.layout.align.horizontal,
         { -- Left widgets
             layout = wibox.layout.fixed.horizontal,
             bar.mylauncher,
             bar.mytaglist,
             bar.mypromptbox,
         },
         bar.mytasklist, -- Middle widget
         { -- Right widgets
             layout = wibox.layout.fixed.horizontal,
             bar.mykeyboardlayout,
             bar.keyMapWidget,
             --applets.network,
             --applets.sound,
             wibox.widget.systray(),
             bar.mytextclock,
             bar.mylayoutbox,
         },
     }
     return bar
end
return buildBar
