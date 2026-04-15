vim.pack.add({
  "https://github.com/echaya/neowiki.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

vim.keymap.set("n", "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>",          { desc = "Open Wiki" })
vim.keymap.set("n", "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", { desc = "Open Wiki in Floating Window" })
vim.keymap.set("n", "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>",  { desc = "Open Wiki in Tab" })

require('neowiki').setup({
  wiki_dirs = {
    { name = "Personal Notes",         path = "~/notes-personal" },
    { name = "Notes",                  path = "~/notes" },
  },
})
require('render-markdown').setup({
  sign = {
    enabled = false,
  },
  heading = {
    -- Width of the heading background.
    -- | block | width of the heading text |
    -- | full  | full width of the window  |
    -- Can also be a list of the above values evaluated by `clamp(value, context.level)`.
    width = "full",
  },
  code = {
    width = "block",
    disable_background = true,
    highlight_border = false,
  },
  bullet = {
    enabled = false,
  },
  checkbox = {
    enabled = false,
  },
})
