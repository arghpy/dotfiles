vim.pack.add({
  {
  src = "https://github.com/nvim-treesitter/nvim-treesitter",
  version = "master"
  },
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})
vim.cmd(":TSUpdate")
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "bash",
    "python",
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
