return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        "folke/neoconf.nvim",
    },
    config = function()
        require("neoconf").setup()
        -- require("java").setup()
        require("mason").setup()
        require("mason-lspconfig").setup()

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = { diagnostics = { globals = { "vim" } } },
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function()
                require("coq").lsp_ensure_capabilities()
            end,
        })

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
