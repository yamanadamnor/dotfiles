-- Never request typescript-language-server for formatting
local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },

    offsetEncoding = { "utf-16" },
    general = {
        positionEncodings = { "utf-16" },
    },
}
local on_attach = function(client, bufnr)
    -- Mappings
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<C-j>", function()
        vim.diagnostic.jump({ count = 1, float = true })
    end)

    -- Replaced by glance
    -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    -- vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

    -- Replaced by conform
    -- vim.keymap.set("n", "<leader>fo", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", opts)
end

vim.lsp.config("*",
    --- @type vim.lsp.Config
    {
        on_attach = on_attach,
        capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
    }
)

vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "tailwindcss",
    "biome",
    "roslyn"
})

return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog", "MasonUninstall", "MasonUninstallAll" },
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end,
    },
    {
        -- LSP server helpers
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "tailwindcss",
                "ts_ls",
                "biome"
            },
            automatic_enable = false,
        },
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "tailwindcss",
                    "ts_ls",
                    "biome",
                },
                automatic_installation = true,
                automatic_enable = true,
            })
        end,
    },
    {
        -- Neovim lua autocompletion
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
}
