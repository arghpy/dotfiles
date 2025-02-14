return {
  'stevearc/conform.nvim',
  opts = {},

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = {"prettierd", "prettier", stop_after_first = true },
        yaml = { "yamlfmt", "yamlfix", stop_after_first = true},
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-sr", "-ci" },
        },
      },
    })
  end
}
