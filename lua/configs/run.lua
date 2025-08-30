local Terminal = require("toggleterm.terminal").Terminal

-- Hàm tự động phát hiện và chạy code
function RunCode()
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename = vim.fn.expand("%:r")
	local fullpath = vim.fn.expand("%:p")

	local cmd = ""

	if filetype == "python" then
		-- Python (chạy riêng để hỗ trợ turtle)
		cmd = "python " .. file
	elseif filetype == "cpp" then
		-- C++ (compile và run trong terminal)
		cmd = "g++ " .. file .. " -o " .. filename .. " && .\\" .. filename
	elseif filetype == "c" then
		-- C (compile and run)
		cmd = "gcc " .. file .. " -o " .. filename .. " && .\\" .. filename
	elseif filetype == "java" then
		-- Java (compile và run trong terminal)
		cmd = "javac " .. file .. " && java " .. filename
	elseif filetype == "javascript" then
		-- JavaScript (Node.js)
		cmd = "node " .. file
	elseif filetype == "html" then
		-- HTML (live-server, phải cài sẵn npm i -g live-server)
		local choice = vim.fn.input("Chạy file HTML bằng [1] live-server, [2] chrome, [3] Chạy live-server: ")
		if choice == "1" then
			cmd = "live-server " .. file
		elseif choice == "2" then
			cmd = "chrome " .. fullpath
		elseif choice == "3" then
			cmd = "live-server"
		else
			print("❌ Lựa chọn không hợp lệ.")
			return
		end
	else
		print("⚠️ Ngôn ngữ chưa được hỗ trợ: " .. filetype)
		return
	end

	-- Tạo terminal và chạy lệnh
	local term = Terminal:new({
		cmd = cmd,
		direction = "float", -- horizontal, vertical, float, tab
		close_on_exit = false,
		hidden = true,
	})

	term:toggle()
end

-- Keymap
vim.keymap.set("n", "<leader>r", RunCode, { noremap = true, silent = true, desc = "Run code" })
