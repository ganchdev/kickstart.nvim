-- github-nvim-theme: GitHub's colorschemes for Neovim
-- https://github.com/projekt0n/github-nvim-theme

vim.pack.add { 'https://github.com/projekt0n/github-nvim-theme' }

require('github-theme').setup {}

-- The active colorscheme is set in init.lua (tokyonight). To make a GitHub
-- theme the default instead, uncomment one of these:
-- vim.cmd.colorscheme 'github_dark_default'
-- vim.cmd.colorscheme 'github_light_default'
