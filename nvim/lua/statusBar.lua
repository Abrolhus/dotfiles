-- local colorPalette = require('colorscheme').getColorPalette()
local M = {}
 local modesMap = {
	['n'] = 'normal',
	['no'] = 'n·operator pending',
	['v'] = 'visual',
	['V'] = 'v·line',
	[''] = 'v·block',
	['s'] = 'select',
	['S'] = 's·line',
	[''] = 's·block',
	['i'] = 'insert',
	['R'] = 'replace',
	['Rv'] = 'v·replace',
	['c'] = 'command',
	['cv'] = 'vim ex',
	['ce'] = 'ex',
	['r'] = 'prompt',
	['rm'] = 'more',
	['r?'] = 'confirm',
	['!'] = 'shell',
	['t'] = 'terminal'
}

local web_devicons = require "nvim-web-devicons"

local get_file_icon = function(fname)
  local extension = string.match(fname, ".?[^.]+%.(.*)") or ""
  -- local icon, hl_group = web_devicons.get_icon(fname)
  local icon = web_devicons.get_icon(fname) or ""
  return icon
end
local function getModeText()
	local m = vim.api.nvim_get_mode().mode
    local modeText = modesMap[m] or m
    return modeText
end

-- set Highlights
-- TODO: lua this (actually wait for nvim updates)
local function highlight(group, fg, bg)
    if bg then
        vim.cmd("highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
    else
        vim.cmd("highlight " .. group .. " guifg=" .. fg)
    end
end

highlight("Mode", "yellow", "grey")
vim.cmd "highlight default link StatusMode Visual"
-- vim.cmd "highlight link StatusLine Substitute"
-- vim.cmd "highlight StatusMode gui=bold"


M.get = function()
    local gitStatus = ""
    if(vim.b.gitsigns_status) then
        gitStatus = vim.b.gitsigns_status
    end
    local statuslineTable = {
        "%#StatusMode#",
        " " .. getModeText() .. " ",
        "%#TabLineFill#",
        -- vim.cmd"echo b:gitsigns_status",
        "",
        --"%#ModeMsg#",
        " ".. gitStatus .. " ",
        -- "%q", -- quickfix list?
        "%=",
        get_file_icon(vim.api.nvim_buf_get_name(0)) .. " %f ",
        "%r",
        "%=",
        -- "%3.3(%b%)|%-3.3(%B%)",
        "%13.13(%l:%c%) %7.7(%p%% %)",
        -- "%y",
    }
    return table.concat(statuslineTable)
end
return M



