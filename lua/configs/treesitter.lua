local ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter.configs not found!")
  return
end

autotag = {
    enable = true,
},

ts_config.setup({
  ensure_installed = { "lua", "vim", "python", "javascript", "html", "css" },
  highlight = { enable = true },
})
