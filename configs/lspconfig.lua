local configs = require("plugins.configs.lspconfig")
local on_attach = require("lsp-format").on_attach
local capabilities = configs.capabilities
require 'hex'.setup()

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "lua_ls", "gopls", "intelephense", "jsonls", "pylsp",
  "arduino_language_server", "lemminx", "asm_lsp", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.asm_lsp.setup {}

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
lspconfig.tsserver.setup { on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),
}


lspconfig.emmet_ls.setup
{
  filetypes = { "html", "css" }
}
