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
        callback = vim.lsp.buf.document_highlight 
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

