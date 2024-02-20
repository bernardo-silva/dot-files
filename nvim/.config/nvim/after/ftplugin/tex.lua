vim.g.vimtex_view_method = "zathura"
vim.o.textwidth = 80
vim.o.conceallevel = 1
vim.o.spell = true

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
