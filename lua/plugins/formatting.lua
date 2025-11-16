return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local js_formatters = { "prettierd", "eslint_d" }

    conform.setup({
      formatters_by_ft = {
        typescript = js_formatters,
        typescriptreact = js_formatters,
        javascript = js_formatters,
        javascriptreact = js_formatters,
        go = { "goimports", "gofmt" },
        -- svelte = { "prettier" },
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        -- graphql = { "prettier" },
        -- liquid = { "prettier" },
        lua = { "stylua" },
      },
      format_after_save = {
        lsp_fallback = true,
        async = true,
        timeout_ms = 800,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 600,
      })
    end, { desc = "DEPRECATED Format file or range (in visual mode)" })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 600,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
