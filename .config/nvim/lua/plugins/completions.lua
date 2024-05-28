return {
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments
                    -- Remove the below condition to re-enable on windows
                    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
            },
            'saadparwaiz1/cmp_luasnip',

            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',

        },
        config = function()
            -- See `:help cmp`
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },

                -- For an understanding of why these mappings were
                -- chosen, you will need to read `:help ins-completion`
                mapping = cmp.mapping.preset.insert {
                    -- `Enter` key to confirm completion
                    ['<M-CR>'] = cmp.mapping.confirm({select = false}),

                    -- Ctrl+Space to trigger completion menu
                    ['<M-Space>'] = cmp.mapping.complete(),

                    -- Selection window up/down
                    ['<M-k>'] = cmp.mapping.select_prev_item(),
                    ['<M-j>'] = cmp.mapping.select_next_item(),

                    -- Scroll up and down in the completion documentation
                    ['<M-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<M-i>'] = cmp.mapping.scroll_docs(4),

                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },
            }
        end,
    },
}
