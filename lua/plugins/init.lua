local packer = require("packer")

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    }
}

packer.startup(
    function(use)
        use "wbthomason/packer.nvim"

        -- Gui enhancements
        use "lukas-reineke/indent-blankline.nvim"
        use {
            "EdenEast/nightfox.nvim",
            config = require("plugins.nightfox"),
        }
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true
            },
            config = require("plugins.lualine"),
        }

        -- Dashboard
        use {
            "goolord/alpha-nvim",
            config = require("plugins.alpha")
        }
        -- Buffer line
        use {
            "akinsho/bufferline.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = require("plugins.bufferline"),
        }

        -- Terminal
        use {
            "akinsho/toggleterm.nvim",
            config = require("plugins.toggleterm"),
        }

        -- Formatters
        use {
            "windwp/nvim-autopairs",
            config = require("plugins.autopairs"),
        }
        use {
            "numToStr/Comment.nvim",
            config = require("plugins.comment"),
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            config = require("plugins.gitsigns")
        }

        -- Navigation
        -- investigate documentation and make some practice
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            config = require("plugins.nvim-tree"),
        }
        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = require("plugins.telescope"),
        }
        use {
            "ahmedkhalf/project.nvim",
            config = require("plugins.project"),
        }

        -- Zen mode
        use {
            "folke/zen-mode.nvim",
            config = require("plugins.zenmode"),
        }
        use {
            "folke/twilight.nvim",
            config = require("plugins.twilight"),
        }

        -- Syntax analysys
        use {
            "nvim-treesitter/nvim-treesitter",
            config = require("plugins.treesitter"),
            run = ":TSUpdate",
        }
        use "windwp/nvim-ts-autotag"
        use "p00f/nvim-ts-rainbow"
        use "JoosepAlviste/nvim-ts-context-commentstring"

        -- Auto complete
        use {
            "hrsh7th/nvim-cmp",
            config = require("plugins.cmp")
        }
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lua"
        use "saadparwaiz1/cmp_luasnip"

        -- Languages snippets
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"

        -- LSP
        use {
            "williamboman/nvim-lsp-installer",
            config = require("plugins.lspinstaller")
        }
        use {
            "neovim/nvim-lspconfig",
            config = require("plugins.lspconfig")
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = require("plugins.null-ls"),
        }
    end
)
