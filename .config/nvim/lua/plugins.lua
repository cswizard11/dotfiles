return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'folke/tokyonight.nvim'

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use {
		"ms-jpq/coq_nvim",
		"ms-jpq/coq.artifacts",
		"ms-jpq/coq.thirdparty"
	}

	use "nvim-tree/nvim-web-devicons"

	use "nvim-lua/plenary.nvim"

	use "nvim-telescope/telescope.nvim"

	use 'ThePrimeagen/harpoon'

	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
end)
