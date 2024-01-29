vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- greatest remap ever idk??
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copies to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

