-- diffs.nvim: treesitter syntax highlighting inside diffs (Neogit, fugitive, diff filetype)
-- https://github.com/barrettruth/diffs.nvim
--
-- NOTE: hard-incompatible with diffview.nvim, which is why the Neogit module
-- does not install it.

-- Configuration must be set before the plugin loads
vim.g.diffs = {
  integrations = {
    neogit = true,
    gitsigns = true,
  },
}

vim.pack.add { 'https://github.com/barrettruth/diffs.nvim' }
