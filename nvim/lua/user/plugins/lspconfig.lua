require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})
require('lsp-format').setup {}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- PHP
require('lspconfig').intelephense.setup({
    capabilities = capabilities,
    on_attach = require('lsp-format').on_attach
})

----phpactor
--require('lspconfig').phpactor.setup({
--    capabilities = capabilities,
--    on_attach = require('lsp-format').on_attach,
--    init_options = {
--        ["language_server_phpstan.enabled"] = false,
--        ["language_server_psalm.enabled"] = false,
--    }
--})

-- Vue, Javascript, Typescript
require('lspconfig').volar.setup({
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    on_attach = require('lsp-format').on_attach
})

-- Svelte
require('lspconfig').svelte.setup({
    capabilities = capabilities,
    filetypes = { 'svelte' },
    on_attach = require('lsp-format').on_attach
})


-- Tailwind
require('lspconfig').tailwindcss.setup({
    capabilities = capabilities,
    on_attach = require('lsp-format').on_attach
})

-- Json
require('lspconfig').jsonls.setup({
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
        },
    },
})

-- Emmet-ls
require('lspconfig').emmet_ls.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'sass', 'less', 'njk', 'vue', 'svelte' }
})

-- lua
require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        }
    },
    on_attach = require('lsp-format').on_attach
})

-- null-ls
require('null-ls').setup({
    on_attach = require('lsp-format').on_attach,
    sources = {
        require('null-ls').builtins.diagnostics.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.js' })
            end,
        }),
        require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
        require('null-ls').builtins.formatting.eslint_d.with({
            condition = function(utils)
                return utils.root_has_file({ '.eslintrc.js' })
            end,
        }),
        require('null-ls').builtins.formatting.prettierd,
        require('null-ls').builtins.formatting.autopep8,
    },
})

require('mason-null-ls').setup({ automatic_installation = true })




-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')


-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = true,
    }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
