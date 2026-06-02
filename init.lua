-- Options
vim.o.mouse = "a"                    -- Better mouse utilization
vim.o.clipboard = "unnamedplus"      -- Share clipboard between system and editor
vim.o.swapfile = false               -- Swap files
vim.o.backup = false                 -- Save backups

vim.o.number = true                  -- Line numbering
vim.o.relativenumber = true          -- Relative line numbering
vim.o.termguicolors = true           -- Wider color palette
vim.o.guicursor = "n:block,i:block"  -- Block cursor in normal and insert modes

vim.o.signcolumn = "yes"             -- Sign column (e.g., used for LSP warnings in normal mode)
vim.o.winborder = "rounded"          -- Diagnostics popout window

vim.o.expandtab = true               -- Use spaces instead of tabs
vim.o.tabstop = 4                    -- Number of spaces tabs count for
vim.o.shiftwidth = 4                 -- Number of spaces to use for each step of (auto)indent
vim.o.softtabstop = 4                -- Number of spaces that a <Tab> counts for while performing edit operations
vim.o.smartindent = true             -- Smart indenting between lines
vim.o.list = true                    -- List mode (shows tabs as ">", trailing spaces as "-", etc.)
vim.o.wrap = false                   -- Wrap text to next line

vim.o.ignorecase = true              -- Case insensitive search
vim.o.hlsearch = false               -- Highlight search
vim.o.incsearch = true               -- Incremental search

vim.o.scrolloff = 8                  -- Keep cursor above bottom
vim.opt.isfname:append("@-@")        -- Treat file paths with "@" as a single unit

vim.opt.spell = true                 -- Enable spell checking
vim.opt.spelloptions:append("camel") -- Check each part of CamelCased words individually

-- Keybinds
vim.g.mapleader = " "

vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>ca", function()
    vim.fn.setreg("+", vim.fn.expand("%:p"))
    print("Copied absolute path: " .. vim.fn.expand("%:p"))
end, { desc = "Copy absolute path to clipboard" })

-- Plugins
vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },                   -- Color theme
    { src = "https://github.com/saghen/blink.cmp" },                        -- Code completion
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" }, -- For sticky scroll context
    { src = "https://codeberg.org/mfussenegger/nvim-jdtls.git" },           -- Java LSP extensions
    { src = "https://github.com/j-hui/fidget.nvim.git" },                   -- Notification/progress status
    { src = "https://github.com/lewis6991/gitsigns.nvim" },                 -- Git gutter
})

-- Colors
require "tokyonight".setup({ transparent = true })
vim.cmd("colorscheme tokyonight-night") -- Select colorscheme style
vim.cmd(":hi statusline guibg=NONE")    -- Transparent bottom bar
vim.cmd(":hi FloatBorder guibg=NONE")   -- Transparent border background
vim.cmd(":hi NormalFloat guibg=NONE")   -- Transparent float window background

-- Language Server Protocols (LSPs)
vim.lsp.enable({
    "bashls",                 -- Ba/sh
    "clangd",                 -- C/C++/CUDA
    "fish_lsp",               -- Fish
    "jdtls",                  -- Java
    "kotlin_language_server", -- Kotlin
    "lemminx",                -- XML
    "lua_ls",                 -- Lua
    "make_ls",                -- Makefile
    "mesonlsp",               -- Meson
    "perlnavigator",          -- Perl
    "pyright",                -- Python
    "rust_analyzer",          -- Rust
    "ts_ls"                   -- Typescript
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

require("fidget").setup({}) -- LSP progress notifications

vim.lsp.config("jdtls", {
    root_markers = { ".git", ".classpath" },
    init_options = {
        settings = {
            java = {
                import = {
                    gradle = { enabled = false },
                    maven = { enabled = false },
                },
            },
        },
    },
})

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

-- Sticky Scroll
require("treesitter-context").setup({
    max_lines = 3,           -- Cap how many context lines stack at the top
    multiline_threshold = 1, -- Collapse multiline signatures to the first line
    trim_scope = "outer",    -- Drop outer scopes first when over "max_lines"
    min_window_height = 20,  -- Disable in tiny splits
    separator = nil,         -- Set to "-" to add a divider line
})
vim.cmd(":hi TreesitterContext guibg=NONE")
vim.cmd(":hi TreesitterContextLineNumber guibg=NONE")
vim.cmd(":hi TreesitterContextBottom gui=underline guisp=#3b4261")

vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to context" })

vim.treesitter.language.register("tsx", { "typescriptreact", "javascriptreact" })
