
local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
lspconfig.pyright.setup {
  capabilities = capabilities,
}

-- C++
lspconfig.clangd.setup {
  capabilities = capabilities,
}

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }
    }
  }
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "pyright", "clangd", "jdtls" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "tsserver", "pyright", "clangd", "jdtls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}
