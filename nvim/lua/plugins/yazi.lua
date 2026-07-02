return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- Pressing <leader>f will open Yazi in Neovim's current directory
    {
      "<leader>f",
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    -- Pressing <leader>cw will open Yazi in Neovim's global working directory
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi in Neovim's pwd",
    },
  },
  opts = {
    -- Instantly changes Neovim's pwd when you quit Yazi
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
