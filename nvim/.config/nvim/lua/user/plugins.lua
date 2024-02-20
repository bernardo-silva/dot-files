local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used in lots of plugins
    "KeitaNakamura/neodark.vim", -- Colorscheme
    "hrsh7th/nvim-cmp", -- Completion plugin
    "hrsh7th/cmp-buffer", -- Buffer completion 
    "hrsh7th/cmp-path", -- Path completion
    "hrsh7th/cmp-cmdline", -- Command completion
    "saadparwaiz1/cmp_luasnip", -- Snipp completion
    "hrsh7th/cmp-nvim-lsp",
    --Snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "rafamadriz/friendly-snippets", -- snippets 
    --Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    --Telescope
     "nvim-telescope/telescope.nvim",
    -- Comments
     "numToStr/Comment.nvim",
    -- Motion

    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },

    -- Git
     "tpope/vim-fugitive",
    -- LSP
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim", -- language server settings defined in json for
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "lukas-reineke/indent-blankline.nvim", -- Indent guides
    "christoomey/vim-system-copy", -- Copy to system clipboard
    "vim-scripts/ReplaceWithRegister", --Replace without loosing yank
    "nvim-tree/nvim-web-devicons", -- Icons for bufferline and lualine
    {"akinsho/bufferline.nvim", version = "v2.*"},
    "nvim-lualine/lualine.nvim",

    "folke/which-key.nvim",
    "lewis6991/impatient.nvim", -- faster load times
    'sbdchd/neoformat', --autoformat
    -- LaTeX
    {
        "lervag/vimtex",
        lazy = true,
        ft = {"tex"}
    },
    "akinsho/toggleterm.nvim",
    "tpope/vim-surround",
    "preservim/tagbar", -- side bar with code structure
    -- DAP
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "ravenxrz/DAPInstall.nvim",
    "norcalli/nvim-colorizer.lua", --Show colors
    "anufrievroman/vim-angry-reviewer",
    "quarto-dev/quarto-nvim",
    "jmbuhr/otter.nvim",

    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
