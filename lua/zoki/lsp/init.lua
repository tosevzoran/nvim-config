local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end


require "zoki.lsp.mason"
require("zoki.lsp.handlers").setup()
-- TODO: Check nvim lint (https://github.com/mfussenegger/nvim-lint)
require "zoki.lsp.null-ls"

