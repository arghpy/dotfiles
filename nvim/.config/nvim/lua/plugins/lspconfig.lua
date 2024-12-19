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
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer"
      }
    })

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup ({
          on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
          end,
        })
      end,
    }
    require('mason-tool-installer').setup {}
  end
}
