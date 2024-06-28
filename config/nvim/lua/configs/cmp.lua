local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local opts = require "nvchad.configs.cmp"
local format = opts.formatting.format

opts.sources = {
  { name = "nvim_lsp" },
  { name = "supermaven" },
  { name = "path" },
  { name = "buffer" },
  { name = "luasnip" },
  { name = "nvim_lua" },
  { name = "crates" },
}

opts.formatting = {
  format = function(a, b)
    local item = format(a, b)
    return item
  end,
}

cmp.setup(opts)
