vim.treesitter.language.register('java', 'jsp')
vim.keymap.set('n', '<localleader>j', function()
    pcall(function()
        vim.cmd('LspStop')
    end)
    vim.cmd('set filetype=jsp')
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
end, {})

vim.keymap.set('n', '<localleader>h', function()
    vim.cmd('set filetype=html')
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = false
end, {})
