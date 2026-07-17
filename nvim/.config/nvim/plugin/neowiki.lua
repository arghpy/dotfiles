vim.pack.add({
  "https://github.com/echaya/neowiki.nvim",
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
