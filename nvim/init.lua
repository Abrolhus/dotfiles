vim.g.mapleader = " "

require 'settings'
require 'plugins'
require 'maps'
require 'lsp'
require 'qol'
require 'completion'
require 'plugins.treesitter'
require 'plugins.comment'
require 'plugins.nvimTree'
LuaStatusline = require 'statusBar'
local colorscheme = require 'colorscheme'
--- colorscheme ---
vim.cmd "colorscheme gruvbox-material"
colorscheme.changeHighlights()
vim.opt.statusline = "%!luaeval('LuaStatusline.get()')" -- gambiarra
