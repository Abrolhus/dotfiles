local gruvboxPalette = {
    -- bg0 =              {'#92302f',   '236'}, -- for testing
    bg0 =              {'#32302f',   '236'},
    bg1 =              {'#3c3836',   '237'},
    bg2 =              {'#3c3836',   '237'},
    bg3 =              {'#504945',   '239'},
    bg4 =              {'#504945',   '239'},
    bg5 =              {'#665c54',   '241'},
    bg_statusline1 =   {'#3c3836',   '237'},
    bg_statusline2 =   {'#46413e',   '237'},
    bg_statusline3 =   {'#5b534d',   '241'},
    bg_diff_green =    {'#3d4220',   '22'},
    bg_visual_green =  {'#424a3e',   '22'},
    bg_diff_red =      {'#472322',   '52'},
    bg_visual_red =    {'#543937',   '52'},
    bg_diff_blue =     {'#0f3a42',   '17'},
    bg_visual_blue =   {'#404946',   '17'},
    bg_visual_yellow = {'#574833',   '94'},
    bg_current_word =  {'#45403d',   '238'},
    fg0 =              {'#d4be98',   '223'},
    fg1 =              {'#ddc7a1',   '223'},
    red =              {'#ea6962',   '167'},
    orange =           {'#e78a4e',   '208'},
    yellow =           {'#d8a657',   '214'},
    green =            {'#a9b665',   '142'},
    aqua =             {'#89b482',   '108'},
    blue =             {'#7daea3',   '109'},
    purple =           {'#d3869b',   '175'},
    bg_red =           {'#ea6962',   '167'},
    bg_green =         {'#a9b665',   '142'},
    bg_yellow =        {'#d8a657',   '214'},
    grey0 =            {'#7c6f64',   '243'},
    grey1 =            {'#928374',   '245'},
    grey2 =            {'#a89984',   '246'},
    none =             {'NONE',      'NONE'}
}
vim.g.gruvbox_material_palette = gruvboxPalette
vim.g.gruvbox_material_diagnostic_line_highlight = 1
vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
-- vim.g.gruvbox_material_disable_italic_comment = 1 -- teste
vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = 'none'

local function gruvBoxOnAttach()
    vim.cmd("highlight CursorLineNr guifg=" .. gruvboxPalette.grey2[1] .. " gui=bold")
    vim.cmd("highlight CursorLine NONE")
end
return {changeHighlights = gruvBoxOnAttach}
-- vim.g.gruvbox_material_better_performance = 1 -- testing
-- *hl-LineNr*
-- LineNr
