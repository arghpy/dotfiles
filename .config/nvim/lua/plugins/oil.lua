return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = false,
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<C-r>"] = "actions.refresh",
                ["<C-l>"] = false,
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
                ["-"] = function()
                    require("oil.actions").parent.callback()
                    vim.cmd.lcd(require("oil").get_current_dir())
                end,
                ["<CR>"] = function()
                    require("oil").select(nil, function(err)
                        if not err then
                            local curdir = require("oil").get_current_dir()
                            if curdir then
                                vim.cmd.lcd(curdir)
                            end
                        end
                    end)
                end,
            },

            view_options = {
                show_hidden = true
            }
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
