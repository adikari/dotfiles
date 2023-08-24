-- disable netrw plugin. see :help nvim-tree-netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- open nvim tree on startup
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		require("nvim-tree.api").tree.open()
-- 	end,
-- })

local function set_filetype_autocmd(path, filetype)
  local cmd = string.format("autocmd BufNewFile,BufRead %s set filetype=%s", vim.fn.fnameescape(path), filetype)
  vim.api.nvim_exec(cmd, false)
end

set_filetype_autocmd("~/note", "markdown")
