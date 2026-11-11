return {
  {
    "KieranCanter/candela.nvim",

    opts = {},

    keys = {
      {
        "<leader>cds",
        "<Plug>CandelaUi",
        desc = "[Candela] toggle UI window",
        silent = true,
      },
      {
        "<leader>cda",
        "<Plug>CandelaAdd",
        desc = "[Candela] add pattern in UI",
        silent = true,
      },
      {
        "<leader>cdR",
        "<Plug>CandelaRefresh",
        desc = "[Candela] refresh patterns in current buffer",
        silent = true,
      },
      {
        "<leader>cdD",
        "<Plug>CandelaClear",
        desc = "[Candela] clear all patterns",
        silent = true,
      },
      {
        "<leader>cdM",
        "<Plug>CandelaMatchAll",
        desc = "[Candela] vim match all patterns",
        silent = true,
      },
      {
        "<leader>cdF",
        "<Plug>CandelaFindAll",
        desc = "[Candela] find all patterns and send to location list",
        silent = true,
      },
      {
        "<leader>cdL",
        "<Plug>CandelaLightbox",
        desc = "[Candela] toggle lightbox window",
        silent = true,
      },
      {
        "<leader>cd?",
        "<Plug>CandelaHelp",
        desc = "[Candela] open help menu",
        silent = true,
      },
    },
  },
}
