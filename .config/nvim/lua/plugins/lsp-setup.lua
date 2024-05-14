return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
            { desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
            { desc = '[G]oto [R]eferences' })
        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations,
            { desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions,
            { desc = 'Type [D]efinition' })
        vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
            { desc = '[D]ocument [S]ymbols' })
        vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
            { desc = '[W]orkspace [S]ymbols' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
            { desc = '[R]e[n]ame' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
            { desc = '[C]ode [A]ction' })
        -- TODO: comment this and improve it
        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover,
        --     { desc = 'Hover Documentation' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
            { desc = '[G]oto [D]eclaration' })

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities,
            require('cmp_nvim_lsp').default_capabilities())

        require('mason').setup()

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
        }
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua',
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {},
                        capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        }
        vim.diagnostic.config({
            virtual_text = false
        })
    end,
}
