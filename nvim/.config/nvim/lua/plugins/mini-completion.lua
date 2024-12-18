return {
  "echasnovski/mini.completion",
  version = false,
  config = function ()
    require("mini.completion").setup({
      lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = false
      }
    })
    -- `<Tab>` and `<S-Tab>` for navigation through completion list
    vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { desc = "Next completion item", expr = true })
    vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { desc = "Previous completion item", expr = true })

    -- more consistent behavior of `<CR>` (Enter key)
    local keycode = vim.keycode or function(x)
      return vim.api.nvim_replace_termcodes(x, true, true, true)
    end
    local keys = {
      ['cr']        = keycode('<CR>'),
      ['ctrl-y']    = keycode('<C-y>'),
      ['ctrl-y_cr'] = keycode('<C-y><CR>'),
    }

    _G.cr_action = function()
      if vim.fn.pumvisible() ~= 0 then
        -- If popup is visible, confirm selected item or add new line otherwise
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
      else
        -- If popup is not visible, use plain `<CR>`. You might want to customize
        -- according to other plugins. For example, to use 'mini.pairs', replace
        -- next line with `return require('mini.pairs').cr()`
        return keys['cr']
      end
    end

    vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
  end
}