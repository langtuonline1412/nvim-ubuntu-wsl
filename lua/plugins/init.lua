return {
	-- Lazy quản lý chính nó
	{ "folke/lazy.nvim" },

	-- Giao diện
	{ "nvim-lualine/lualine.nvim" },
	{ "kyazdani42/nvim-web-devicons" },

	-- file explorer
	--NvimTree (mới)
	{ "nvim-tree/nvim-tree.lua" },

	-- Tìm kiếm (Fuzzy)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- highlight code
	-- 🌳 Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- LSP (ngôn ngữ)
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- Mason để cài language servers
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "clangd", "lua_ls", "html" },
				automatic_installation = true,
			})
		end,
	},

	-- 🧠 Autocomplete
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },

	-- Git integration
	{ "lewis6991/gitsigns.nvim" },

	-- Chủ đề
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("dracula")
		end,
	},
}
