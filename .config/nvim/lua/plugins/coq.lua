return {
    "ms-jpq/coq_nvim",
    dependencies = {
        "ms-jpq/coq.artifacts",
        "ms-jpq/coq.thirdparty",
    },
    build = ":COQdeps",
    init = function()
        vim.g.coq_settings = {
            ["clients.lsp.weight_adjust"] = 1.5,
            ["clients.lsp.resolve_timeout"] = 0.75,
            ["limits.completion_auto_timeout"] = 1,
        }
    end,
    config = function()
        vim.cmd('COQnow -s')
    end
}
