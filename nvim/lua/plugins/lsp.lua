return {
    'neovim/nvim-lspconfig',
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library' },
            },
        },
    },
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = {
            'rafamadriz/friendly-snippets',
            'folke/lazydev.nvim',
        },
        event = { 'InsertEnter', 'LspAttach' },
        opts = {
            keymap = { preset = 'default' },
            appearance = {
                nerd_font_variant = 'mono',
            },
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                },
            },
        },
    },
    {
        'saecki/live-rename.nvim',
        event = 'LspAttach',
        config = function(_, opts)
            local live_rename = require('live-rename')
            live_rename.setup(opts)
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(o)
                    local clients = vim.lsp.get_clients({ buffer = o.buf })
                    for _, client in ipairs(clients) do
                        if client:supports_method('textDocument/rename') then
                            vim.keymap.set(
                                'n',
                                'grn',
                                live_rename.rename,
                                { buffer = o.buf }
                            )
                        end
                    end
                end,
                group = vim.api.nvim_create_augroup(
                    'ALiveRename',
                    { clear = true }
                ),
            })
        end,
    },
    {
        'yioneko/nvim-vtsls',
        config = function(_, opts)
            require('vtsls').config(opts)
        end,
        dependencies = {
            {
                'davidosomething/format-ts-errors.nvim',
                ft = {
                    'javascript',
                    'javascriptreact',
                    'typescript',
                    'typescriptreact',
                },
            },
        },
        ft = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
        },
        opts = {
            settings = {
                typescript = {
                    inlayHints = {
                        parameterNames = { enabled = 'literals' },
                        parameterTypes = { enabled = true },
                        variableTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        enumMemberValues = { enabled = true },
                    },
                },
            },
        },
    },
    {
        'SmiteshP/nvim-navic',
        opts = {
            depth_limit = 3,
            depth_limit_indicator = '…',
            icons = {
                enabled = false,
            },
        },
        event = 'LspAttach',
    },
}
