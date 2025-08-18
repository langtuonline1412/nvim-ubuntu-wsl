-- Keymaps cơ bản
-- Dễ viết hơn (không phải gõ nhiều `vim.keymap.set`)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- NvimTree toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

--Bufferline
map("n", "<leader>n", ":bn<cr>") -- Chuyen sang file ke tiep
map("n", "<leader>p", ":bp<cr>") -- Chuyen ve file truoc do
map("n", "<leader>x", ":bd<cr>") -- Dong file hien tai

-- Tìm kiếm
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Lưu file
map("n", "<C-s>", ":w<CR>", { desc = "Save file" }, opts)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }, opts)
map("i", "<C-s>", "<Esc>:w<CR>l", { desc = "Save file in insert mode" })

-- Thoát file
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Chuyển giữa các cửa sổ
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- Mở terminal dưới (horizontal)
map("n", "<leader>t", ":split | terminal<CR>", { desc = "Open terminal below", silent = true })

-- Đóng terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Chọn theme
map("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>", { desc = "Choose Colorscheme" })

map("i", "jj", "<Esc>", opts)

-- Biên dịch và chạy file Python
map("n", "<leader>rp", ":w<CR>:terminal python %<CR>", { desc = "Run Python file" }, opts)

-- Biên dịch & chạy file C++
map("n", "<leader>rc", ":w<CR>:terminal g++ % -o %:r && %:r<CR>", { desc = "Compile & run C++" }, opts)

-- Biên dịch & chạy file Java
map("n", "<leader>rj", ":w<CR>:terminal javac % && java %:r<CR>", { desc = "Compile & run Java" }, opts)

-- Linter
map("n", "<leader>lf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
map("n", "<leader>ll", function()
	require("lint").try_lint()
end, { desc = "Lint file" })

-- Debug
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "Start/Continue Debug" })
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "Step Over" })
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "Step Into" })
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "Step Out" })
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
