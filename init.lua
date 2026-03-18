-- Options
vim.o.mouse = "a"                   -- Better mouse utilization
vim.o.clipboard = "unnamedplus"     -- Share clipboard between system and editor
vim.o.swapfile = false              -- Swap files
vim.o.backup = false                -- Save backups

vim.o.number = true                 -- Line numbering
vim.o.relativenumber = true         -- Relative line numbering
vim.o.termguicolors = true          -- Wider color palette
vim.o.guicursor = "n:block,i:block" -- Block cursor in normal and insert modes

vim.o.signcolumn = "yes"            -- Sign column (e.g., used for LSP warnings in normal mode)
vim.o.winborder = "rounded"         -- Diagnostics popout window

vim.o.expandtab = true              -- Use spaces instead of tabs
vim.o.tabstop = 4                   -- Number of spaces tabs count for
vim.o.shiftwidth = 4                -- Number of spaces to use for each step of (auto)indent
vim.o.softtabstop = 4               -- Number of spaces that a <Tab> counts for while performing edit operations
vim.o.smartindent = true            -- Smart indenting between lines
vim.o.list = true                   -- List mode (shows tabs as ">", trailing spaces as "-", etc.)
vim.o.wrap = false                  -- Wrap text to next line

vim.o.ignorecase = true             -- Case insensitive search
vim.o.hlsearch = false              -- Highlight search
vim.o.incsearch = true              -- Incremental search

vim.o.scrolloff = 8                 -- Keep cursor above bottom
vim.opt.isfname:append("@-@")       -- Treat file paths with "@" as a single unit

-- Keybinds
vim.g.mapleader = " "

vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Plugins
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
})

-- Colors
require "tokyonight".setup({ transparent = true })
vim.cmd("colorscheme tokyonight-night") -- Select colorscheme style
vim.cmd(":hi statusline guibg=NONE")    -- Transparent bottom bar
vim.cmd(":hi FloatBorder guibg=NONE")   -- Transparent border background
vim.cmd(":hi NormalFloat guibg=NONE")   -- Transparent float window background

-- LSPs
vim.lsp.enable({ "lua_ls", "zls" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Completions
require("blink.cmp").setup({
    keymap = { preset = "default" },
    fuzzy = { implementation = "lua" }, -- Enable Rust version of fuzzy dependency if blink starts getting slow
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
        ghost_text = { enabled = true },
    }
})
vim.cmd(":hi BlinkCmpMenu guibg=NONE")       -- Completion menu background
vim.cmd(":hi BlinkCmpMenuBorder guibg=NONE") -- Completion menu border
vim.cmd(":hi BlinkCmpDoc guibg=NONE")        -- Documentation window background
vim.cmd(":hi BlinkCmpDocBorder guibg=NONE")  -- Documentation window border
