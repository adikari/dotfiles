local function set_filetype_autocmd(path, filetype)
  local cmd = string.format("autocmd BufNewFile,BufRead %s set filetype=%s", path, filetype)
  vim.api.nvim_exec2(cmd, { output = false })
end

set_filetype_autocmd("~/note", "markdown")
