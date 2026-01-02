return {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    keys = {
      {
        mode = "x",
        "<leader>aa",
        function()
          require("align").align_to_string({
            preview = true,
            regex = true,
          })
        end,
        desc = "Align to string",
      },
    },
  }
