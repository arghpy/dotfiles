vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/BurntSushi/ripgrep",
})
require('telescope').setup {
  defaults = require('telescope.themes').get_ivy {},
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--ignore",
        "--hidden",
        "--glob=!.git"
      },
    },
    live_grep = {
      additional_args = {
        "--hidden",
        "--glob=!.git",
      },
    },
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files,  { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,   { desc = 'Telescope live_grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = 'Telescope colorschemes' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags,   { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ht', builtin.help_tags,   { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>st', builtin.tags,        { desc = 'Telescope search tags' })
