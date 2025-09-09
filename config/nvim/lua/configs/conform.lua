local conform = require "conform"
local util = require "nvchad.utils"

local function biome_lsp_or_prettier()
  local has_prettier = vim.fs.find({
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
    eruby = { "htmlbeautifier" },
    ruby = { "rubocop" },
    php = { "pint" },
    cpp = { "clang_format" },
    c = { "clang_format" },
    ["_"] = { "trim_whitespace" },
  },
  formatters = {
    biome = {
      command = "biome",
      args = { "check", "--write", "--unsafe", "$FILENAME" },
      stdin = false,
    },
    pint = {
      command = "pint",
      args = { "$FILENAME" },
      stdin = false,
    },
  },
  format_on_save = function(bufnr)
    local ignore_filetypes = { "txt" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end

    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    local ignore_paths = { "/node_modules/", "/.sst/", "/.next/" }
    local isIgnoredPath = vim.tbl_contains(ignore_paths, function(path)
      return vim.api.nvim_buf_get_name(bufnr):match(path)
    end)

    if isIgnoredPath then
      return
    end

    return { timeout_ms = 2000, lsp_format = "fallback" }
  end,
}

conform.setup(options)
