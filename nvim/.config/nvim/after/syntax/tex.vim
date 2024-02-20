syntax match texMathSymbol /\\bra{\%([^}]*}\)\@=/ conceal cchar=⟨
syntax match texMathSymbol /\%(\\bra{[^}]*\)\@<=}/ conceal cchar=|

syntax match texMathSymbol /\\ket{\%([^}]*}\)\@=/ conceal cchar=|
syntax match texMathSymbol /\%(\\ket{[^}]*\)\@<=}/ conceal cchar=⟩

syntax match texMathSymbol /\\dyad{\%([^}]*}\)\@=/ conceal cchar=|
syntax match texMathSymbol /\%(\\dyad{[^}]*\)\@<=}/ conceal cchar=|

syntax match texMathSymbol /\\braket{\%([^}]*}\)\@=/ conceal cchar=⟨ 
syntax match texMathSymbol /\%(\\braket{[^}]*\)}{\@<=\%([^}]*}\)/ conceal cchar=|
syntax match texMathSymbol /\%(\\braket{[^}]*}{[^}]*\)@<=}/ conceal cchar=⟩

syntax match texMathSymbol /\\abs{\%([^}]*}\)\@=/ conceal cchar=|
syntax match texMathSymbol /\%(\\abs{[^}]*\)\@<=}/ conceal cchar=|
