vim.treesitter.language.register('java', 'jsp')
vim.keymap.set('n', '<localleader>j', function()
    pcall(function() vim.lsp.buf_detach_client(0, 1) end)
    vim.cmd('set filetype=jsp')
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end, {})

vim.keymap.set('n', '<localleader>h', function()
    vim.cmd('set filetype=html')
end, {})
