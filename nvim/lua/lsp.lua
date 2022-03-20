local utils = require('utils')
local nmap = utils.nmap
local imap = utils.imap
local lspConfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp') .update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- c/c++ --
lspConfig.clangd.setup{
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    on_attach = function()
        print("clangd attached!")
    end,
}
-- lua --
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspConfig.sumneko_lua.setup {
    capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = function() print("hello lua-language-server!") end
}
-- javascript/typescript --
lspConfig.tsserver.setup{
    capabilities = capabilities,
}
-- python --
lspConfig.jedi_language_server.setup{
    capabilities = capabilities,
}
-- markdown -- 
lspConfig.zeta_note.setup{}

