local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "yamlls", "jsonls", "terraformls", "gopls", "dockerls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- tailwindcss lsp configuration
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_dir = util.root_pattern ".git",
}

-- typescript lsp configuration
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = { hostInfo = "neovim" },
  root_dir = util.root_pattern ".git",
  single_file_support = false,
  commands = {
    TSToolsOrganizeImports = {
      function()
        vim.lsp.buf.execute_command {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
      end,
      description = "Organize Imports",
    },
  },
}

-- graphql lsp configuration
lspconfig.graphql.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "gql", "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = util.root_pattern(".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*"),
}

-- go lsp configuration
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- lua lsp configuration
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "hs" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

-- disable inline diagnostic and display floating window on cursor hold
vim.diagnostic.config {
  virtual_text = false,
  underline = true,
  signs = true,
}

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
