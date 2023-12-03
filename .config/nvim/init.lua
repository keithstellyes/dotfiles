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
	{"nvim-treesitter/nvim-treesitter"},
	{"nvim-telescope/telescope.nvim", dependencies = { 'nvim-lua/plenary.nvim' }},
	--{"fynnfluegge/monet.nvim", name = "monet", lazy=false},
	{"folke/tokyonight.nvim", lazy=false, priority=1000}
}
require("lazy").setup(plugins, opts);
--require("monet").setup({
--    transparent_background = false,
--    semantic_tokens = true,
--    highlight_overrides= {},
--    color_overrides = {},
--    styles = {},
--})

--vim.cmd[[colorscheme monet]]
vim.cmd[[colorscheme tokyonight-moon]]
