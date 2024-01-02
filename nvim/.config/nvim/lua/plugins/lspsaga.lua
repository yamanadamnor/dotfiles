local M = {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        --Please make sure you install markdown and markdown_inline parser
        "nvim-treesitter/nvim-treesitter"
    },
}

function M.config()
    require("lspsaga").setup({
        lightbulb = {
            sign = false
        }
    })
end

return M
