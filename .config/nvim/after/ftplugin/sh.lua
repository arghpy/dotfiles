-- Make tab 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- vim.api.nvim_create_autocmd({'BufWritePre'}, {
--     callback = function()
--         -- %!<cmd> is used to overwrite the whole buffer
--         -- because shfmt just writes to stdout
--         vim.cmd("silent %!shfmt --indent 2 -sr -ci %")
--     end
-- })
