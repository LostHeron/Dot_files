-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Desable the spacebar key's default behaviour
vim.keymap.set({ 'n', 'v'}, '<Space>', '<Nop>', {silent = true})

-- for conciseness
local opts = { noremap = true, silent = true }

-- allow to save file using <C-s>
-- vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save a file without auto-formating
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- change <x> behaviour to not paste the content of the what was deleted to the yank register
-- vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center :
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Vertical scroll and center :
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- clear last searched pattern when pressing escape:
vim.keymap.set('n', '<Esc>', '<Esc><cmd>let @/ = ""<CR>', opts)

-- resize screen using arrows :
vim.keymap.set('n', '<Up>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<Right>', '<cmd>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Left>', '<cmd>vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Leader>se', '<C-w>=', opts)

-- navigating tabs with leader key :
vim.keymap.set('n', '<Leader>tn', '<cmd>tabn<CR>', opts)
vim.keymap.set('n', '<Leader>tp', '<cmd>tabp<CR>', opts)

-- allow indenting without leave visual mod :
-- ah ouai c'est vraiment nice ça punaise !
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

-- prevent pasting when copying something over something in visula mode 
vim.keymap.set('v', 'p', '"_dgvP', opts)

-- to switch between tab
vim.keymap.set('n', '<leader><tab>', '<cmd>bn<CR>', opts)
vim.keymap.set('n', '<leader><s-tab>', '<cmd>bp<CR>', opts)
-- test to not be yank
-- test to not be yank

