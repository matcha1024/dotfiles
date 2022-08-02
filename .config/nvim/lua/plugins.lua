vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("neovim/nvim-lspconfig")
	use("tami5/lspsaga.nvim")
	use("folke/lsp-colors.nvim")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("windwp/nvim-autopairs")
	use("akinsho/toggleterm.nvim")
	use("rcarriga/nvim-notify")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("goolord/alpha-nvim")
	use("j-hui/fidget.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use("sidebar-nvim/sidebar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("petertriho/nvim-scrollbar")
	use("yioneko/nvim-yati")
	use("folke/trouble.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("simrat39/rust-tools.nvim")
	use("EdenEast/nightfox.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
end)
