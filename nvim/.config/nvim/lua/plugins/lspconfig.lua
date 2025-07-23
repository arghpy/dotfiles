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
    require("mason-lspconfig").setup{
      function(server_name)
        require("lspconfig")[server_name].setup {}
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
      end,
      ["pylsp"] = function ()
        require("lspconfig").pylsp.setup({
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  maxLineLength = 120
                }
              }
            }
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
        "pylsp",
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

        -- linters
        "actionlint",
        "ansible-lint",
        "yamllint",
      }
    }
  end
}
