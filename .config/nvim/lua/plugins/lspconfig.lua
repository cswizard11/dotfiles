return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    require("coq").lsp_ensure_capabilities(),
                    settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
                }
            end,
        }
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        vim.g.coq_settings = { ["clients.lsp.weight_adjust"] = 1.5 }
        vim.g.coq_settings = { ["clients.lsp.resolve_timeout"] = 0.75 }
        vim.g.coq_settings = { ["limits.completion_auto_timeout"] = 1 }
    end
}
