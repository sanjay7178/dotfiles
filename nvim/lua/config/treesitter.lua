local treesitter = require("nvim-treesitter")

treesitter.setup({})

local parsers = {
    "bash", "c", "go", "gomod", "gosum", "gowork", "javascript",
    "json", "lua", "markdown", "markdown_inline", "python", "query",
    "rust", "tsx", "typescript", "vim", "vimdoc", "yaml",
}

-- Run explicitly so opening Neovim never starts a parser installation.
vim.api.nvim_create_user_command("TSInstallConfigured", function()
    treesitter.install(parsers)
end, { desc = "Install parsers for the configured languages" })

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("ConfigTreesitter", { clear = true }),
    callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if lang and pcall(vim.treesitter.language.add, lang) then
            vim.treesitter.start(event.buf, lang)
        end
    end,
})
