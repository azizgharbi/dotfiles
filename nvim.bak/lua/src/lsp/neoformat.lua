-- http://neovimcraft.com/plugin/sbdchd/neoformat/index.html
-- Format on save
vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre Neoformat 
augroup END]])
