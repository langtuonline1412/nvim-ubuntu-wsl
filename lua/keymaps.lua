-- Keymaps cơ bản
-- Dễ viết hơn (không phải gõ nhiều `vim.keymap.set`)
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- NvimTree toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>f", ":NvimTreeFindFile<Return>", opts)

--Bufferline
map("n", "<leader>n", ":bn<cr>") -- Chuyen sang file ke tiep
map("n", "<leader>p", ":bp<cr>") -- Chuyen ve file truoc do
map("n", "<leader>x", ":bd<cr>") -- Dong file hien tai

-- Tìm kiếm
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Lưu file
map("n", "<C-s>", ":w<CR>", { desc = "Save file" }, opts)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }, opts)
map("i", "<C-s>", "<Esc>:w<CR>l", { desc = "Save file in insert mode" })

-- Thoát file
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Chuyển giữa các cửa sổ
map("n", "sh", "<C-w>h", { desc = "Move to left window" })
map("n", "sl", "<C-w>l", { desc = "Move to right window" })
map("n", "sj", "<C-w>j", { desc = "Move to bottom window" })
map("n", "sk", "<C-w>k", { desc = "Move to top window" })

-- Thay đổi kích thước cửa sổ
map("n", "<leader><left>", ":vertical resize +10<cr>")
map("n", "<leader><right>", ":vertical resize -10<cr>")
map("n", "<leader><up>", ":resize +5<cr>")
map("n", "<leader><down>", ":resize -5<cr>")

-- Tabs
map("n", "te", ":tabedit<Return>", opts)
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)
map("n", "tw", ":tabclose<Return>", opts)

-- move a blocks of text up/down with K/J in visual mode
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Center the screen after scrolling up/down width Ctrl-u/d
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Center the screen on the nex/prev search result with n/N
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste in visual mode without yanking replace text
map("x", "p", [["_dP]])

-- yank to clipboard
map({ "n", "v" }, "<leader>y", [["+y]])

-- yank line to clipboard
map("n", "<leader>Y", [["+Y]])

-- delete without yanking
map({ "n", "v" }, "<leader>d", [["_d]])

-- move 5 lines up/down with arrows keys
map("n", "<Down>", "5jzz")
map("n", "<Up>", "5kzz")

-- Mở terminal dưới (horizontal)
map("n", "<leader>t", ":botright 10split | terminal<CR>i", { desc = "Open terminal below", silent = true })

-- Đóng terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Chọn theme
map("n", "<leader>cs", "<cmd>Telescope colorscheme<CR>", { desc = "Choose Colorscheme" })

map("i", "jj", "<Esc>", opts)

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
