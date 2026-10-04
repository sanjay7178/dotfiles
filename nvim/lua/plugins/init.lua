-- Plugins are registered once in config.plugins.

-----------------------------------------------------------------------
-- Completion
-----------------------------------------------------------------------

require("blink.cmp").setup({
    -- Similar to VS Code:
    -- Tab moves through snippets and Enter accepts completion.
    keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },

        menu = {
            auto_show = true,
        },
    },

    signature = {
        enabled = true,
    },

    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },

    fuzzy = {
        implementation = "prefer_rust_with_warning",
    },
})

-----------------------------------------------------------------------
-- FZF
-----------------------------------------------------------------------

require("nvim-web-devicons").setup({})

local fzf = require("fzf-lua")

fzf.setup({
    "default-title",
})

vim.keymap.set("n", "<leader>ff", fzf.files, {
    desc = "Find files",
})

vim.keymap.set("n", "<leader>fg", fzf.live_grep, {
    desc = "Search project",
})

vim.keymap.set("n", "<leader>fb", fzf.buffers, {
    desc = "Buffers",
})

vim.keymap.set("n", "<leader>fh", fzf.helptags, {
    desc = "Help",
})

vim.keymap.set("n", "<leader>fr", fzf.resume, {
    desc = "Resume search",
})

vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, {
    desc = "Document symbols",
})

vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, {
    desc = "Workspace symbols",
})

-----------------------------------------------------------------------
-- Oil file manager
-----------------------------------------------------------------------

require("oil").setup({
    default_file_explorer = true,

    columns = {
        "permissions",
        "size",
    },

    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<cmd>Oil<cr>", {
    desc = "Open parent directory",
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", {
    desc = "File explorer",
})

-----------------------------------------------------------------------
-- Git
-----------------------------------------------------------------------

require("gitsigns").setup({
    current_line_blame = false,

    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
    },
})

vim.keymap.set("n", "]h", function()
    require("gitsigns").nav_hunk("next")
end, {
    desc = "Next Git hunk",
})

vim.keymap.set("n", "[h", function()
    require("gitsigns").nav_hunk("prev")
end, {
    desc = "Previous Git hunk",
})

vim.keymap.set("n", "<leader>hp", function()
    require("gitsigns").preview_hunk()
end, {
    desc = "Preview Git hunk",
})

vim.keymap.set("n", "<leader>hs", function()
    require("gitsigns").stage_hunk()
end, {
    desc = "Stage Git hunk",
})

vim.keymap.set("n", "<leader>hr", function()
    require("gitsigns").reset_hunk()
end, {
    desc = "Reset Git hunk",
})

-----------------------------------------------------------------------
-- Formatter
-----------------------------------------------------------------------

require("conform").setup({
    formatters_by_ft = {
        lua = {
            "stylua",
        },

        go = {
            "goimports",
            "gofumpt",
        },

        rust = {
            "rustfmt",
        },

        python = {
            "ruff_format",
        },

        javascript = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        javascriptreact = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        typescript = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        typescriptreact = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        json = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        yaml = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        markdown = {
            "prettierd",
            "prettier",
            stop_after_first = true,
        },

        sh = {
            "shfmt",
        },
    },

    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
})

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    require("conform").format({
        async = true,
        lsp_format = "fallback",
    })
end, {
    desc = "Format file",
})

-----------------------------------------------------------------------
-- Trouble: VS Code-like Problems panel
-----------------------------------------------------------------------

require("trouble").setup({})

vim.keymap.set("n", "<leader>xx",
    "<cmd>Trouble diagnostics toggle<cr>",
    { desc = "Problems" }
)

vim.keymap.set("n", "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer problems" }
)

vim.keymap.set("n", "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    { desc = "Document symbols" }
)
