local lsp = require('lsp-zero').preset({})

-- Setting diagnostic
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.diagnostic.config({
    virtual_text = false
})


lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = {
    -- `Alt + Enter` key to confirm completion
    ['<M-CR>'] = cmp.mapping.confirm({select = false}),

    -- Selection window Up/Down
    ['<M-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<M-j>'] = cmp.mapping.select_next_item(cmp_select_opts)
  },

  manage_nvim_cmp = {
      documentation_window = true,
      configure_diagnostics = true
  },

  window = {
      -- Make the menus to be bordered
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
  },

  formatting = {
      format = function(entry, vim_item)
          vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
          return vim_item
      end
  },

  view = {
    entries = {
        name = 'custom',
    }
  }
})

vim.diagnostic.config {
    float = true
}
