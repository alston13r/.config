vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = true
vim.o.signcolumn = 'yes'

vim.o.number = true
vim.o.relativenumber = true
vim.o.swapfile = false

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
-- vim.keymap.set('n', '<leader>w', ':write<CR>')
-- vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>nh', ':noh<CR>')

vim.pack.add({
    { src = 'https://github.com/mofiqul/vscode.nvim' },
    { src = 'https://github.com/stevearc/oil.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/akinsho/bufferline.nvim' },
    { src = 'https://github.com/rmagatti/auto-session' },
})

require 'oil'.setup()
require 'mini.pick'.setup()
require 'mason'.setup()

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
vim.lsp.enable({
    'lua_ls',
    'clangd',
    'bash-language-server',
    'typescript-language-server',
})

vim.keymap.set('n', '<leader>h', ':Pick help<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.cmd('colorscheme vscode')

vim.cmd [[
highlight BufferLineFill guibg=#111111
highlight BufferLineSeparator guibg=#171717
]]
