-- init.lua
require("options")
require("keymaps")

-- Khởi động Lazy và load plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.dap" },
    { import = "plugins.markdown" },
})

require("nvim-tree").setup()
require("configs.lsp")
require("configs.treesitter")
require("configs.cmp")
require("configs.run")
require("configs.java")
