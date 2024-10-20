-- Theme for neovim
return {
  'catppuccin/nvim',
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'catppuccin'
  end,
}
