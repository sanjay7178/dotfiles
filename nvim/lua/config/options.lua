local opt = vim.opt

-- This setup uses Lua plugins, with no remote Python/Node/Ruby/Perl hosts.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Recover Kitty's terminfo lookup if the inherited environment is unusable.
if vim.env.TERM == "xterm-kitty" and vim.fn.executable("infocmp") == 1 then
    local command = { "infocmp", "-L" }
    if vim.system(command, { text = true }):wait(1000).code ~= 0 then
        for _, directory in ipairs({ "/usr/lib/kitty/terminfo", "/usr/share/terminfo", "/lib/terminfo" }) do
            local result = vim.system(command, {
                text = true,
                env = { TERMINFO = directory },
            }):wait(1000)
            if result.code == 0 then
                vim.env.TERMINFO = directory
                break
            end
        end
    end
end

opt.number = true
opt.relativenumber = true

opt.mouse = "a"

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true

opt.signcolumn = "yes"

opt.cursorline = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.wrap = false

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.undofile = true

opt.updatetime = 250
opt.timeoutlen = 400

opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
}

opt.clipboard = "unnamedplus"
