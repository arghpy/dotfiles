return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua" },
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Using this option may slow down your editor
      additional_vim_regex_highlighting = false,
    })
    -- Folding based on expression
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevel = 99
    vim.opt.foldenable = false
  end
}
