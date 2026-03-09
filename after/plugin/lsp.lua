-- lsp.lua

-- Diagnostic signs (empty icons like lsp-zero preference)
vim.diagnostic.config({
    signs = false,
})

-- Shared on_attach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd",          function() vim.lsp.buf.definition() end,        opts)
        vim.keymap.set("n", "K",           function() vim.lsp.buf.hover() end,              opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,  opts)
        vim.keymap.set("n", "<leader>vd",  function() vim.diagnostic.open_float() end,     opts)
        vim.keymap.set("n", "[d",          function() vim.diagnostic.goto_next() end,       opts)
        vim.keymap.set("n", "]d",          function() vim.diagnostic.goto_prev() end,       opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,        opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,         opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,             opts)
        vim.keymap.set("i", "<C-h>",       function() vim.lsp.buf.signature_help() end,    opts)
    end,
})

-- Configure servers via vim.lsp.config
vim.lsp.config("eslint", {})
vim.lsp.config("rust_analyzer", {})

-- Enable the servers
vim.lsp.enable("eslint")
vim.lsp.enable("rust_analyzer")

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-p>']     = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>']     = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>']     = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    }),
})
