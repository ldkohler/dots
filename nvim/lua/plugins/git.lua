return {
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "＿" },
                topdelete = { text = "‾" },
                changedelete = { text = "│" },
            },
        },
        keys = {
            { "]g", "<cmd>Gitsigns next_hunk<cr>", desc = "Next git hunk" },
            { "[g", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous git hunk" },
            { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
            { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
            { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
        },
    },
}
