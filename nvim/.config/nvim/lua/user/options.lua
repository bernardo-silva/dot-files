local options = {
    number = true,
    relativenumber = true,
    textwidth = 80,
    colorcolumn = "+1",

    expandtab = true,
    shiftwidth = 4,
    softtabstop = 4,

    termguicolors = true,
    completeopt = { "menuone", "noselect"},
    ignorecase = true,
    pumheight = 10,
    showtabline = 2,
    smartcase = true,
    smartindent = true,
    undofile = true,
    updatetime = 300,
    cursorline = true,
    signcolumn = "yes",
    scrolloff = 8,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.cmd [[set iskeyword+=-]]
