require("config.lazy")
require("config.lsp")
vim.opt.clipboard:append{"unnamedplus"}
vim.opt.allowrevins = true
vim.opt.autochdir = true
vim.opt.autocomplete = true
vim.opt.awa = true
vim.opt.bs = {"indent","eol","start"}

-- intendation
vim.cmd('filetype plugin indent on')
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.shiftwidth = 4     -- Number of spaces for auto-indent
vim.opt.tabstop = 4        -- Number of spaces a \t counts for
vim.opt.softtabstop = 4    -- Number of spaces a tab counts for while editing
vim.opt.autoindent = true
vim.opt.smartindent = false

--text wrapping 
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.breakat = [[\t;:,!? ]]
vim.opt.showbreak = "↳ "
vim.opt.breakindentopt = "shift:2,min:20"
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

vim.opt.cursorline = true
vim.opt.cursorlineopt = {"number"}

vim.opt.splitright = true

vim.opt.number = true
-- Cycle forward with Tab
vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>'
  else
    return '<Tab>'
  end
end, { expr = true, replace_keycodes = true })

-- Cycle backward with Shift+Tab
vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  else
    return '<S-Tab>'
  end
end, { expr = true, replace_keycodes = true })
vim.o.list = true


vim.opt.cpo:remove("a")




vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.cmd('packadd! nohlsearch')




-- Exit terminal mode with double Escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


-- Cycle forward through open windows with Tab
vim.keymap.set('n', '<Tab>', '<C-w>w', { desc = 'Cycle to next window' })

-- Cycle backward with Shift+Tab
vim.keymap.set('n', '<S-Tab>', '<C-w>W', { desc = 'Cycle to previous window' })

-- Move between windows using Ctrl + Direction
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
-- Fast window closing and splitting
vim.keymap.set('n', '<leader>gq', '<C-w>c', { desc = 'Close current window' })
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
-- Tab management
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })

-- Move to next/previous tab with Shift+H and Shift+L
vim.keymap.set('n', 'H', ':tabprevious<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', 'L', ':tabnext<CR>', { desc = 'Go to next tab' })
