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
    vim.cmd('highlight GitSignsAdd guifg=Green')
    vim.cmd('highlight GitSignsChange guifg=Yellow')
    vim.cmd('highlight GitSignsDelete guifg=Red')
  end
}
