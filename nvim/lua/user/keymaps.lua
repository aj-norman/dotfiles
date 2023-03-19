-- Space is my leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k', { expr = true }")
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j', { expr = true }")

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
vim.keymap.set('v', 'y', 'myy`y')

-- disable vim command line tool/history when trying to quit
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '_dP')

-- Easy insertion of a trailing ";" or "," from insert mode
vim.keymap.set('i', ';;', '<Esc>A;')
vim.keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting
vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (xdg-open is linux, open is mac)
vim.keymap.set('n', '<Leader>x', ':!open %<CR><CR>')

-- Move lines up or down
vim.keymap.set('i', '<A-j>', ':move .+1<CR>==gi')
vim.keymap.set('i', '<A-Down>', ':move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', ':move .-2<CR>==gi')
vim.keymap.set('i', '<A-Up>', ':move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-Down>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('n', '<A-Up>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv==gv")
vim.keymap.set('v', '<A-Down>', ":move '>+1<CR>gv==gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv==gv")
vim.keymap.set('v', '<A-Up>', ":move '<-2<CR>gv==gv")

-- Bind "gcc" for commenting with tpope's plugin
-- vim.keymap.set('n', '<C-/>', 'gcc')
-- vim.keymap.set('v', '<C-/>', 'gcc')
-- vim.keymap.set('i', '<C-/>', 'gcc')
-- vim.keymap.set('n', '<D-/>', 'gcc') -- mac "Command" binding
-- vim.keymap.set('v', '<D-/>', 'gcc') -- mac "Command" binding
-- vim.keymap.set('i', '<D-/>', 'gcc') -- mac "Command" binding
