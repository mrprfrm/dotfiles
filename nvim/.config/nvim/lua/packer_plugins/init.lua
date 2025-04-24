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
	use("nvim-lua/plenary.nvim")

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

	-- Formatters
	use({
		"windwp/nvim-autopairs",
		config = require_config("plugins.autopairs"),
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = require_config("plugins.gitsigns"),
	})
	use({
		"tpope/vim-fugitive",
	})

	-- Navigation
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
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = require_config("plugins.todo-comments"),
	})
	use({
		"nvim-telescope/telescope-live-grep-args.nvim",
	})
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = require_config("plugins.harpoon"),
	})

	-- Syntax analysys
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require_config("plugins.treesitter"),
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = require_config("plugins.treesitter-context"),
	})

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
		"williamboman/mason.nvim",
		config = require_config("plugins.mason"),
	})
	use({
		"neovim/nvim-lspconfig",
		config = require_config("plugins.lspconfig"),
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		requires = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
		config = require_config("plugins.mason-lspconfig"),
	})
	use({
		"stevearc/conform.nvim",
		config = require_config("plugins.conform"),
	})
	use({
		"simrat39/symbols-outline.nvim",
		config = require_config("plugins.symbols-outline"),
	})
	use({
		"github/copilot.vim",
		config = require_config("plugins.copilot"),
	})
end)
