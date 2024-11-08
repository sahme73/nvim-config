---
-- Manual LSP Setup
---

-- Grab the installed lsp-zero plugin
local lsp_zero = require("lsp-zero")

-- Remove icons
lsp_zero.set_preferences({
    sign_icons = { }
})

-- Once attaching to any LSP, set the following keymaps
lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end)

-- Setup the servers
lsp_zero.setup_servers({"clangd", "jdtls", "ts_ls"})

---
-- Autocompletion
---

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})
