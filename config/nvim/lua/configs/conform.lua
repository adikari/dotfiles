local conform = require "conform"

local function biome_lsp_or_prettier(bufnr)
  local has_prettier = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]

  if has_prettier then
    return { "prettier" }
  end

  return { "biome" }
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = biome_lsp_or_prettier,
    typescript = biome_lsp_or_prettier,
    typescriptreact = biome_lsp_or_prettier,
    javascriptreact = biome_lsp_or_prettier,
    css = biome_lsp_or_prettier,
    html = biome_lsp_or_prettier,
    vue = biome_lsp_or_prettier,
    json = { "biome" },
    jsonc = { "biome" },
    yaml = { "biome" },
    markdown = { "biome" },
    graphql = { "biome" },
    handlebars = { "biome" },
    go = { "goimports", "gofmt" },
    rust = { "rustfmt" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    ["_"] = { "trim_whitespace" },
  },
  format_on_save = function(bufnr)
    -- Disable autoformat on certain filetypes
    local ignore_filetypes = { "txt" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end

    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    -- Disable autoformat for files in a certain path
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match "/node_modules/" then
      return
    end

    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
}

conform.setup(options)
