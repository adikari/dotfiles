-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
return {
  ui = {
    statusline = {
      theme = "vscode_colored",
    },
    cmp = {
      format_colors = {
        tailwind = true,
      },
    },
    telescope = { style = "bordered" },
  },
  base46 = {
    theme = "catppuccin",
    theme_toggle = { "catppuccin", "gruvbox" },
    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
    },
    hl_add = {
      NvimTreeOpenedFolderName = { fg = "green", bold = true },
    },
  },
}
