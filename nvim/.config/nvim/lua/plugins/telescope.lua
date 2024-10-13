return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end
      },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font
      },
    },

    config = function()
      local telescope = require("telescope")
      local telescopeConfig = require("telescope.config")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          -- `hidden = true` is not supported in text grep commands.
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
        },
      })
      require('telescope').load_extension('fzf')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags,
        { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps,
        { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files,
        { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string,
        { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep,
        { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics,
        { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume,
        { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles,
        { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>ff', builtin.buffers,
        { desc = '[ ] Find existing buffers' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
