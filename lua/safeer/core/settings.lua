vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true -- Line numbers
vim.opt.guicursor = "n:block,i:block" -- Block cursor in normal and insert mode

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing edit operations

vim.opt.list = true -- Enable list mode
vim.opt.listchars:append("space:·") -- Represent spaces with a dot (·)