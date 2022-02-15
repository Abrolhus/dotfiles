local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require('awful')
local beautiful = require('beautiful')
local apps = require('core.apps')
-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", apps.terminal .. " -e man awesome" },
   { "edit config", apps.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", apps.terminal }
                                  }
                        })

local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })
return mylauncher


