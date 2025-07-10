require 'override.user.keymap'
require 'override.user.autocommands'
require 'override.user.filetypes'
vim.opt.mouse='a'
onenord_load = function()
  vim.cmd [[colorscheme onenord]]
end

return onenord_load()
