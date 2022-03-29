-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
beautiful.init("~/.config/awesome/theme.lua")

-- This is used later as the default terminal and editor to run.
local apps = require('core.apps')
-- terminal = "alacritty"
-- editor = os.getenv("EDITOR") or "vi"
-- editor_cmd = apps.terminal .. " -e " .. editor
-- applets --
applets = require('decorations.applets')
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = require('core.layouts')
awful.layout.layouts = layouts;
-- TODO: keybinds to change layout,
-- mod + t + l => tile left,
-- mod + t + n = tile 'normal',
-- mod + t + f = fullscreen,
-- mod + t + t = tile top,
-- mod + t + b = tile bot,
-- mod + t + s = spiral
-- mod + T = floating
--
-- ...
-- }}}

-- {{{ Menu
local mylauncher = require('decorations.listMenu')
-- Menubar configuration
menubar.utils.terminal = apps.terminal -- Set the terminal for applications that require it
-- }}}
local wallpaper = require('decorations.wallpaper')
-- local set_wallpaper = wallpaper.set_wallpaper
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", wallpaper.set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    wallpaper.set_wallpaper(s)
    -- Each screen has its own tag table.
    awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", "disc", "wpp", "music" }, s, awful.layout.layouts[1])
    -- Each screen has its own statusBar
    local buildBar = require('decorations.bar')
    print(beautiful.bg_normal)
    s.bar = buildBar(s, beautiful.statusBar.height)
end)
-- }}}

-- {{{ Mouse bindings
local bindings  = {
    mouseGlobal = require('bindings.mouseGlobal'),
    mouseClient = require('bindings.mouseClient'),
    keysGlobal  = require('bindings.keysGlobal'),
    keysClient  = require('bindings.keysClient')
}
root.buttons(bindings.mouseGlobal)
globalkeys = bindings.keysGlobal

-- Set keys
clientbuttons = bindings.mouseClient
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
local rules = require('core.rules')
awful.rules.rules = rules
-- }}}

-- {{{ Signals
require('core.signals')
-- }}}

--
-- auto start
awful.spawn.once(applets.network, nil, nil, "nm-applet")
awful.spawn.once(applets.sound, nil, nil, "sound-applet")
awful.spawn.once(apps.musicPlayer)
awful.spawn.once(apps.discord)
awful.spawn.once(apps.whatsapp)
awful.spawn.once("picom -b")
