local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({ trig = "paren", dscr = "Expands paren to '~parencite{}'" }, {
        t("~\\parencite{"),
        i(1),
        t("}"),
        i(2),
    }),
}
