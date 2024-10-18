-- config/lazy.lua

-- Ρύθμιση του Lazy.nvim για τη φόρτωση των plugins από το φάκελο plugins
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

-- Φόρτωση των plugins από τον φάκελο plugins
require("lazy").setup("plugins")
