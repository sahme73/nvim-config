vim.opt.mouse = 'a' -- Better mouse utilization
vim.opt.clipboard = 'unnamedplus' -- Share clipboard between system and editor

vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbering
vim.opt.guicursor = "n:block,i:block" -- Block cursor in normal and insert mode
vim.opt.termguicolors = true -- Wider color palette

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while performing edit operations
vim.opt.smartindent = true -- Smart indenting between lines

vim.opt.list = true -- Enable list mode
vim.opt.listchars:append("space:·") -- Represent spaces with a dot (·)

-- Extras:
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" -- Useful sometimes
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80" -- Guide for maximum line length
