return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            eslint = {
                -- Auto-detect .eslintrc.* files in project root
                on_attach = function(client, bufnr)
                    -- Enable auto-fix on save if you want (optional)
                    -- vim.api.nvim_create_autocmd("BufWritePre", {
                    --     buffer = bufnr,
                    --     command = "EslintFixAll",
                    -- })
                end,
                settings = {
                    -- ESLint will auto-detect your project's config files
                    workingDirectories = { mode = "auto" },
                    format = false, -- Let Prettier handle formatting, ESLint does linting
                },
                -- File types ESLint should activate on
                filetypes = {
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                },
            },
        },
    },
    config = function(_, opts)
        -- This ensures ESLint LSP is configured when lspconfig loads
        local lspconfig = require("lspconfig")
        for server, config in pairs(opts.servers) do
            lspconfig[server].setup(config)
        end
    end,
}
