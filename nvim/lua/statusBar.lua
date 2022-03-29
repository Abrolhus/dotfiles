-- local colorPalette = require('colorscheme').getColorPalette()
-- TODO: add errors and warnings number on statusbar (:h diagnostic) vim.diagnostic.get(0) -> table de diagnosticos
local hlUtils = require("utils.highlights")
local webDevIcons = require"nvim-web-devicons"
local function getErrorsAndWarningsNum()
    local diagnostics = vim.diagnostic.get(0)
    local nErrors = 0
    local nWarnings = 0
    local nHints = 0
    local nInfos = 0
    for index, value in ipairs(diagnostics) do
        if diagnostics[index].severity == vim.diagnostic.severity.ERROR then
            nErrors = nErrors + 1
        elseif diagnostics[index].severity == vim.diagnostic.severity.WARN then
            nWarnings = nWarnings + 1
        elseif diagnostics[index].severity == vim.diagnostic.severity.INFO then
            nInfos = nInfos + 1
        elseif diagnostics[index].severity == vim.diagnostic.severity.HINT then
            nHints = nHints + 1
        end
    end
    return nErrors, nWarnings, nHints, nInfos
end
local M = {}
 local modesMap = {
	['n']  = {'normal',             'N '},
	['no'] = {'n·operator pending', 'no'},
	['v']  = {'visual',             'V '},
	['V']  = {'v·line',             'VL'},
	[''] = {'v·block',            'VB'},
	['s']  = {'select',             'S '},
	['S']  = {'s·line',             'SL'},
	[''] = {'s·block',            'SB'},
	['i']  = {'insert',             'I '},
	['R']  = {'replace',            'R '},
	['Rv'] = {'v·replace',          'Rv'},
	['c']  = {'command',            'c '},
	['cv'] = {'vim ex',             'cv'},
	['ce'] = {'ex',                 'ce'},
	['r']  = {'prompt',             'r '},
	['rm'] = {'more',               'rm'},
	['r?'] = {'confirm',            'r?'},
	['!']  = {'shell',              '! '},
	['t']  = {'terminal',           't '},
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
    local modeText = modesMap[m][1] or m
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

M.setHighlights = function()
    local statusLineHl = hlUtils.getHighlightGroupAsTable("TabLineFill")
    local baseErrorHl = hlUtils.getHighlightGroupAsTable("DiagnosticSignError")
    local baseWarningHl = hlUtils.getHighlightGroupAsTable("DiagnosticSignWarn")
    local baseHintHl = hlUtils.getHighlightGroupAsTable("DiagnosticSignHint")
    local baseDimStatus = hlUtils.getHighlightGroupAsTable("Whitespace")

    hlUtils.createHighlightGroup("StatusLineError", {guifg=baseErrorHl.guifg}, statusLineHl) -- TODO: return the createdGroup as table
    hlUtils.createHighlightGroup("StatusLineWarn", {guifg=baseWarningHl.guifg}, statusLineHl)
    hlUtils.createHighlightGroup("StatusLineHint", {guifg=baseHintHl.guifg}, statusLineHl)
    hlUtils.createHighlightGroup("StatusLineDim", {guifg=baseDimStatus.guifg}, statusLineHl)
end


M.icons = {}
M.get = function()
    local separators = {"", "", "⋅", "", "|"}
    local gitStatus = ""
    if(vim.b.gitsigns_status) then
        gitStatus = vim.b.gitsigns_status
    end


    local nErrors, nWarnings, nHints = getErrorsAndWarningsNum()
    local statuslineTable = {
        "%#StatusMode#",
        " " .. getModeText(),
        " ",
        "%#TabLineFill#",
        -- vim.cmd"echo b:gitsigns_status",
        "",
        --"%#ModeMsg#",
        " ".. gitStatus .. " ",
        -- "%q", -- quickfix list?
        "%=",
        get_file_icon(vim.api.nvim_buf_get_name(0)) .. " %f ",
        "%r",
        " ",
        "%#StatusLineError#",
        nErrors,
        "%#StatusLineDim#",
        separators[5],
        "%#StatusLineWarn#",
        nWarnings,
        "%#StatusLineDim#",
        separators[5],
        "%#StatusLineHint#",
        nHints,
        "%#TabLineFill#",
        "%=",
        -- "%3.3(%b%)|%-3.3(%B%)",
        "%13.13(%l:%c%) %7.7(%p%% %)",
        -- "%y",
    }
    return table.concat(statuslineTable)
end
return M



