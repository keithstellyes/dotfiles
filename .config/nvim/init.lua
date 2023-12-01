local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{"nvim-treesitter/nvim-treesitter",
	enable=true},
	{"nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' }
	}
}
require("lazy").setup(plugins, opts);
