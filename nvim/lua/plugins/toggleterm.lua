return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<c-\>]], 
    direction = 'horizontal',
  },
  config = function(_, opts)
    -- 1. Initialize toggleterm with your options
    require("toggleterm").setup(opts)

    -- 2. Define the Space + k mapping
    vim.keymap.set('n', '<leader>k', function()
      local current_file = vim.api.nvim_buf_get_name(0)
      
      if current_file:match("%.py$") then
        local Terminal = require('toggleterm.terminal').Terminal
        
        local python_run = Terminal:new({
          cmd = "python " .. vim.fn.shellescape(current_file),
          id = 1,
          hidden = false,
          -- This prevents the terminal window from closing when the script dies or intercepts Ctrl+C
          close_on_exit = false, 
        })
        
        python_run:toggle()
      else
        print("Not a Python file!")
      end
    end, { desc = "Run current Python file (persist window on exit)" })
  end
}
