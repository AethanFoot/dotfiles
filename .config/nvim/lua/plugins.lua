return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Basics --
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	})
	use("jiangmiao/auto-pairs")
	use("ntpeters/vim-better-whitespace")
	use("dracula/vim")

	-- File Management --
	use("BurntSushi/ripgrep")
	use("sharkdp/fd")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- IDE Functionality --
	use("Yggdroot/indentLine")
	use("mhartington/formatter.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("nvim-treesitter/nvim-treesitter")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	-- Tim Pope --
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("tpope/vim-endwise")
	use("tpope/vim-commentary")
end)
