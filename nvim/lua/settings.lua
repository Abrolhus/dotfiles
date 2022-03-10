-- local o  = vim.o   -- (global) Options
-- local wo = vim.wo -- Window Options
-- local bo = vim.bo -- Buffer Options

---- SETTINGS ----
local opt = vim.opt
opt.guicursor = ""
opt.mouse = "a"
opt.relativenumber = true 
opt.number = true
opt.hidden = true
opt.errorbells = false
opt.wrap = false
opt.showmode = true
opt.updatetime=500
opt.scrolloff = 8
--- undo
opt.swapfile = false
opt.backup = false
opt.undodir = "~/.config/nvim/undodir"
opt.undofile = true
--- tabs
opt.tabstop = 4 
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
--- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
--- decorations
opt.termguicolors = true
opt.cmdheight = 2
opt.signcolumn = "yes"
opt.shortmess = "filnxtToOFc" -- set shortmess+=c