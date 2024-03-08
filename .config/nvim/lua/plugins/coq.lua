return {
    "ms-jpq/coq_nvim",
    dependencies = {
        "ms-jpq/coq.artifacts",
        "ms-jpq/coq.thirdparty",
    },
    build = ":COQdeps",
    config = function()
        vim.cmd('COQnow -s')
    end
}
