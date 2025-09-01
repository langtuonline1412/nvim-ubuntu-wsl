-- configs/java.lua
-- Cấu hình cho Java với nvim-java

-- Kiểm tra plugin đã được cài chưa
local ok, java = pcall(require, "java")
if not ok then
	return
end

require("configs.dap_java")

-- Kích hoạt nvim-java
if ok then
	java.setup()
end

-- Keymaps cho Java LSP
local function set_java_keymaps(bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Điều hướng & thông tin
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	-- Refactor & Code actions
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>oi", function()
		vim.lsp.buf.execute_command({
			command = "java.edit.organizeImports",
			arguments = { vim.uri_from_bufnr(bufnr) },
		})
	end, opts)

	-- Format
	vim.keymap.set("n", "<leader>fm", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	-- Test & Debug
	vim.keymap.set("n", "<leader>tm", "<cmd>JavaTestMethod<CR>", opts)
	vim.keymap.set("n", "<leader>tc", "<cmd>JavaTestClass<CR>", opts)
	vim.keymap.set("n", "<leader>td", "<cmd>JavaDebugAttach<CR>", opts)
end

-- Tự động set keymaps khi mở file Java
vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function(args)
		set_java_keymaps(args.buf)
	end,
})
