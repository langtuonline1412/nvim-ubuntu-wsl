-- Hàm tự động phát hiện và chạy code
function RunCode()
	local filetype = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename = vim.fn.expand("%:r")

	if filetype == "python" then
		-- Python (chạy riêng để hỗ trợ turtle)
		vim.cmd("!start python " .. file)
	elseif filetype == "cpp" then
		-- C++ (compile và run trong terminal)
		vim.cmd("botright 10split term://g++ " .. file .. " -o " .. filename .. " && .\\" .. filename)
	elseif filetype == "java" then
		-- Java (compile và run trong terminal)
		vim.cmd("botright 10split term://javac " .. file .. " && java " .. filename)
	elseif filetype == "javascript" then
		-- JavaScript (Node.js)
		vim.cmd("botright 10split term://node " .. file)
	elseif filetype == "html" then
		-- HTML (live-server, phải cài sẵn npm i -g live-server)
		vim.cmd("!start live-server " .. file)
	else
		print("⚠️ Ngôn ngữ chưa được hỗ trợ: " .. filetype)
	end
end

-- Keymap
vim.keymap.set("n", "<leader>r", RunCode, { noremap = true, silent = true, desc = "Run code" })
