local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

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
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

-- ruby lsp configuration
vim.lsp.config("solargraph", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "ruby-lsp" },
  mason = false,
  filetypes = { "ruby", "eruby" },
  root_dir = vim.fs.root(0, { "Gemfile", ".git" }),
  init_options = {
    formatter = "standard",
    linters = { "standard" },
  },
})
vim.lsp.enable "solargraph"

-- biome lsp configuration for formatting
vim.lsp.config("biome", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "biome", "lsp-proxy" },
  root_dir = vim.fs.root(0, { "biome.json", "biome.jsonc" }),
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
})
vim.lsp.enable "biome"

-- deno lsp configuration
vim.lsp.config("denols", {
  on_attach = on_attach,
  root_dir = vim.fs.root(0, { "deno.json", "deno.jsonc" }),
})
vim.lsp.enable "denols"

-- tailwindcss lsp configuration
vim.lsp.config("tailwindcss", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_dir = vim.fs.root(0, { ".git", "tailwind.config.ts" }),
})
vim.lsp.enable "tailwindcss"

-- graphql lsp configuration
vim.lsp.config("graphql", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "gql", "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_dir = vim.fs.root(0, { ".git", ".graphqlrc*", ".graphql.config.*", "graphql.config.*" }),
})
vim.lsp.enable "graphql"

-- go lsp configuration
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
vim.lsp.enable "gopls"

-- php lsp configuration
vim.lsp.config("intelephense", {
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
})
vim.lsp.enable "intelephense"

-- lua lsp configuration
vim.lsp.config("lua_ls", {
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
})
vim.lsp.enable "lua_ls"

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
