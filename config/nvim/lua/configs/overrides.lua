local M = {}

M.treesitter = {
  ensure_installed = {
    "ruby",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "graphql",
    "go",
    "rust",
    "sql",
    "markdown",
    "terraform",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "eslint_d",
    "eslint-lsp",
    "biome",
    "dockerfile-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "graphql-language-service-cli",
    "yaml-language-server",
    "json-lsp",
    "terraform-ls",
    "gopls",
    "sqlls",
    "goimports",
    "rust-analyzer",
    "ruby-lsp",
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
