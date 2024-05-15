-- NOTE: This option is not needed anymore as we use
-- oil.nvim as file manager
-- Go back from file to netrw
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- greatest remap ever idk??
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- copies to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- remove search highlighting when pressing <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Open terminal as a split below
vim.keymap.set('n', '<leader>t', ':split | terminal<CR>a', { desc = 'Open terminal as a split below' })

-- Bind <ESC> in terminal mode do C-\_C-N
vim.keymap.set('t', '<ESC>', '<C-\\><C-N>', { desc = 'Exit from terminal mode' })

-- xdg-open under cursor (dilimited by space)
vim.keymap.set('n', '<leader>o', function()
    if vim.fn.executable("xdg-open") == 1 then
        local word = vim.fn.expand("<cWORD>")
        return { "xdg-open", word }
    else
        return nil, "no handler found"
    end
end
    , { desc = 'xdg-open word under cursor' })

