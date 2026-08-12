vim.g.mapleader = " "
require("options").setup()

if vim.g.vscode then
  require("vscode").notify("nvim running in vscode.", "info")
  -- add plugins here
  require("vscode_keymaps").setup()
else
  -- add plugins here
  require("keymaps").setup()
end

--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
