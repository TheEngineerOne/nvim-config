-- lua/config/nvim-jdtls.lua
local jdtls = require("jdtls")

local root_dir = jdtls.setup.find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
local workspace_dir = root_dir

local mason_path = vim.fn.stdpath("data") .. "/mason/packages/java-debug-adapter/extension/server/"
local bundles = vim.fn.glob(mason_path .. "com.microsoft.java.debug.plugin-*.jar", true)

local config = {
  cmd = { "jdtls" },
  root_dir = root_dir,
  capabilities = require("lsp_utils").get_default_capabilities(),
  settings = {
    java = {
      configuration = { updateBuildConfiguration = "interactive" },
      foldingRange = { enabled = false },
    },
  },
  init_options = { bundles = bundles },
}

jdtls.start_or_attach(config)
