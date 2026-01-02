return {
  "echaya/neowiki.nvim",
  opts = {
    wiki_dirs = {
      { name = "Notes", path = "~/notes" },
    },
  },
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },
  keys = {
    { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
  },
}
