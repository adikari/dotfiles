local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local opts = require "plugins.configs.cmp"

opts.sources = {
  { name = "copilot" },
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "crates" },
}

-- https://github.com/zbirenbaum/copilot-cmp#comparators
opts.sorting = {
  priority_weight = 2,
  comparators = {
    require("copilot_cmp.comparators").prioritize,

    -- Below is the default comparitor list and order for nvim-cmp
    cmp.config.compare.offset,
    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
    cmp.config.compare.exact,
    cmp.config.compare.score,
    cmp.config.compare.recently_used,
    cmp.config.compare.locality,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
}

cmp.setup(opts)
