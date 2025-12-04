local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('rebelot/kanagawa.nvim')
Plug('kyazdani42/nvim-tree.lua')
Plug('kyazdani42/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('neovim/nvim-lspconfig')  
Plug('hrsh7th/nvim-cmp')       
Plug('hrsh7th/cmp-nvim-lsp')   
Plug('L3MON4D3/LuaSnip')
Plug('saadparwaiz1/cmp_luasnip') 
Plug('junegunn/fzf', {['do'] = 'fzf#install()'})
Plug('junegunn/fzf.vim')
vim.call('plug#end')

home = os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path

require"common"
require"vimtree"
require"theme"
require"barbar"
require"treesitter"

vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', ':Helptags<CR>', { desc = 'Help tags' })

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
