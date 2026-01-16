-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- =============================================================================
-- TMUX aware Navigation
-- =============================================================================
-- Smart navigation between Neovim splits and tmux panes
local function tmux_navigator(dir)
  local current = vim.fn.winnr()
  vim.cmd("wincmd " .. dir)

  -- If window didn't change, we're at the edge - tell tmux to switch panes
  if vim.fn.winnr() == current then
    -- Map vim directions to tmux direction flags
    local tmux_flag = ({
      h = "-L",
      j = "-D",
      k = "-U",
      l = "-R",
    })[dir]

    if tmux_flag then
      vim.fn.system("tmux select-pane " .. tmux_flag)
    end
  end
end

-- Normal mode mappings for tmux-aware navigation
vim.keymap.set("n", "<C-h>", function()
  tmux_navigator("h")
end, { silent = true, desc = "Navigate left (tmux-aware)" })
vim.keymap.set("n", "<C-j>", function()
  tmux_navigator("j")
end, { silent = true, desc = "Navigate down (tmux-aware)" })
vim.keymap.set("n", "<C-k>", function()
  tmux_navigator("k")
end, { silent = true, desc = "Navigate up (tmux-aware)" })
vim.keymap.set("n", "<C-l>", function()
  tmux_navigator("l")
end, { silent = true, desc = "Navigate right (tmux-aware)" })
