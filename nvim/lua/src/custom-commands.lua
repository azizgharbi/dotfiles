-- get path of the openned buffer
local function getPath()
	local filePath = vim.fn.expand("%:p")
	print("File path: " .. filePath)
	-- print("Today is: " .. os.date("%A %m %B %Y"))
end

-- Highlight Hexa Colors and clean buffer
local function highlights_hexa_colors()
	local buffer = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
	local pattern = "#(%x%x%x%x%x%x)"
	for i, line in ipairs(lines) do
		if string.match(line, pattern) then
			line:gsub(pattern, function(hexa)
				local start, finish = string.find(line, hexa)
				vim.api.nvim_command("highlight " .. hexa .. " guibg=#" .. hexa)
				vim.api.nvim_buf_add_highlight(buffer, -1, hexa, i - 1, start - 2, finish)
			end)
			vim.api.nvim_buf_clear_namespace(buffer, -1, i, string.len(line))
		end
	end
end

-- autocmd and command definitions
local add_user_commands = vim.api.nvim_create_user_command
local groupCmd = vim.api.nvim_create_augroup("GetFilePath", { clear = true })

add_user_commands("HighlightHexaColors", function()
	highlights_hexa_colors()
end, {})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		getPath()
	end,
	group = groupCmd,
})
