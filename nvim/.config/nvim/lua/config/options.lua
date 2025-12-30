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
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 10

-- Update time / not sure about this
vim.opt.updatetime = 100

-- Color scheme
vim.opt.termguicolors = true

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

-- Disable show mode because it causes flickering
vim.opt.showmode = false

-- Set wrap lines
vim.opt.wrap = true

-- Set a global status line
---- a single status line for everything
vim.opt.laststatus = 3

-- Set window bar
vim.opt.winbar = '%f'

-- Set spelling as it got smarter
vim.opt.spell = true

-- Set diagnostic style
vim.diagnostic.config({ virtual_lines = { current_line = true } })

-- Completion menu
vim.opt.completeopt = 'menu,menuone,popup,fuzzy,noinsert,noselect,preview'
