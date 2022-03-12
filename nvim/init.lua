vim.g.mapleader = " "

require 'settings'
require 'plugins'
require 'maps'
require 'lsp'
require 'qol'
require 'completion'
require 'statusBar'
require 'plugins.treesitter'
require 'plugins.comment'
require 'plugins.nvimTree'
local colorscheme = require 'colorscheme'
--- colorscheme ---
vim.cmd "colorscheme gruvbox-material"
colorscheme.changeHighlights()
