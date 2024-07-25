local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local servers = { "html", "cssls", "pyre" } -- Add pyre language server
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "python" }
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
