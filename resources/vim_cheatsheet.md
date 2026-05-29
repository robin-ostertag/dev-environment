# Vim Cheatsheet

> **Tip:** To practice inside the editor, run `:Tutor` in NeoVim or `vimtutor` in your system terminal for classic Vim.

## Enter Insert Mode

*(Uppercase alternatives usually perform the action at the absolute start/end of a line or text block)*

* `i` – Insert **before** (left of) the cursor (`I`: insert at the first non-blank character of the line)
* `a` – Append **after** (right of) the cursor (`A`: append at the end of the line)
* `o` – Open a new line **below** the current line (`O`: open a new line **above**)

## Exit Insert Mode / Return to Normal Mode

* `<Esc>` or `Ctrl + c` or `Ctrl + [`

## File Operations (Command-Line Mode)

* `:w` – Save (write) the current file
* `:q` – Quit (fails if there are unsaved changes)
* `:q!` – Quit and **discard** unsaved changes
* `:wq` or `:x` – Save and quit
* `ZZ` – Save and quit (faster shortcut, no `:` required)
* `ZQ` – Quit without saving

## Search

* `/pattern` – Search forward for a pattern
* `?pattern` – Search backward for a pattern
* `n` – Repeat search in the **same** direction
* `N` – Repeat search in the **opposite** direction
* `*` – Search forward for the word currently under the cursor

## Navigation

### Basic Movement

* `h`, `j`, `k`, `l` – Left, Down, Up, Right (think of `j` as looking down like a hook, and `k` as "up")

### Word Movement

* `w` – Jump forward to the start of the next **w**ord
* `b` – Jump backward to the start of the previous **b**ord
* `e` – Jump forward to the **e**nd of the current/next word

### Paragraph & Screen Movement

* `}` – Jump forward one paragraph (replaces your `p` note, as `p` is for paste)
* `{` – Jump backward one paragraph
* `gg` – Go to the first line of the file
* `G` – Go to the last line of the file

## Actions (Normal Mode)

* `u` – Undo last action
* `Ctrl + r` – Redo last undone action
* `r` – Replace a **single character** under the cursor (returns to Normal mode instantly)
* `R` – Enter **Replace mode** (overwrites text until you hit `<Esc>`)
* `p` – Paste text **after** the cursor (`P`: paste **before** the cursor)
* `x` – Delete a single character under the cursor (essentially `Delete` key)

## Operators

*(Combine these with Motions or Text Objects to perform actions)*

* `d` – Delete (cuts text into the copy buffer)
* `y` – Yank (copy text into the copy buffer)
* `c` – Change (deletes text and immediately enters **Insert mode**)
* `v` – Enter Visual mode to select text blocks

## Motions & Line Navigation

* `0` – Move to the absolute beginning of the line (column 1)
* `^` – Move to the first **non-blank** character of the line
* `$` – Move to the end of the line

## Powerful Combos (Operator + Motion/Text Object)

*Vim grammar follows the rule: **[Operator] + [Number] + [Motion/Text Object]***

* `dw` – Delete from cursor to the start of the next word
* `diw` – Delete **i**nside **w**ord (deletes the word your cursor is on, regardless of cursor position)
* `ciw` – Change **i**nside **w**ord (deletes the word and puts you in Insert mode)
* `yy` – Yank (copy) the entire current line
* `dd` – Delete (cut) the entire current line
* `cc` – Change the entire current line
* `d$` or `D` – Delete from cursor to the end of the line

## Macros (Recording Mode)

*(If you accidentally trigger this, don't panic)*

* `q` – Stop recording a macro (displays `@recording` at the bottom when active)