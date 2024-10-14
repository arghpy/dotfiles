vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  desc = "Run shfmt agains current buffer on save",
  group = vim.api.nvim_create_augroup("Bash Autoformat", { clear = true }),
  callback = function()
    -- %!<cmd> is used to overwrite the whole buffer
    -- because shfmt just writes to stdout
    vim.cmd("silent %!shfmt --indent 2 -sr -ci -")
  end
})
