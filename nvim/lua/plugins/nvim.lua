return {
    {
        'echasnovski/mini.pairs',
        config = true,
        event = 'InsertEnter',
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons', -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
        keys = {
            { '-', '<cmd>Neotree toggle<cr>', desc = 'Toggle file explorer' },
        },
        opts = {
            filesystem = {
                follow_current_file = { enabled = true },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
            window = {
                width = 30,
            },
        },
    },
    { 'tpope/vim-sleuth', event = 'BufReadPost' },
    {
        'kylechui/nvim-surround',
        config = true,
        keys = {
            { 'cs', mode = 'n' },
            { 'ds', mode = 'n' },
            { 'ys', mode = 'n' },
            { 'yS', mode = 'n' },
            { 'yss', mode = 'n' },
            { 'ySs', mode = 'n' },
        },
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavour = 'mocha', -- or "latte" for light mode
            transparent_background = false,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
                telescope = true,
                cmp = true,
                gitsigns = true,
                neo_tree = true,
            },
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            vim.cmd.colorscheme('catppuccin')
        end,
    },
}
