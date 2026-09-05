-- Older distro packages use the basic Vim setup without downloading plugins.
if vim.fn.has("nvim-0.11.2") == 0 then
  vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
  vim.cmd("source " .. vim.fn.fnameescape(vim.fn.expand("~/.vimrc")))
  return
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
