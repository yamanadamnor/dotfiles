local M = {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
}

function M.config()
    local lint = require("lint")
    lint.linters_by_ft = {
        javascript = { "oxlint" },
        typescript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescriptreact = { "oxlint" },
        markdown = { "markdownlint" },
    }
end

return M
