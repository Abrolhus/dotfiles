local utils = require('utils')
nmap = utils.nmap
imap = utils.imap

--- window --- 
-- window movement
nmap("<leader>h", function() vim.cmd "wincmd h" end)
nmap("<leader>j", function() vim.cmd "wincmd j" end)
nmap("<leader>k", function() vim.cmd "wincmd k" end)
nmap("<leader>l", function() vim.cmd "wincmd l" end)
-- splits
nmap("<leader>sh", function() vim.cmd "lefta  :vsplit" end)
nmap("<leader>sj", function() vim.cmd "rightb :split" end)
nmap("<leader>sk", function() vim.cmd "lefta  :split" end)
nmap("<leader>sl", function() vim.cmd "rightb :vsplit" end)
nmap("<leader>+" , function() vim.cmd ":vertical resize +5" end)
nmap("<leader>-" , function() vim.cmd ":vertical resize -5" end)
---/---
---sane-keybindings---
nmap("Y", "y$")
nmap("q", "<nop>")
-- meta
nmap("<leader><CR>", function() vim.cmd "source ~/.config/nvim/init.lua"; print("mas") end)
nmap("<leader>ei", function() vim.cmd "edit ~/.config/nvim/init.lua" end)
imap("<C-c>", function() print("heyy") end)
vim.keymap.set({'i', 'n', 'c', 'x'}, "<C-c>", "<esc>") 
-- telescope -- 
local biTelescope = require('telescope.builtin')
nmap("<leader>pf", biTelescope.find_files)
nmap("<leader>pc", biTelescope.current_buffer_fuzzy_find)
nmap("<leader>pp", function() biTelescope.find_files({no_ignore = true}) end)
nmap("<leader>pg", biTelescope.live_grep)
nmap("<leader>pb", biTelescope.buffers)
nmap("<leader>ph", biTelescope.help_tags)
-- lsp --
nmap("gh", vim.lsp.buf.hover or "<nop>", { buffer=0 })
nmap("gd", vim.lsp.buf.definition or "<nop>", { buffer=0 })
nmap("gi", vim.lsp.buf.implementation or "<nop>", { buffer=0 })
nmap("gD", vim.lsp.buf.declaration or "<nop>", { buffer=0 })
nmap("gT", vim.lsp.buf.type_definition or "<nop>", { buffer=0 })
nmap("<leader>rr", vim.lsp.buf.rename or "<nop>", { buffer=0 })
nmap("<leader>dn", vim.diagnostic.goto_next or "<nop>", { buffer=0 })
nmap("<leader>dp", vim.diagnostic.goto_prev or "<nop>", { buffer=0 })
