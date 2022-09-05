local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins

    use "KeitaNakamura/neodark.vim" -- Colorscheme

    use "hrsh7th/nvim-cmp" -- Completion plugin
    use "hrsh7th/cmp-buffer" -- Buffer completion 
    use "hrsh7th/cmp-path" -- Path completion
    use "hrsh7th/cmp-cmdline" -- Command completion
    use "saadparwaiz1/cmp_luasnip" -- Snipp completion
    use "hrsh7th/cmp-nvim-lsp"

    --Snippets
    use "L3MON4D3/LuaSnip" -- snippet engine
    use "rafamadriz/friendly-snippets" -- snippets 

    --Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    --Telescope
    use "nvim-telescope/telescope.nvim"

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Motion
    use 'ggandor/lightspeed.nvim'
    use "tpope/vim-repeat" -- Fixes repeat with lightspeed

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


    use "smithbm2316/centerpad.nvim" -- Center nvim buffer
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides

    use "christoomey/vim-system-copy" -- Copy to system clipboard

    use "vim-scripts/ReplaceWithRegister" --Replace without loosing yank

    use "kyazdani42/nvim-web-devicons" -- Icons for bufferline and lualine
    use {"akinsho/bufferline.nvim", tag = "v2.*"}
    use "nvim-lualine/lualine.nvim"

    use "folke/which-key.nvim"

    use "lewis6991/impatient.nvim" -- faster load times
    
    use 'sbdchd/neoformat' --autoformat
    -- LaTeX
    use {
        "lervag/vimtex",
        opt = true,
        ft = {"tex"}
    }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
