return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- Automatically install these language servers
            ensure_installed = {
                "lua_ls",
                "ts_ls",  -- TypeScript/JavaScript
                "eslint", -- ESLint LSP
            },
        })

        -- Install formatters and linters (not LSP servers)
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
            },
        })

        -- Lua language server config
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = { diagnostics = { globals = { "vim", "hs" } } },
            }
        })

        -- TypeScript/JavaScript language server config
        vim.lsp.config('ts_ls', {
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    }
                }
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
                require("coq").lsp_ensure_capabilities()
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration', buffer = args.buf })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = '[G]oto [D]efinition', buffer = args.buf })
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
