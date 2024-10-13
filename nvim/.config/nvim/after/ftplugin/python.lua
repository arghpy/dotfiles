-- Make tab 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- vim.api.nvim_create_autocmd({'BufWritePre'}, {
--     callback = function()
--         -- %!<cmd> is used to overwrite the whole buffer
--         -- because shfmt just writes to stdout
--         vim.cmd("silent %!shfmt --indent 2 -sr -ci %")
--     end
-- })
