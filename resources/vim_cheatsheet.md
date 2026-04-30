# Vim Cheatsheet

TODO: `:Tutor` (only neovim)

## Enter Insert Mode
*(Uppercase letter alternative: `SHIFT + lowercase letter`)*

- `i` – Start editing left from cursor (`I`: start of line)
- `a` – Enter insert mode right of cursor (`A`: end of line)
- `o`: Enter insert mode in new line (`O`: in line above)

## Exit Insert Mode

- `<Esc>` – Enter Normal mode  

## Save the Current Buffer (File)

- `:w`

## Quit Vim

- `:q`

## Save and Quit

- `ZZ` – (or `Shift + Z + Z`, same thing)  
- `:wq`

## Exit Recording Mode  
*(Displays `@recording` at the bottom when accidentally entered)*

- `q`

## Search

- `/`
- n: next result
- shift+n: prev result

## Navigation

- h, j , k, l (LDUR = left down up right) instead of arrow keys 
- w: word (`b`: word back)
- p: paragraph


## Actions

- `u`: undo
- `p`: paste after cursor (`P`: before cursor)
- `r`: replace
- `CTRL+r`: redo

## Operators

- d: delete
- y: yank (copy)
- c: change (delete + enter insert mode)

## Motions

Most things are cursor relative.

- `$`: end of line
- `^`: start of line (start of text of line)
- `0`: start of line

## Examples

- `ciw`: change inner word
