return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    -- Press Space + f + f to find files
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    -- Press Space + f + g to search text across your project
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
    -- Press Space + f + b to see open buffers
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    -- Press Space + f + h to search help tags
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    -- Your new project picker (mapped to Space + f + p)
    { '<leader>fp', function() require('telescope').extensions.projects() end, desc = 'Projects' },
  },
  config = function(_, opts)
    -- Initialize telescope with standard defaults
    local telescope = require("telescope")
    telescope.setup(opts)

    -- Local aliases for telescope modules needed by your script
    local ts_pickers = require("telescope.pickers")
    local ts_finders = require("telescope.finders")
    local ts_previewers = require("telescope.previewers")
    local ts_actions = require("telescope.actions")
    local ts_actions_state = require("telescope.actions.state")
    local ts_conf = require("telescope.config").values

    -- Define your custom project picker extension
    telescope.extensions = telescope.extensions or {}
    telescope.extensions.projects = function(proj_opts)
      vim.system(
        { "bash", "-c", "ls -1td ~/code/ ~/.config/nvim/" },
        { text = true },
        vim.schedule_wrap(function(res)
          local projects = vim.split(res.stdout, "\n")

          -- Neovide smooth scroll bypass
          vim.g.neovide_scroll_animation_length = 0
          vim.defer_fn(function()
            vim.g.neovide_scroll_animation_length = 0.12
          end, 100)

          proj_opts = proj_opts or {}
          ts_pickers.new(proj_opts, {
            prompt_title = "Projects",
            finder = ts_finders.new_table {
              results = projects,
            },
            previewer = ts_previewers.new_termopen_previewer {
              get_command = function(entry)
                return { "bash", "-c", "cd " .. entry[1] .. " && git status && git diff" }
              end,
              env = {
                ["PAGER"] = "cat",
              },
            },
            sorter = ts_conf.file_sorter(proj_opts),
            attach_mappings = function(prompt_bufnr, _)
              ts_actions.select_default:replace(function()
                ts_actions.close(prompt_bufnr)
                local selection = ts_actions_state.get_selected_entry()
                if selection then
                  vim.cmd.cd(selection[1])
                end
              end)
              return true
            end,
          }):find()
        end)
      )
    end
  end
}
