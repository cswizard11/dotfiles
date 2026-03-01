return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"ms-jpq/coq_nvim",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local coq = require("coq")

		local function load_servers()
			local uv = vim.uv or vim.loop
			local path = vim.fn.stdpath("config") .. "/lua/lsp/servers"
			local handle = uv.fs_scandir(path)
			local names = {}
			local loaded = {}

			if not handle then
				return loaded
			end

			while true do
				local name, file_type = uv.fs_scandir_next(handle)
				if not name then
					break
				end

				if file_type == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" and name:sub(1, 1) ~= "_" then
					names[#names + 1] = name:sub(1, -5)
				end
			end

			table.sort(names)

			for _, name in ipairs(names) do
				local ok, config = pcall(require, "lsp.servers." .. name)
				if ok and type(config) == "table" then
					loaded[name] = config
				elseif ok then
					vim.notify("lsp.servers." .. name .. " must return a table", vim.log.levels.ERROR)
				else
					vim.notify("Failed to load lsp.servers." .. name .. ": " .. tostring(config), vim.log.levels.ERROR)
				end
			end

			return loaded
		end

		local servers = load_servers()
		local mason_lspconfig = require("mason-lspconfig")

		require("mason").setup()
		mason_lspconfig.setup({
			-- Automatically install custom-configured language servers
			ensure_installed = vim.tbl_keys(servers),
			automatic_enable = false,
		})

		-- Install formatters and linters (not LSP servers)
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier",
			},
		})

		local enabled = {}

		for name, config in pairs(servers) do
			vim.lsp.config(name, coq.lsp_ensure_capabilities(config))
			vim.lsp.enable(name)
			enabled[name] = true
		end

		for _, name in ipairs(mason_lspconfig.get_installed_servers()) do
			if not enabled[name] then
				vim.lsp.config(name, coq.lsp_ensure_capabilities({}))
				vim.lsp.enable(name)
				enabled[name] = true
			end
		end

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "󰌵",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				},
			},
		})
	end,
}
