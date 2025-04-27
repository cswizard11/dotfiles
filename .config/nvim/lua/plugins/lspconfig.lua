return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "folke/neoconf.nvim",
    },
    config = function()
        require("neoconf").setup()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    require("coq").lsp_ensure_capabilities(),
                    settings = {
                        Lua = { diagnostics = { globals = { "vim" } } },
                    }
                }
            end,
        }

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "󰌵",
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Warn",
                    [vim.diagnostic.severity.INFO] = "Info",
                    [vim.diagnostic.severity.HINT] = "Hint",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "Error",
                    [vim.diagnostic.severity.WARN] = "Warn",
                    [vim.diagnostic.severity.INFO] = "Info",
                    [vim.diagnostic.severity.HINT] = "Hint",
                }
            }
        })

        vim.g.coq_settings = { ["clients.lsp.weight_adjust"] = 1.5 }
        vim.g.coq_settings = { ["clients.lsp.resolve_timeout"] = 0.75 }
        vim.g.coq_settings = { ["limits.completion_auto_timeout"] = 1 }
    end
}
