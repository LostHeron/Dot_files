-- will go into the lua directory and call all that are in thess two files
require 'core.init_vim_config'
require 'core.keymaps'

-- LAZY PACKAGE MANAGER (INSTALLATION PICKED UP FROM KICKSTARTER)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- NeoTree
	require 'plugins.neotree',
	require 'plugins.colortheme',
	require 'plugins.bufferline',
	require 'plugins.lualine',
	require 'plugins.treesitter',
	require 'plugins.telescope',
	require 'plugins.lsp',
	require 'plugins.autocompletion',
	require 'plugins.header42',
	require 'plugins.norminette42'
})
