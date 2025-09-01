local jdtls = require("jdtls")

local config = {
  cmd = { "/home/dai/.local/share/nvim/mason/bin/jdtls" },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
  settings = {
    java = {},
  },
  init_options = {
    bundles = {
      vim.fn.glob("/home/dai/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
    },
  },
}
jdtls.start_or_attach(config)