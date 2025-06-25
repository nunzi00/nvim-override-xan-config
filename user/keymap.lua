-- General
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set('n','ne',"<esc><cmd>enew<cr>")
vim.keymap.set("n", "<C-q>", "<cmd>qa!<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>")
vim.keymap.set("n", "|", "<cmd>vs<cr>")


vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)


vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ta", function()
  vim.cmd "!docker exec gf_back sh -c 'APP_ENV=test php vendor/bin/phpunit'"
end)

vim.keymap.set("n", "<leader>ct", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml %s'", file)
  vim.notify(command)
  vim.cmd(command)
end)
vim.keymap.set("n", "<leader>ta", function()
  vim.cmd "!docker exec gf_back sh -c 'APP_ENV=test php vendor/bin/phpunit'"
end)

vim.keymap.set("n", "<leader>ct", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml %s'", file)
  vim.notify(command)
  vim.cmd(command)
end)
vim.keymap.set("n", "<leader>psa", function()
  local file = vim.fn.expand "%"
  local command = string.format("!docker exec gf_back sh -c 'php vendor/bin/psalm -c psalm.xml'", file)
  vim.notify(command)
  vim.cmd(command)
end)

-- Plugins
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>lr", function()
  require "inc_rename"
  return ":IncRename " .. vim.fn.expand "<cword>"
end)
