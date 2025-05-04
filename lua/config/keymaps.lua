-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<S-CR>", "<Esc>o", { noremap = true })
vim.keymap.set("i", "<C-CR>", "<Esc>O", { noremap = true })
vim.keymap.set("i", "<C-d>", '<C-o>"0dd', { noremap = true })

-- insert in visual mode without overriding default register, i.e. multi-paste
vim.keymap.set("v", "<leader>p", '"0p', { noremap = true })
vim.keymap.set("v", "<leader>d", '"0d', { noremap = true })
