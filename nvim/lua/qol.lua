--- auto-commands ---
--highlight text on yank
local highlightYankGroup = vim.api.nvim_create_augroup('highlight_yank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', { group = 'highlight_yank', pattern = '*', callback = function() vim.highlight.on_yank({on_visual=true}) end })

-- highlight-symbol-on-cursor-hold
vim.api.nvim_create_augroup('cursor_hold_word', { clear = true })
vim.api.nvim_create_autocmd( 'CursorHold',
    {
        group = 'cursor_hold_word',
        pattern = '*',
        --buffer = 0,
        callback = function()
            if vim.lsp.buf_is_attached() then
                vim.lsp.buf.document_highlight()
            end
        end
    }
)
vim.api.nvim_create_autocmd( 'CursorMoved',
    {
        group = 'cursor_hold_word',
        --buffer = 0,
        pattern = '*',
        callback = vim.lsp.buf.clear_references
    }
)
--[[ vim.api.nvim_create_augroup('highlightCurrentLine', { clear = true })
vim.api.nvim_create_autocmd( 'CursorHold',
    {
        group = 'highlightCurrentLine',
        pattern = '*',
        callback = function() vim.opt.cursorline = true end
    }
)
vim.api.nvim_create_autocmd( 'CursorMoved',
    {
        group = 'highlightCurrentLine',
        --buffer = 0,
        pattern = '*',
        callback = function() vim.opt.cursorline = false end
    }
) ]]

vim.api.nvim_create_augroup('diagnosticOnHold', { clear = true })
vim.api.nvim_create_autocmd( 'CursorHold',
    {
        group = 'diagnosticOnHold',
        pattern = '*',
        --buffer = 0, 
        callback = function() vim.diagnostic.open_float({scope="cursor"}) end
    }
)




