local M = {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  local lint = require("lint")
  lint.linters_by_ft = {
  }
end

return M
