vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format and save current buffer
vim.keymap.set("n", "<leader>w", function()
	local conform_ok, conform = pcall(require, "conform")
	if conform_ok then
		conform.format({ lsp_format = "fallback" })
	else
		local client = vim.lsp.get_clients({ bufnr = 0 })[1]
		if client ~= nil then
			vim.lsp.buf.format()
		else
			vim.cmd("normal mf")
			vim.cmd("normal gg=G")
			vim.cmd("normal `f")
		end
	end
	vim.cmd("w")
end, { desc = "Format and save" })

-- Format current buffer without saving
vim.keymap.set("n", "<leader>lp", function()
	local conform_ok, conform = pcall(require, "conform")
	if conform_ok then
		conform.format({ lsp_format = "fallback" })
	else
		vim.lsp.buf.format()
	end
end, { desc = "Format (Prettier)" })

-- Open diagnostic float
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- ESLint: Fix all auto-fixable issues
vim.keymap.set("n", "<leader>lf", function()
	vim.lsp.buf.code_action({
		context = {
			only = { "source.fixAll.eslint" },
			diagnostics = {},
		},
		apply = true,
	})
end, { desc = "ESLint fix all" })

-- Toggle TypeScript inlay hints
vim.keymap.set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

vim.keymap.set("n", "<leader>te", function()
	local dir = vim.fn.input("Directory: ", "", "dir")
	if dir ~= "" then
		local expanded = vim.fn.fnamemodify(vim.fn.expand(dir), ":p")
		if vim.fn.isdirectory(expanded) == 0 then
			vim.notify("Not a directory: " .. dir, vim.log.levels.WARN)
			return
		end
		vim.cmd("tabnew")
		vim.cmd("tcd " .. vim.fn.fnameescape(expanded))
	end
end, { desc = "Open tab in directory" })
