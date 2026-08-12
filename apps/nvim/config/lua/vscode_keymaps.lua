local m = {}

function m.setup()
  local vscode = require("vscode")

  -- Clear highlights on search when pressing <Esc> in normal mode :help hlsearch
  vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selection down" })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })


  vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
  vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })

  vim.keymap.set("n", "J", "mzJ`z", { desc = "join next line to current line w/o losing cursor position" })

  -- delete into void, than paste (default: deleted text gets written into register)
  vim.keymap.set("x", "<leader>p", '"_dP') -- read like this: "register into _void PPaste before cursor
  vim.keymap.set("n", "<leader>d", '"_d')  -- delete into void register
  vim.keymap.set("v", "<leader>d", '"_d')  -- delete into void register

  local substitute_word_under_cusor = [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]
  vim.keymap.set("n", "<leader>st", substitute_word_under_cusor, { desc = "rename/substitute for word under cursor" })

  local function search_and_center(keys)
    vim.cmd("normal! " .. keys)
    local curline = vim.fn.line(".")
    vscode.call("revealLine", { args = { lineNumber = curline, at = "center" } })
  end
  vim.keymap.set("n", "n", function() search_and_center("n") end, { desc = "Move next while keeping cursor centered" })
  vim.keymap.set("n", "N", function() search_and_center("N") end, { desc = "Move prev while keeping cursor centered" })
end

return m
