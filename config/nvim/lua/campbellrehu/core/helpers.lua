local helpers = {}

function helpers.generateKeymap(mode, keymap, command, opts)
  local options = {}
  if type(opts) ~= "table" then
    options.desc = opts
  else
    options = opts
  end
	vim.keymap.set(mode, keymap, command, options)
end

return helpers
