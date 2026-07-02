require("config.lazy")
vim.opt.clipboard:append("unnamedplus")
-- equivalent to vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
--
vim.opt.cpo:remove("a")

vim.opt.statusline = "%f %m %= %s %y [PWD: %{fnamemodify(getcwd(), ':~')}]"
