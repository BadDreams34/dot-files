return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    -- Add your keybindings here
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Neo-tree Toggle" },
    },
  }
}
