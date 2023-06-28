-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local error_file_path = "/var/log/nvim.log"
if error_file_path then
	vim.opt.errorfile = error_file_path
end
