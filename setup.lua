local os = require("os")
local dir = os.getenv("HOME") .. "/.config/"
local configs = { "awesome", "nvim" }

-- Setup function
local function lsp_install()
	-- copy paste
	os.execute("sudo pacman -S xsel")
	-- regex
	os.execute("sudo pacman -S ripgrep ripgrep-all")
	-- tssever lsp
	os.execute("sudo npm i -g typescript-language-server typescript-language-server")
	-- go lsp
	os.execute("sudo pacman -S gopls")
	-- vuels
	os.execute("sudo npm i -g vls")
end
--}}

--[[
    Check if config exist
    Else copy config
    create a symbolic links ]]
local function set_config_files()
	for _, config in ipairs(configs) do
		local dir_exist = io.open(dir .. config)
		if dir_exist then
			print(config .. " Configuration exist")
		else
			os.execute("cp -r " .. config .. " " .. dir .. config)
		end
	end
end
--]]

--[[
    Lsp installation
    Catch error if missing node ]]
local function execute_lsp_install()
	if pcall(lsp_install) then
		print("Success Installation!")
	else
		print("Missing Dependencies")
	end
end
--]]

--[[
-- Display menu
--]]
local function display_menu()
	io.write("\27[32m [0] - Set config files \27[0m\n") -- green color
	io.write("\27[34m [1] - Install Lsp (Language Server Protocol)\27[0m\n") -- blue color
	io.write("\27[33m [2] - Update config files (wip)\27[0m\n") -- yellow color
	io.write("\27[31m [3] - Exit\27[0m\n") -- red color
end
--]]

--[[
-- Execute CHoice
--]]
local function execute_choice()
	while true do
		display_menu()
		io.write("Enter your choice: ")
		local selection = io.read()
		if selection == "0" then
			set_config_files()
		elseif selection == "1" then
			execute_lsp_install()
		elseif selection == "3" then
			break
		end
	end
end
--]]

--[[
  #Main
--]]
execute_choice()
