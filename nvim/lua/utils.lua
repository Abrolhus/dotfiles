return {
    nmap = function(...) 
        local lhs, rhs, opts = ...
        vim.keymap.set('n', lhs, rhs, opts) 
    end,
    imap = function(...) 
        local lhs, rhs, opts = ...; 
        vim.keymap.set('i', lhs, rhs, opts) 
    end
}

