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

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup ({
          on_attach = function(_, bufnr)
            vim.bo[bufnr].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
          end,
        })
      end,
      ["ts_ls"] = function ()
        require("lspconfig").ts_ls.setup({
          init_options = {
            preferences = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
              importModuleSpecifierPreference = 'non-relative',
            },
          }
        })
      end
    }
    require('mason-tool-installer').setup {
      ensure_installed = {
        -- lsp servers
        "ansible-language-server",
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "lua-language-server",
        "phpactor",
        "rust-analyzer",
        "texlab",
        "typescript-language-server",
        "yaml-language-server",

        -- formatters
        "black",
        "isort",
        "prettier",
        "shfmt",
        "stylua",
        "yamlfix",
        "clang-format",

        -- linters
        "actionlint",
        "ansible-lint",
        "yamllint",
      }
    }
  end
}
