return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					jump = { close = true },
					layout = { preset = "vertical" },
				},
				git_status = {
					focus = "list",
				},
				git_diff = {
					focus = "list",
				},
				registers = {
					focus = "list",
				},
				undo = {
					focus = "list",
				},
				notifications = {
					focus = "list",
				},
			},
		},
		quickfile = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		-- Find
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep_word({ focus = "list" })
			end,
			mode = { "n", "x" },
			desc = "Grep word/selection",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart find",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume last picker",
		},
		-- Diagnostics
		{
			"<leader>dd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "All diagnostics",
		},
		{
			"<leader>de",
			function()
				Snacks.picker.diagnostics({ severity = vim.diagnostic.severity.ERROR })
			end,
			desc = "Errors",
		},
		{
			"<leader>dw",
			function()
				Snacks.picker.diagnostics({ severity = vim.diagnostic.severity.WARN })
			end,
			desc = "Warnings",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto definition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto implementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto type definition",
		},
		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		-- Misc
		{
			"<leader>fy",
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo history",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<C-CR>",
			function()
				Snacks.terminal.toggle(vim.o.shell)
			end,
			mode = { "n", "t" },
			desc = "Toggle floating terminal",
		},
		-- Git
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git status",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff",
		},
	},
}
