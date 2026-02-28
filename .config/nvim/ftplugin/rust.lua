vim.keymap.set('n', '<localleader>w', function()
    vim.cmd('%!leptosfmt --stdin --rustfmt')
    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
        conform.format({ lsp_format = "fallback" })
    else
        vim.lsp.buf.format()
    end
    vim.cmd('w')
end, { buffer = true, desc = "Format with leptosfmt and save" })
