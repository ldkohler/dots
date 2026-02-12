return {
{
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
        flavour = "mocha", -- or "latte" for light mode
        transparent_background = false,
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
            },
            telescope = true,
            cmp = true,
            gitsigns = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
},
}
