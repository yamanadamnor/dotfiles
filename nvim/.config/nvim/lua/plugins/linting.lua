local M = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local lint = require("lint")
  lint.linters_by_ft = {
    javascript = { "eslint" },
    typescript = { "eslint" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },
  }
end

return M
