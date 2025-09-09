local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "yamlls",
  "jsonls",
  "terraformls",
  "gopls",
  "dockerls",
  "eslint",
  "sqlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- ruby lsp configuration
lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruby-lsp" },
  mason = false,
  filetypes = { "ruby", "eruby" },
  root_dir = util.root_pattern("Gemfile", ".git"),
  init_options = {
    formatter = "standard",
    linters = { "standard" },
  },
}

-- biome lsp configuration for formatting
lspconfig.biome.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "biome", "lsp-proxy" },
  root_dir = util.root_pattern("biome.json", "biome.jsonc"),
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
    "css",
  },
}

-- deno lsp configuration
lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

-- tailwindcss lsp configuration
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_dir = util.root_pattern(".git", "tailwind.config.ts"),
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

-- php lsp configuration
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php", "blade" },
  settings = {
    intelephense = {
      files = {
        associations = { "*.php", "*.blade.php" },
        maxSize = 5000000,
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

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  signs = true,
}

-- update gutter signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.o.updatetime = 250
-- open floating windown for diagnostics
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
