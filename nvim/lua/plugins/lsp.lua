return {
  -- 1. Mason handles downloading and installing the actual servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  
  -- 2. Bridges Mason with lspconfig to automate downloading
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })
    end
  },

  -- 3. The actual LSP configurations plugin
  {
    "neovim/nvim-lspconfig",
    -- This line tells Lazy to load this plugin the moment you open any file
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Natively activate pyright using Neovim's built-in framework
      vim.lsp.enable('pyright')
    end
  },
}
