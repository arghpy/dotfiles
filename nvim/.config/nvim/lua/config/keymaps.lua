-- remove search highlighting when pressing <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--  Look through the next and previous quickfix list
vim.keymap.set('n', '<C-n>', ':cnext<CR>', { desc = 'QuickFix next' })
vim.keymap.set('n', '<C-p>', ':cprev<CR>', { desc = 'QuickFix previous' })

-- Execute lua
vim.keymap.set('n', '<leader><leader>x', ':source %<CR>', { desc = 'Source current lua buffer' })
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Execute current lua line' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Execute selected lua lines' })

-- LSP stuff
vim.keymap.set('i', '<CR>', function() return vim.fn.pumvisible() == 1 and '<C-Y>' or '<CR>' end, { expr = true, desc = 'Accept item in suggestion list' })
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>ih', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = '[I]nlay [H]int toggle' })

-- Center on page up/down
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
