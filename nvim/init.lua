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

-- require"theme"
require("config.common")
require("config.vimtree")
require("config.barbar")
require("config.treesitter")
require('cooper-theme.init').colorscheme()

vim.keymap.set('n', '<leader>ff', ':Files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', ':Rg<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', ':Buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', ':Helptags<CR>', { desc = 'Help tags' })

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#ffffff', bg = '#005f87' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#cccccc', bg = '#303030' })

-- bright colors for the selected tab
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#cccccc', bg = '#303030' })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = '#ffffff', bg = '#2a2a2a' })

vim.opt.foldmethod = "indent"
vim.opt.wrap = false

vim.wo.relativenumber = true

-- Define a global Lua function to use as the foldtext
function _G.CustomFoldText()
  -- Get the text of the first line of the fold
  local line = vim.fn.getline(vim.v.foldstart)

  -- Return only the content of the line, without any extra text or line count
  -- You can add optional elements like "..."
  return " " .. vim.trim(line) .. " ... "
end

-- Set the global 'foldtext' option to use the Lua function
vim.opt.foldtext = "v:lua.CustomFoldText()"

-- Optional: Remove the trailing dashes that fill the rest of the line
-- Note the trailing space within the quotes: 'fold: '
vim.opt.fillchars:append({ fold = " " })
vim.opt.clipboard = "unnamedplus"

vim.opt.foldlevelstart = 99
