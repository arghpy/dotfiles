return {
  'echasnovski/mini.statusline',
  version = '*',

  config = function()
    require('mini.statusline').setup({
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
          local git           = MiniStatusline.section_git({ trunc_width = 40 })
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo      = vim.bo.filetype
          -- local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location      = '%2l:%-2v'

          return MiniStatusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = 'MiniStatuslineDevinfo',  strings = { git } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl,                  strings = { location } },
          })
        end,
      }
    })
  end
}
