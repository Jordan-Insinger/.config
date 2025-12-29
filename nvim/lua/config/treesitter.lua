require'nvim-treesitter.configs'.setup {
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to install (or "all")
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "bash",
    "markdown",
    "markdown_inline",
  },

  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
}
