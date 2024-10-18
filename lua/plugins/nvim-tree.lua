-- plugins/nvim-tree.lua

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Optional, προσθέτει εικονίδια
    },
    config = function()
      require("nvim-tree").setup({
        -- Βασικές ρυθμίσεις
        auto_reload_on_write = true,
        disable_netrw = true, -- Απενεργοποιεί το default file manager
        hijack_netrw = true,
        update_cwd = true,
        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = false,
        },
        git = {
          enable = true,
          ignore = false,
        },
        -- Προσθήκη νεότερων ρυθμίσεων
        actions = {
          open_file = {
            quit_on_open = true, -- Κλείσιμο του NvimTree μετά το άνοιγμα αρχείου
          },
        },
      })
    end,
  }
  