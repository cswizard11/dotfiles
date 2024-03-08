return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
        require('which-key').setup()

        require('which-key').register {
            ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        }
    end,
}
