-- plugins/theme.lua

return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Για να φορτώσει πρώτο
    config = function()
      vim.cmd("colorscheme onedark") -- Ορισμός του θέματος
    end
  }