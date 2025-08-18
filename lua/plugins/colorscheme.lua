-- lua/plugins/colorscheme.lua
return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("dracula") -- load mặc định theme dracula
  end,
}
