local cmp = require("cmp")
cmp.setup {
    mapping = {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<tab>"] = cmp.config.disable, -- no tab
        ["<C-space>"] = cmp.mapping.complete(),
    },
    sources = {
        -- source options: 
        --     keyword_length
        --     priority 
        --     max_item_count
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        -- { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },


    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }

}
