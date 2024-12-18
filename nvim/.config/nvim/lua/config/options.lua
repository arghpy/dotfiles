-- Numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Make tab 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
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
local path = '.,/usr/include,/usr/avr/include,' .. '**'
vim.opt.path = path

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Set split to open below
vim.opt.splitbelow = true

-- Set vsplit to open below
vim.opt.splitright = true

-- Capture all clipboards
vim.opt.clipboard = "unnamedplus"
