local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

local function require_config(config_name)
	local config_ok, _ = pcall(require, config_name)
	if not config_ok then
		print("Plugin " .. config_name .. " is not awailable")
	end
end

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Gui enhancements
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = require_config("plugins.indentblankline"),
	})
	use({
		"EdenEast/nightfox.nvim",
		config = require_config("plugins.nightfox"),
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = require_config("plugins.lualine"),
	})
	use({
		"stevearc/dressing.nvim",
		config = require_config("plugins.dressing"),
	})
	use("RishabhRD/popfix")

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		config = require_config("plugins.alpha"),
	})

	-- Commands
	use({
		"folke/which-key.nvim",
		config = require_config("plugins.whichkey"),
	})

	-- Buffer line
	use({
		"akinsho/bufferline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = require_config("plugins.bufferline"),
	})
	use("moll/vim-bbye")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = require_config("plugins.toggleterm"),
	})

	-- Formatters
	use({
		"windwp/nvim-autopairs",
		config = require_config("plugins.autopairs"),
	})
	use({
		"numToStr/Comment.nvim",
		config = require_config("plugins.comment"),
	})
	use({
		"anuvyklack/pretty-fold.nvim",
		config = require_config("plugins.pretty-fold"),
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = require_config("plugins.gitsigns"),
	})

	-- Navigation
	-- investigate documentation and make some practice
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = require_config("plugins.nvim-tree"),
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require_config("plugins.telescope"),
	})
	use({
		"ahmedkhalf/project.nvim",
		config = require_config("plugins.project"),
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require_config("plugins.trouble"),
	})
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require_config("plugins.todo-comments"),
	})

	-- Zen mode
	use({
		"folke/zen-mode.nvim",
		config = require_config("plugins.zenmode"),
	})
	use({
		"folke/twilight.nvim",
		config = require_config("plugins.twilight"),
	})

	-- Syntax analysys
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require_config("plugins.treesitter"),
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Auto complete
	use({
		"hrsh7th/nvim-cmp",
		config = require_config("plugins.cmp"),
	})
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")

	-- Languages snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
		config = require_config("plugins.lspinstaller"),
	})
	use({
		"neovim/nvim-lspconfig",
		config = require_config("plugins.lspconfig"),
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = require_config("plugins.null-ls"),
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = require_config("plugins.symbols-outline"),
	})
	use({
		"github/copilot.vim",
		config = require_config("plugins.copilot"),
	})
	use({
		"RishabhRD/nvim-lsputils",
		requires = { "RishabhRD/popfix" },
		config = require_config("plugins.nvim-lsputils"),
	})

	-- Debuging
	use({
		"mfussenegger/nvim-dap",
		config = require_config("plugins.dap"),
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = require_config("plugins.dapui"),
	})
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = require_config("plugins.dap-virtualtext"),
	})
end)
