return {
    'stevearc/oil.nvim',
    opts = {
        keymaps = {
            ["<BS>"] = { "actions.parent", mode = "n" },
            ["<ESC>"] = { "actions.close", mode = "n" },
        }
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
        {
            "<leader>o",
            function()
                vim.cmd("Oil --float " .. vim.fn.expand('%:p:h'));
            end,
            desc = "Oil"
        }
    }
}
