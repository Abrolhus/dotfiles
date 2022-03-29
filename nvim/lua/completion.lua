local cmp = require("cmp")
local luasnip = require("luasnip")
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
        ["<C-k>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

    ["<C-j>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    },

    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    sources = {
        -- source options:
        --     keyword_length
        --     priority
        --     max_item_count
        { name = 'nvim_lsp_signature_help' },
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
