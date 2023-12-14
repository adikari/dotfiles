local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local opts = require "plugins.configs.cmp"

opts.sources = {
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "crates" },
}

cmp.setup(opts)
