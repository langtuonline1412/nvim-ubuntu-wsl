return {
	-- Hiển thị Markdown trong Neovim
	{
		"MeanderingProgrammer/markdown.nvim",
		name = "render-markdown",
		ft = "markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("render-markdown").setup({})
		end,
	},

	-- Comment nhanh
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

	-- Treesitter cho Markdown
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
			opts.highlight = opts.highlight or {}
			opts.highlight.additional_vim_regex_highlighting = { "markdown" }
		end,
	},
}
