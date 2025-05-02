-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FocusLost", "TextChanged" }, {
  pattern = "*",
  group = vim.api.nvim_create_augroup("wall_on_edit", { clear = true }),
  command = "wall",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("filetype_scala", { clear = true }),
  pattern = { "scala", "sbt", "yaml", "yml" },
  callback = function()
    vim.b.autoformat = false
  end,
})
