vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})
require("lazydev").setup({
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
})
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
