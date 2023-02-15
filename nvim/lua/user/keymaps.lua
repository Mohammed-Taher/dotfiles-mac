vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true})

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')

-- Paste replace visual selection without copying it.
vim.keymap.set('v', 'p', '"_dP')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Open the current file in the default program (on Mac this should just be just `open`).
vim.keymap.set('n', '<Leader>x', ':!open %<CR><CR>')

vim.keymap.set('n', '<Leader>n', ':NvimTreeFindFileToggle<Cr>')
