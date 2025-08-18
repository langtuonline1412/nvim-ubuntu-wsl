return {
	-- Linter - nvim-lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				python = { "flake8" },
				javascript = { "eslint_d" },
				lua = { "luacheck" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	-- Formatter - conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					python = { "black" },
					lua = { "stylua" },
					javascript = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	-- Comment Code
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		keys = {
			{ "gc", mode = { "n", "v" }, desc = "Toggle comment" },
			{ "gb", mode = { "n", "v" }, desc = "Toggle block comment" },
		},
	},

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_auto_start = 0
		end,
	},

	{
		"preservim/vim-markdown",
		ft = { "markdown" },
		init = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
	},

	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown", -- tên rút gọn để gọi lại
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "markdown",
		config = function()
			require("render-markdown").setup({})
		end,
	},
}
