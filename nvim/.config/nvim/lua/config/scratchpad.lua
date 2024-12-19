local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal", -- No borders or extra UI elements
    border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
   end
end

-- Example usage:
-- Create a floating window with default dimensions
vim.api.nvim_create_user_command("Scratchpad", toggle_terminal, {})

-- Bind <ESC> in terminal mode do C-\_C-N
vim.keymap.set('t', '<ESC>', '<C-\\><C-N>', { desc = 'Exit from terminal mode' })

vim.api.nvim_create_autocmd("WinEnter", {
  group = vim.api.nvim_create_augroup("FloatWindow", { clear = true }),
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
    end
  end,
})

-- Open scratchpad terminal
vim.keymap.set('n', '<leader>t', ':Scratchpad<CR>', { desc = 'Open terminal' })
