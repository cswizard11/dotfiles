return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },

    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "gemini",
                    keymaps = {
                        send = {
                            modes = { n = "<CR>" }
                        }
                    }
                }
            },
            display = {
                chat = {
                    window = {
                        layout = "float"
                    }
                }
            }
        })
        vim.keymap.set('n', '<leader><leader>', require("codecompanion").toggle, { desc = 'Code Companion Chat' })
    end
}
