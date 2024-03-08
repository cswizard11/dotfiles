vim.keymap.set('n', '<localleader>j', function()
    vim.lsp.buf_detach_client(0, 1)
    vim.treesitter.language.register('java', 'jsp')
    vim.cmd('set filetype=jsp')
    vim.opt.expandtab = true
end, {})

vim.keymap.set('n', '<localleader>h', function()
    vim.cmd('set filetype=html')
end, {})
