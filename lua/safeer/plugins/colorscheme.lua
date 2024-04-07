return {
    "bluz71/vim-nightfly-guicolors", -- Repo for colorscheme
    priority = 1000, -- Load this plugin first

    -- Set the colorscheme
    -- Make normal backgrounds transparent
    -- Make nontext backgrounds transparent
    -- Customize the line number background
    -- Customize the netrw highlighting
    -- Customize the lazy menu panel
    config = function()
        vim.cmd([[
            colorscheme nightfly
            hi Normal guibg=NONE ctermbg=NONE
            hi NonText guibg=NONE ctermbg=NONE
            hi LineNr guifg=#FFFFFF guibg=NONE ctermbg=NONE
            hi CursorLine guifg=NONE guibg=#646464 gui=NONE
            hi LazyNormal guifg=#ABB2BF guibg=#282C34
            hi SignColumn guibg=NONE
        ]])
    end,
}
