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

-- floating terminal
vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal(nil, { auto_insert = false, win = { keys = { term_normal = false } } })
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<c-m-/>", function()
  Snacks.terminal(
    nil,
    { cwd = LazyVim.root(), auto_insert = false, start_insert = true, win = { keys = { term_normal = false } } }
  )
end, { desc = "Terminal (Root Dir)" })

-- dedicated Copilot CLI terminal (right split, Esc passes through to copilot process)
vim.keymap.set("n", "<leader>ac", function()
  Snacks.terminal("copilot", {
    id = "copilot",
    win = {
      type = "split",
      position = "right",
      width = 0.4,
      keys = {
        -- disable default <Esc> → normal-mode mapping so Esc reaches the copilot process
        -- use <C-\><C-n> to enter normal mode for scrolling, then i/a to resume
        term_normal = false,
      },
    },
  })
end, { desc = "Copilot CLI Terminal" })
