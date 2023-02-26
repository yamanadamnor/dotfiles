local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
-- local sn = ls.snippet_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local rep = require("luasnip.extras").rep

return {
    -- Combining text and insert nodes to create basic LaTeX commands
    s({ trig = "tt", wordTrig = false, dscr = "Expands 'tt' into '\texttt{}'" }, {
        t("\\texttt{"), -- remember: backslashes need to be escaped
        i(1),
        t("}"),
    }),
    -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
    -- there is a much better, human-readable solution: ls.fmt, described shortly.
    s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" }, {
        t("\\frac{"),
        i(1), -- insert node 1
        t("}{"),
        i(2), -- insert node 2
        t("}"),
    }),

    -- Example: text and insert nodes quickly become hard to read.
    s({ trig = "eq", dscr = "A LaTeX equation environment" }, {
        t({ -- using a table of strings for multiline text
            "\\begin{equation}",
            "    ",
        }),
        i(1),
        t({
            "",
            "\\end{equation}",
        }),
    }),
}
