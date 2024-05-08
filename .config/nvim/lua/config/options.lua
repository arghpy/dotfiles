-- Numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Make tab 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
--
-- Searching in file
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 10

-- Update time / not sure about this
vim.opt.updatetime = 100

-- Color scheme
vim.opt.termguicolors = true

-- Extend path
vim.opt.path = '.,/usr/include,/usr/avr/include'

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Set split to open below
vim.opt.splitbelow = true
