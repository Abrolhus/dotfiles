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
require 'plugins.toggleTerm'
require 'diagnostics'
LuaStatusline = require 'statusBar' -- TODO: make this LuaStatusLine local
local colorscheme = require 'colorscheme'
--- colorscheme ---
vim.cmd "colorscheme gruvbox-material"
colorscheme.changeHighlights()
LuaStatusline.setHighlights()
vim.opt.statusline = "%!luaeval('LuaStatusline.get()')" -- gambiarra
