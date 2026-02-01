return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            html = { "prettier" },
            htmlangular = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
        },

        default_format_opts = {
            lsp_fallback = true,
        },

        formatters = {
            prettier = {
                -- Use Angular parser for HTML files when in Angular projects
                prepend_args = function(self, ctx)
                    local filetype = vim.bo[ctx.buf].filetype

                    -- if filetype == "html" or filetype == "htmlangular" then
                    --     local root = vim.fs.root(ctx.dirname, { "angular.json", "project.json" })
                    --     if root then
                    --         return { "--parser", "angular" }
                    --     end
                    -- end

                    return {}
                end,
            },
        },
    },
}
