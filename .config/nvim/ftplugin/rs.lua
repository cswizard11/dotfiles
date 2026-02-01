vim.keymap.set('n', '<localleader>w', function()
    vim.cmd('%!leptosfmt --stdin --rustfmt')
    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.format({ lsp_fallback = true })
    else
        vim.lsp.buf.format()
    end
    vim.cmd('w')
end, {})
