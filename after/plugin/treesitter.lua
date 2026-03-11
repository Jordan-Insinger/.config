-- Just ensure parsers are installed, highlighting is handled by neovim natively
require('nvim-treesitter.config').setup({
    ensure_installed = { "lua", "python", "cpp", "c", "vim", "vimdoc" },
    auto_install = true,
})

-- Enable treesitter highlighting natively
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then end
    end,
})
