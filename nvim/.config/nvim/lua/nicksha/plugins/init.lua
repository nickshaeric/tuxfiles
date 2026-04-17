-- nicksha@lazy

-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("nicksha.plugins.harpoon"),
  require("nicksha.plugins.nord"),
  require("nicksha.plugins.oil"),
  require("nicksha.plugins.tmuxnavigator"),
  require("nicksha.plugins.treesitter"),
  require("nicksha.plugins.typstpreview"),
  require("nicksha.plugins.vimtex"),

}, {

  defaults = {
    lazy = false,
  },

  rocks = {
    enabled = false,
  },
})
