-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- icon file đẹp
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- dạng buffers (các file mở)
        separator_style = "slant", -- đường viền dạng xiên
        diagnostics = "nvim_lsp", -- hiện cảnh báo, lỗi từ LSP
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          }
        },
      },
    })
  end,
}
