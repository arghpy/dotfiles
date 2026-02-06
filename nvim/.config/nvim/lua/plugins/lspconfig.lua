return {
  "williamboman/mason.nvim",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    {
      "neovim/nvim-lspconfig",
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require('mason-tool-installer').setup {
      ensure_installed = {
        -- lsp servers
        "ansible-language-server",
        "bash-language-server",
        "clangd",
        "json-lsp",
        "lua-language-server",
        "phpactor",
        "pylsp",
        "rust-analyzer",
        "texlab",
        "typescript-language-server",
        "yaml-language-server",

        -- linters
        "actionlint",
        "ansible-lint",
        "yamllint",

        -- formatters
        "black",
        "isort",
        "prettier",
        "shfmt",
        "stylua",
      }
    }
  end
}
