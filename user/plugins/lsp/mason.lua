local servers = {
  "bashls",
  "dockerls",
  "eslint",
  "html",
  "intelephense",
  "jsonls",
  "lua_ls",
  "phpactor",
  "sqlls",
  "ts_ls",
  "vimls",
  "volar",
  "yamlls"
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)


end
lspconfig.intelephense.setup({
  settings = {
    intelephense = {
      files = {
          maxSize = 5000000;
          exclude = {
            "**/.git/**",
            "**/.svn/**",
            "**/.hg/**",
            "**/CVS/**",
            "**/.DS_Store/**",
            "**/node_modules/**",
            "**/bower_components/**",
            "**/vendor/**/{Tests,tests}/**",
            "**/.history/**",
            "**/vendor/**/vendor/**",
            "**/var/**",
            "**/apps/Admin/var/**",
            "**/apps/Api/var/**",
            "**/apps/Customer/var/**",
            "**/apps/Broker/var/**",
        }
      };
    };
  },
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
})
