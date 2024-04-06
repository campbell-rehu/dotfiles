local helpers = {}

function helpers.generateKeymap(mode, keymap, command, description)
  vim.keymap.set(mode, keymap, command, { desc = description })
end

return helpers
