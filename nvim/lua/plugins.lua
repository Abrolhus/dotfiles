require('packer').startup(
function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- lsp
    use 'neovim/nvim-lspconfig'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- QOL -- 
    use 'antoinemadec/FixCursorHold.nvim'
    -- decorations -- 
    use 'sainnhe/gruvbox-material'
    use 'kyazdani42/nvim-web-devicons'
    use {'j-hui/fidget.nvim', config = require'fidget'.setup{}} -- eye candy, shows lsp loading
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- TreeSitter --
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }

    -- Completion --
    use { 'L3MON4D3/LuaSnip' }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip' 
        -- use 'hrsh7th/cmp-cmdline'
    -- automatic complete pairs and html tags
    use {'windwp/nvim-autopairs', config = require'nvim-autopairs'.setup{}}
    use {'windwp/nvim-ts-autotag', 
        requires = { {'nvim-treesitter/nvim-treesitter'} },
        config = require'nvim-treesitter.configs'.setup {
          autotag = {
            enable = true,
          }
        }
    }
    -- comment
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- File Tree -- 
    use { 'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }
end)
