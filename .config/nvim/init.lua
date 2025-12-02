-- ====================================================================
-- LAZY.NVIM BOILERPLATE INSTALLER (MUST BE AT THE TOP)
-- ====================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ====================================================================
-- MATUGEN DYNAMIC THEME HANDLERS
-- ====================================================================

local function source_matugen()
    local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua"
    local file = io.open(matugen_path, "r")
    if file then
        io.close(file)  -- close before dofile to avoid double file handles
        dofile(matugen_path)
    else
        vim.cmd('colorscheme catppuccin')
        vim.print("Matugen style file not found. Using fallback.")
    end
end

local function matugen_reload_handler()
    source_matugen()

    -- Reload Lualine with auto theme
    local status_ok, lualine = pcall(require, 'lualine')
    if status_ok then
        lualine.setup { options = { theme = 'auto' } }
    end

    -- Optional: reset highlights
    vim.api.nvim_set_hl(0, "Comment", { italic = true })
end

-- If you want a signal-based reload, use a user autocmd
vim.api.nvim_create_autocmd("User", {
    pattern = "MatugenReload",
    callback = matugen_reload_handler,
})

-- ====================================================================
-- PLUGIN SETUP (Only one table of plugins)
-- ====================================================================

require("lazy").setup({

    -- 1. BASE16 (Required for Matugen-generated themes)
    {
    'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,
    config = function()
        matugen_reload_handler()
    end
    },

    -- 2. CATPPUCCIN fallback theme
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
    },

    -- 3. LUALINE
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
    },

})

