vim.api.nvim_create_autocmd({'BufWritePre'}, {
    callback = function()
        -- %!<cmd> is used to overwrite the whole buffer
        -- because shfmt just writes to stdout
        vim.cmd("silent %!shfmt --indent 2 -sr -ci %")
    end
})
