return {
  'stevearc/conform.nvim',
  opts = {},

  config = function()
    require('conform').setup({
      formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback"},
        python = { "isort", "black", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettier", lsp_format = "fallback" },
        yaml = { "prettier", lsp_format = "fallback" },
        sh = { "shfmt", stop_after_first = true, lsp_format = "fallback" },
      }

    })
    -- configure formatters
    require("conform").formatters.shfmt = {
      inherit = false,
      command = "shfmt",
      args = { "-i", "2", "-sr", "-ci", "-filename", "$FILENAME" },
    }
  end
}
