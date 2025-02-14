return {
  'echasnovski/mini.basics',
  version = '*',

  config = function()
    require('mini.basics').setup({
        -- Mappings. Set to `false` to disable.
        mappings = {
          -- Window navigation with <C-hjkl>, resize with <C-arrow>
          windows = true,
        },
      }
    )
  end
}
