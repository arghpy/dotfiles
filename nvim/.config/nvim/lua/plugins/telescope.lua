return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      {
        "nvim-lua/plenary.nvim"
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      }
    },

    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy",
            hidden = true,
          },
          help_tags = {
            theme = "ivy",
          },
        },
      }
      local builtin = require('telescope.builtin')
      builtin.live_multigrep = require('config.telescope.multigrep')
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_multigrep, { desc = 'Telescope custom live_multigrep' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
      vim.keymap.set('n', '<leader>sn',
        function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") } end,
        { desc = 'Telescope help tags' })
    end
  }
}
