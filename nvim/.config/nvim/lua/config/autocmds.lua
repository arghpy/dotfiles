-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('Yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open opening a new file README.md, copy the skeleton into it
vim.api.nvim_create_autocmd('BufNewFile', {
  desc = 'README.md skeleton file apply',
  group = vim.api.nvim_create_augroup('README.md new file', { clear = true }),
  pattern = "README.md",
  command = "0r ~/.config/nvim/skeletons/README-skeleton.md",
})

-- Open opening a new file bash.sh, copy the skeleton into it
vim.api.nvim_create_autocmd('BufNewFile', {
  desc = 'bash.sh skeleton file apply',
  group = vim.api.nvim_create_augroup('bash.sh new file', { clear = true }),
  pattern = "bash.sh",
  command = "0r ~/.config/nvim/skeletons/bash-skeleton.sh",
})

-- Setting diagnostic
vim.api.nvim_create_autocmd("CursorHold", {
  desc = "Show diagnostic when holding cursor on line",
  group = vim.api.nvim_create_augroup('Diagnostic', { clear = true }),
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'line',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
