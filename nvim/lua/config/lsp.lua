-----------------------------------------------------------------------
-- Diagnostics
-----------------------------------------------------------------------

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },

    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,

    float = {
        border = "rounded",
        source = true,
    },
})

-----------------------------------------------------------------------
-- Custom LSP configurations
-----------------------------------------------------------------------

vim.filetype.add({
    extension = {
        gotmpl = "gotmpl",
    },
})

-- These files are detected as plain YAML by Neovim.
vim.lsp.config("yamlls", {
    filetypes = { "yaml" },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            usePlaceholders = true,

            analyses = {
                unusedparams = true,
                unusedwrite = true,
                shadow = true,
            },

            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        },
    },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },

            diagnostics = {
                globals = {
                    "vim",
                },
            },

            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },

            telemetry = {
                enable = false,
            },
        },
    },
})

-----------------------------------------------------------------------
-- Enable servers
-----------------------------------------------------------------------

vim.lsp.enable({
    "gopls",
    "rust_analyzer",
    "ts_ls",
    "pyright",
    "lua_ls",
    "bashls",
    "yamlls",
    "jsonls",
})

-----------------------------------------------------------------------
-- VS Code-like LSP mappings
-----------------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = function(desc)
            return {
                buffer = event.buf,
                silent = true,
                desc = desc,
            }
        end

        -- Navigation
        vim.keymap.set("n", "gd",
            vim.lsp.buf.definition,
            opts("Go to definition")
        )

        vim.keymap.set("n", "gD",
            vim.lsp.buf.declaration,
            opts("Go to declaration")
        )

        vim.keymap.set("n", "gi",
            vim.lsp.buf.implementation,
            opts("Go to implementation")
        )

        vim.keymap.set("n", "gy",
            vim.lsp.buf.type_definition,
            opts("Go to type definition")
        )

        vim.keymap.set("n", "gr",
            vim.lsp.buf.references,
            opts("Find references")
        )

        -- Hover
        vim.keymap.set("n", "K",
            vim.lsp.buf.hover,
            opts("Hover documentation")
        )

        -- Rename
        vim.keymap.set("n", "<F2>",
            vim.lsp.buf.rename,
            opts("Rename symbol")
        )

        vim.keymap.set("n", "<leader>rn",
            vim.lsp.buf.rename,
            opts("Rename symbol")
        )

        -- Code actions
        vim.keymap.set({ "n", "v" }, "<leader>ca",
            vim.lsp.buf.code_action,
            opts("Code action")
        )

        -- Diagnostics
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
            })
        end, opts("Previous diagnostic"))

        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({
                count = 1,
                float = true,
            })
        end, opts("Next diagnostic"))

        vim.keymap.set("n", "<leader>cd",
            vim.diagnostic.open_float,
            opts("Line diagnostics")
        )

        -- Inlay hints
        if vim.lsp.inlay_hint then
            vim.keymap.set("n", "<leader>ch", function()
                local enabled =
                    vim.lsp.inlay_hint.is_enabled({
                        bufnr = event.buf,
                    })

                vim.lsp.inlay_hint.enable(
                    not enabled,
                    {
                        bufnr = event.buf,
                    }
                )
            end, opts("Toggle inlay hints"))
        end
    end,
})
