-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open opening a new file README.md, copy the skeleton into it
vim.api.nvim_create_autocmd('BufNewFile', {
    desc = 'README.md skeleton file apply',
    pattern = "README.md",
    command = "0r ~/.config/nvim/skeletons/README-skeleton.md",
})

-- Open opening a new file bash.sh, copy the skeleton into it
vim.api.nvim_create_autocmd('BufNewFile', {
    desc = 'bash.sh skeleton file apply',
    pattern = "bash.sh",
    command = "0r ~/.config/nvim/skeletons/bash-skeleton.sh",
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
