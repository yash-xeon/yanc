-- ~/.config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("lazy_file_event", { clear = true }),
  callback = function(event)
    vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile", data = event })
    return true -- only trigger once
  end,
})
