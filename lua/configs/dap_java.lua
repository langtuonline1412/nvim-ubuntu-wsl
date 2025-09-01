local dap = require("dap")

dap.configurations.java = {
	{
		type = "java",
		request = "launch",
		name = "Launch current file",
		mainClass = function()
			-- Lấy tên class từ file hiện tại
			return vim.fn.expand("%:t:r")
		end,
		projectName = "StandaloneFile",
		cwd = vim.fn.getcwd(),
		args = {},
	},
}
