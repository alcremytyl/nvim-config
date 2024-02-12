vim.cmd([[
  set linebreak 
  set rnu!      " relative number
]])

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.g.ranger_map_keys = 0 -- disable ranger.vim's default keybind
