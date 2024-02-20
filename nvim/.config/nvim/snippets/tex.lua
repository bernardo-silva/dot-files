local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local status_ok, fmt = pcall(require, "luasnip.extras.fmt")
if not status_ok then
  return
end
local fmt = fmt.fmt

local status_ok, rep = pcall(require, "luasnip.extras")
if not status_ok then
  return
end
local rep = rep.rep


local s = ls.s
local t = ls.t
local i = ls.i

local snippets, autosnippets = {}, {}

local hyperref = s("hyperref", fmt([[
\hyperref[{1}]{{{2}~\ref{{{3}}}}}
]], {
    i(1, "label"),
    i(2, "type"),
    rep(1)
}))
table.insert(snippets, hyperref)

local mk = s("mk", fmt([[
${}$ 
]], {
    i(1, ""),
}))
table.insert(autosnippets, mk)

local ket = s("ket", fmt([[
\ket{{{}}}
]], {
    i(1, ""),
}))
table.insert(autosnippets, ket)

local bra = s("bra", fmt([[
\bra{{{}}}
]], {
    i(1, ""),
}))
table.insert(autosnippets, bra)

local columns = s("columns",
   fmt([[\begin{{columns}}
    \begin{{column}}{{0.5\textwidth}}

    \end{{column}}
    \begin{{column}}{{0.5\textwidth}}

    \end{{column}}
\end{{columns}}]], {}))
table.insert(snippets, columns)

local frame = s("frame",
   fmt([[

\begin{{frame}}{{{1}}}{{{2}}}
    {3} 
\end{{frame}}

%===============================================================================

]], {i(1, "title"), i(2, "subtitle"), i(3, "")}))
table.insert(snippets, frame)

return snippets, autosnippets
