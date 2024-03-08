vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>w', function()
    local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
    if client ~= nil then
        vim.lsp.buf.format()
    else
        vim.cmd('normal mf')
        vim.cmd('normal gg=G')
        vim.cmd('normal `f')
    end
    vim.cmd('w')
end)
