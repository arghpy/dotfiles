-- copies to system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- remove search highlighting when pressing <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--  Look through the next and previous quickfix list
vim.keymap.set('n', '<C-n>', ':cnext<CR>', { desc = 'QuickFix next' })
vim.keymap.set('n', '<C-p>', ':cprev<CR>', { desc = 'QuickFix previous' })

-- Open entry under cursor
local function get_open_cmd(path)
  if vim.fn.has("mac") == 1 then
    return { "open", path }
  elseif vim.fn.has("win32") == 1 then
    if vim.fn.executable("rundll32") == 1 then
      return { "rundll32", "url.dll,FileProtocolHandler", path }
    else
      return nil, "rundll32 not found"
    end
  elseif vim.fn.executable("explorer.exe") == 1 then
    return { "explorer.exe", path }
  elseif vim.fn.executable("xdg-open") == 1 then
    return { "xdg-open", path }
  else
    return nil, "no handler found"
  end
end

vim.keymap.set('n', 'gx',
  function()
    local path = vim.fn.expand("<cWORD>")

    if vim.ui.open then
      vim.ui.open(path)
      return
    end

    local cmd, err = get_open_cmd(path)
    if not cmd then
      vim.notify(string.format("Could not open %s: %s", path, err), vim.log.levels.ERROR)
      return
    end
    local jid = vim.fn.jobstart(cmd, { detach = true })
    assert(jid > 0, "Failed to start job")
  end,
  {
    desc = 'Open the entry under the cursor in an external program'
  }
)

--  Format current buffer
vim.keymap.set('n', '<leader>FF', function() vim.lsp.buf.format() end, { desc = 'Format current buffer' })

-- Execute lua
vim.keymap.set('n', '<leader><leader>x', ':source %<CR>', { desc = 'Source current lua buffer' })
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Execute current lua line' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Execute selected lua lines' })

-- LSP stuff
vim.keymap.set('i', '<Tab>', function() return vim.fn.pumvisible() == 1 and '<C-N>' or '<Tab>' end, { desc = 'Next item in suggestion list' })
vim.keymap.set('i', '<S-Tab>', function() return vim.fn.pumvisible() == 1 and '<C-P>' or '<S-Tab>' end, { desc = 'Previous item in suggestion list' })
vim.keymap.set('i', '<CR>', function() return vim.fn.pumvisible() == 1 and '<C-Y>' or '<CR>' end, { expr = true, desc = 'Accept item in suggestion list' })
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>ih', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = '[I]nlay [H]int toggle' })
