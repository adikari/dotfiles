local supermaven = require "supermaven-nvim"
-- supermaven is not an LSP server, so no need for lspconfig requires

supermaven.setup {

  keymaps = {
    accept_suggestion = "<C-j>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-k>",
  },

  ignore_filetypes = { cpp = true },

  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  },

  -- disables inline completion for use with cmp
  disable_inline_completion = false,

  -- disables built in keymaps for more manual control
  disable_keymaps = false,
}
