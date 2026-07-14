-- Neogit: a Magit-inspired git interface for Neovim
-- https://github.com/NeogitOrg/neogit

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- required dependency
  'https://github.com/NeogitOrg/neogit',
}

require('neogit').setup {}

vim.keymap.set('n', '<leader>gg', '<Cmd>Neogit<CR>', { desc = 'Neo[g]it status' })
