-- github-nvim-theme: GitHub's colorschemes for Neovim
-- https://github.com/projekt0n/github-nvim-theme

vim.pack.add { 'https://github.com/projekt0n/github-nvim-theme' }

require('github-theme').setup {}

-- [[ Follow the macOS system appearance ]]
-- This file is loaded at the end of init.lua, so the colorscheme picked here
-- wins over the one init.lua sets.
local themes = {
  dark = 'tokyonight-night',
  light = 'github_light_default',
}

local function apply(mode)
  local want = themes[mode] or themes.dark
  if vim.g.colors_name ~= want then
    vim.cmd.colorscheme(want)
  end
end

-- macOS only exposes dark mode: the key holds 'Dark' when dark mode is on and
-- does not exist at all in light mode (so a failed read means light).
local function sync(opts)
  opts = opts or {}
  if vim.uv.os_uname().sysname ~= 'Darwin' then
    return apply 'dark'
  end
  local proc = vim.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' }, { text = true }, function(res)
    local mode = vim.trim(res.stdout or ''):lower() == 'dark' and 'dark' or 'light'
    vim.schedule(function()
      apply(mode)
    end)
  end)
  if opts.blocking then
    proc:wait() -- avoids a flash of the wrong theme during startup
  end
end

-- Set the right theme before the UI is drawn, then re-check whenever nvim
-- regains focus, which is when a system-wide theme flip would be noticed.
sync { blocking = true }
vim.api.nvim_create_autocmd('FocusGained', {
  desc = 'Match the colorscheme to the macOS light/dark appearance',
  callback = function()
    sync()
  end,
})
vim.api.nvim_create_user_command('ThemeSync', function()
  sync()
end, { desc = 'Re-sync the colorscheme with the macOS appearance' })
