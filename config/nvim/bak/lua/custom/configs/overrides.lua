local M = {}

M.treesitter = {
  ensure_installed = {
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
    "dockerfile-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "graphql-language-service-cli",
    "yaml-language-server",
    "json-lsp",
    "terraform-ls",
    "gopls",
    "goimports",
    "rust-analyzer",
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
