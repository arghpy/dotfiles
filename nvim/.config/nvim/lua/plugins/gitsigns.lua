return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '+' },
        change       = { text = 'o' },
        delete       = { text = '>' },
        topdelete    = { text = '>' },
        changedelete = { text = '>' },
      },
      signs_staged = {
        add          = { text = '+' },
        change       = { text = 'o' },
        delete       = { text = '>' },
        topdelete    = { text = '>' },
        changedelete = { text = '>' },
      },
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    }
    -- Actions
    vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<CR>', { desc = 'Git [H]unk [N]ext' })
    vim.keymap.set('n', '<leader>hp', ':Gitsigns prev_hunk<CR>', { desc = 'Git [H]unk [P]rev' })
    vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Git [H]unk [S]tage' })
    vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Git [H]unk [R]eset' })
    vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>', { desc = 'Git [H]unk [U]ndo' })
    vim.keymap.set('n', '<leader>hp', ':Gitsigns preview_hunk<CR>', { desc = 'Git [H]unk [P]review' })
    vim.keymap.set('n', '<leader>hl', ':Gitsigns setqflist<CR>', { desc = 'Git [H]unk Quickfix [L]ist' })
    vim.keymap.set('n', '<leader>bs', ':Gitsigns stage_buffer<CR>', { desc = 'Git [B]uffer [S]tage' })
    vim.keymap.set('n', '<leader>br', ':Gitsigns reset_buffer<CR>', { desc = 'Git [B]uffer [R]eset' })
    vim.keymap.set('n', '<leader>lb', ':Gitsigns blame_line<CR>', { desc = 'Git [L]ine [B]lame' })
    vim.keymap.set('n', '<leader>dt', ':Gitsigns diffthis<CR>', { desc = 'Git [D]iff [T]his' })

    vim.cmd('highlight GitSignsAdd guifg=Green')
    vim.cmd('highlight GitSignsChange guifg=Yellow')
    vim.cmd('highlight GitSignsDelete guifg=Red')
  end
}
