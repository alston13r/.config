vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = true
vim.o.signcolumn = 'yes'

vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>nh', ':noh<CR>')

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

vim.keymap.set('n', 'fg', '<C-^>', {noremap = true})

vim.pack.add({
    { src = 'https://github.com/mofiqul/vscode.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
    { src = 'https://github.com/rmagatti/auto-session' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
})

require 'nvim-web-devicons'.setup()
require 'mason'.setup()

require 'mason-lspconfig'.setup {
    automatic_installation = true,
    ensure_installed = {
        'lua_ls',
        'clangd',
        'bashls',
        'ts_ls',
        'nil_ls',
        'pylsp',
    }
}

vim.lsp.config('custom-ts-server', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript' },
})

vim.lsp.config('custom-py-server', {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
})

vim.lsp.enable({
    'lua_ls',
    'clangd',
    'bashls',
    'custom-ts-server',
    'rnix-lsp',
    'custom-ts-server',
    'custom-py-server',
})

require 'oil'.setup {
    view_options = { show_hidden = true }
}

require 'mini.pick'.setup()

require 'lualine'.setup {
    options = { theme = 'vscode' }
}

require 'bufferline'.setup {
    options = {
        mode = 'tabs',
        separator_style = 'slant'
    }
}

require 'auto-session'.setup {
    auto_restore = false,
    suppress_dirs = { '~/', '~/Dev', '~/Downloads', '~/Documents', '~/Desktop/' }
}
vim.keymap.set('n', '<leader>wr', '<cmd>AutoSession restore<CR>')
vim.keymap.set('n', '<leader>ws', '<cmd>AutoSession save<CR>')
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

-- LSP keybinds
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

vim.keymap.set('n', '<leader>re', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

vim.cmd('colorscheme vscode')

vim.cmd [[
highlight BufferLineFill guibg=#111111
highlight BufferLineSeparator guibg=#171717
]]
