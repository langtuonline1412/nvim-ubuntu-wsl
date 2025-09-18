
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
-- TypeScript
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
})

-- Css
lspconfig.cssls.setup({
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
		scss = {
			validate = true,
		},
		less = {
			validate = true,
		},
	},
})

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
        ensure_installed = { "lua_ls", "ts_ls", "cssls", "pyright", "clangd", "jdtls" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "lua_ls", "ts_ls", "cssls", "pyright", "clangd", "jdtls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}
