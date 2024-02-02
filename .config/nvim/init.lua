-- Neovim configuration file


-- Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    -- Theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },

    -- Treesitter - better syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = { enable = true },

                -- enable indentation
                indent = { enable = true },

                -- ensure these language parsers are installed
                ensure_installed = {
                    "yaml",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "gitignore",
                },
                incremental_selection = { enable = true },
            })
        end,
    },

    -- LSP Support
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'L3MON4D3/LuaSnip'}
        },
    },
})

-- LSP Configuration
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Manage LSP server through mason
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Keybindings for autocomplete
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<M-CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<M-Space>'] = cmp.mapping.complete(),

    -- Selection window up/down
    ['<M-k>'] = cmp.mapping.select_prev_item(),
    ['<M-j>'] = cmp.mapping.select_next_item(),

    -- Scroll up and down in the completion documentation
    ['<M-u>'] = cmp.mapping.scroll_docs(-4),
    ['<M-i>'] = cmp.mapping.scroll_docs(4),
  })
})

-- Setting diagnostic
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- Turn off virtual text diagnostic
vim.diagnostic.config({
    virtual_text = false
})

-- GLOBALS
--
-- Required to copy files
vim.g.netrw_keepdir = false

-- Hide banner
vim.g.netrw_banner = false

-- Setting the mapleader
vim.g.mapleader = " "


-- KEYMAPS
--
-- Go back from file to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- greatest remap ever idk??
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- copies to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- OPTIONS
--
-- Numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Make tab 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Searching in file
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 8

-- Update time / not sure about this
vim.opt.updatetime = 100

-- Color scheme
vim.opt.termguicolors = true
vim.cmd.colorscheme "catppuccin"

-- Extend path
vim.opt.path = vim.opt.path + ',/usr/avr/include'
