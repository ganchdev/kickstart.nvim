-- local-highlight.nvim: highlights the other occurrences of the word under the cursor
-- https://github.com/tzachar/local-highlight.nvim

vim.pack.add { 'https://github.com/tzachar/local-highlight.nvim' }

require('local-highlight').setup {
  -- the plugin animates via snacks.nvim, which isn't installed here; leaving the
  -- default (enabled) makes setup error out on every startup
  animate = false,

  -- the plugin's own LocalHighlight group is a hardcoded dark blue, and it is
  -- defined once at setup — but `:colorscheme` clears custom groups, so it would
  -- vanish the first time the OS light/dark sync swaps themes. Naming a group the
  -- colorscheme itself owns keeps it correct in both.
  hlgroup = 'Visual',
}
