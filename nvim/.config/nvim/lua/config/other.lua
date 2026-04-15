local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No unused plugins.")
    return
  end

  local choice = vim.fn.confirm("Delete unused plugins?", "&y\n&n", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end


vim.keymap.set("n", "<leader>cc", pack_clean, { desc = "Pack clean unused plugins" })
