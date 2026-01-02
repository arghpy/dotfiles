return {
  "echaya/neowiki.nvim",
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },
  keys = {
    { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
    { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
    { "<leader>wT", "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = "Open Wiki in Tab" },
  },
  config = function()
    require('neowiki').setup({
      wiki_dirs = {
        { name = "Notes", path = "~/notes" },
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
        width = "block",
      },
      code = {
        width = "block",
      },
    })
  end
}
