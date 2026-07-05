return {
  -- 1. Mini Icons
  {
    'echasnovski/mini.icons',
    version = false,
    config = function()
      local mini_icons = require('mini.icons')
      mini_icons.setup({})
      mini_icons.mock_nvim_web_devicons()
    end,
  },

  -- 2. Mini Statusline
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      require('mini.statusline').setup({
        content = {
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode({ truncate_width = 120 })
            local git           = MiniStatusline.section_git({ truncate_width = 40 })
            local diff          = MiniStatusline.section_diff({ truncate_width = 75 })
            local diagnostics   = MiniStatusline.section_diagnostics({ truncate_width = 75 })
            local lsp           = MiniStatusline.section_lsp({ truncate_width = 75 })
            local filename      = MiniStatusline.section_filename({ truncate_width = 140 })
            local fileinfo      = MiniStatusline.section_fileinfo({ truncate_width = 120 })
            local location      = MiniStatusline.section_location({ truncate_width = 75 })

            local pwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
            local pwd_section = string.format('[PWD: %s]', pwd)

            return MiniStatusline.combine_groups({
              { hl = mode_hl,                 strings = { mode } },
              { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics } },
              '%<',
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=',
              { hl = 'MiniStatuslineDevinfo',  strings = { lsp } },
              { hl = 'MiniStatuslineFileinfo', strings = { pwd_section, fileinfo } },
              { hl = mode_hl,                 strings = { location } },
            })
          end,
        },
      })
    end,
  },

  -- 3. Mini Pairs
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup({})
    end,
  },

  -- 4. Mini Completion
  {
    'echasnovski/mini.completion',
    version = false,
    config = function()
      require('mini.completion').setup({})
    end,
  },
}
