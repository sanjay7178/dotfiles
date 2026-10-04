vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",

    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1"),
    },

    "https://github.com/rafamadriz/friendly-snippets",

    "https://github.com/nvim-treesitter/nvim-treesitter",

    "https://github.com/ibhagwan/fzf-lua",

    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/stevearc/oil.nvim",

    "https://github.com/lewis6991/gitsigns.nvim",

    "https://github.com/stevearc/conform.nvim",

    "https://github.com/folke/trouble.nvim",
})

require("plugins")
require("config.treesitter")
