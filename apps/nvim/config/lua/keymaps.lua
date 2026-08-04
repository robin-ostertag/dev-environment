-- Clear highlights on search when pressing <Esc> in normal mode :help hlsearch
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual selectoin down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual selection up" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Move next while keeping cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move prev while keeping cursor centered" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up while keeping cursor centered" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down while keeping cursor centered" })

vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "join next line to current line w/o losing cursor position" })

vim.keymap.set("n", "<leader>y", '"+y', { desc = "yank motion into system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "yank visual into system clipboard" })

vim.keymap.set("n", "<leader>dc", ":compiler dotnet<CR>:make<CR>:copen<CR>", {
  desc = "dotnet compile and populate quickfixlist",
  silent = true,
})

-- Diagnostic keymaps TODO: test if these work. should open a window with errors for ez navigation
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic location list" })
vim.keymap.set("n", "<leader>co", ":copen<CR>", { desc = "copen open quickfix list" })

-- TODO: switching tabs using hjkl as directional keys (hold down ctrl)
-- Keybinds to make split navigation easier.
-- See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- TODO: For Later

-- delete into void, than paste (default: deleted text gets written into register)
vim.keymap.set("x", "<leader>p", '"_dP') -- read like this: "register into _void PPaste before cursor
vim.keymap.set("n", "<leader>d", '"_d') -- delete into void register
vim.keymap.set("v", "<leader>d", '"_d') -- delete into void register

local substitute_word_under_cusor = [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]
vim.keymap.set("n", "<leader>st", substitute_word_under_cusor, { desc = "rename/substitute for word under cursor" })

-- * (Asterisk): This is a built-in Vim command. It looks at the word under your cursor, searches forward for it, and highlights all matches. Crucially, it saves that word into Vim's internal "search register".
-- :: Opens the command-line at the bottom of the screen.
-- %s: Starts a global substitution (search and replace) across the entire (%) file.
-- ///: The standard syntax is :%s/search/replace/. However, if you leave the search area empty, Vim automatically uses the last thing you searched for. Because you just pressed *, Vim secretly fills in the word under your cursor.
-- g: The "global" flag, meaning it changes every occurrence on a line, not just the first one.
-- <Left><Left>: Simulates pressing the Left arrow key twice. This moves your blinking cursor backward, landing it right between the two slashes: :%s//|/g.
vim.keymap.set("n", "<leader><F2>", "*:%s///g<left><left>", { desc = "rename/substitute current word" })

-- "hy: * "h tells Vim to use a specific clipboard slot (the h register).
-- y yanks (copies) your highlighted visual selection into that h slot.
-- :: Opens the command line.
-- %s/: Starts the global search and replace command.
-- <C-r>h: In Vim's command line, pressing Ctrl + r followed by a register name pastes the contents of that register. This literally dumps whatever text you highlighted directly into the search field.
vim.keymap.set("x", "<leader><F2>", '"hy:%s/<C-r>h//g<left><left>', { desc = "rename/substitute visual selection" })

local function copy_filepath_to_clipboard()
  local filepath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filepath)
  print("filepath copied to clipboard:" .. filepath)
end
vim.keymap.set("n", "<leader>fp", copy_filepath_to_clipboard, { desc = "copy filepath to clipboard" })
