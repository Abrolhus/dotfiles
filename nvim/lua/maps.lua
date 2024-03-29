local utils = require('utils')
local nmap = utils.nmap
local imap = utils.imap
local vmap = utils.vmap
local safeLspCall = function(func)
    return function()
        if vim.lsp.buf_is_attached then
            func()
        end
    end
end
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
nmap("<leader>y", '"+y')
vmap("<leader>y", '"+y')
nmap("<leader>Y", '"+Y')
vmap("<leader>Y", '"+Y')
-- meta
nmap("<leader><CR>", function() vim.cmd "source ~/.config/nvim/init.lua"; print("mas") end)
nmap("<leader>ei", function() vim.cmd "edit ~/.config/nvim/init.lua" end)
vim.keymap.set({'i', 'n', 'c', 'x'}, "<C-c>", "<esc>") 
vim.keymap.set({'i', 'n', 'c', 'x'}, "<C-[>", "<esc>") 
-- lsp --
local slc = safeLspCall
nmap("gh", slc(vim.lsp.buf.hover))
-- nmap("K", slc(vim.lsp.buf.hover))
nmap("gd", slc(vim.lsp.buf.definition))
nmap("gi", slc(vim.lsp.buf.implementation))
nmap("gD", slc(vim.lsp.buf.declaration))
nmap("gT", slc(vim.lsp.buf.type_definition))
nmap("gr", slc(vim.lsp.buf.references))
nmap("<leader>rr", slc(vim.lsp.buf.rename))
nmap("<leader>dn", slc(function() vim.diagnostic.goto_next{float = false} end))
nmap("<leader>dp", slc(function() vim.diagnostic.goto_prev{float = false} end))
nmap("<leader>dh", slc(vim.diagnostic.open_float)) -- diagnostic help
nmap("<leader>df", slc(function() vim.lsp.buf.code_action({only="quickfix"}) end)) -- diagnostic help
-- telescope --
local biTelescope = require('telescope.builtin')
nmap("<leader>pf", biTelescope.find_files)
nmap("<leader>pc", biTelescope.current_buffer_fuzzy_find)
nmap("<leader>pp", function() biTelescope.find_files({no_ignore = true}) end)
nmap("<leader>pg", biTelescope.live_grep)
nmap("<leader>pb", biTelescope.buffers)
nmap("<leader>ph", biTelescope.help_tags)
-- file tree
nmap("<leader>fo", function() vim.cmd "NvimTreeRefresh"; vim.cmd "NvimTreeToggle" end)
nmap("<leader>ft", function() vim.cmd "NvimTreeFocus" end)
