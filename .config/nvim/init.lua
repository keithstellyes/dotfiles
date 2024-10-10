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
-- trim whitespace on save
-- https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})
vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[set ts=4 sw=4]]
vim.cmd[[set expandtab]]
