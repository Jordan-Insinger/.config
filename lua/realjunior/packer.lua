-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', branch = 'v0.1.9',
	  requires = { {'nvim-lua/plenary.nvim'} }
  } 

  use({
	  'bluz71/vim-moonfly-colors',
	  as = 'moonlfly',
	  config = function()
		  vim.cmd('colorscheme moonfly')
	  end
  })

  use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('nvim-treesitter.config').setup {
            ensure_installed = { "lua", "python", "cpp", "c", "vim", "vimdoc" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
  })

  use('ThePrimeagen/harpoon')
  use('tpope/vim-fugitive')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')

end)
