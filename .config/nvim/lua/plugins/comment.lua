return {
	"numToStr/Comment.nvim",
	keys = {
		{
			"<leader>c",
			mode = "n",
			function()
				require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "[C]omment",
		},
		{
			"<leader>c",
			mode = "v",
			"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
			desc = "[C]omment",
		},
	},
	opts = {},
}
