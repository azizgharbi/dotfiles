local os = require("os")
local dir = os.getenv("HOME") .. "/.config/"
local configs = { "awesome", "nvim" }
local os_type = os.getenv("OS_TYPE")
--[[ 
    check if macoc
--]]
local function is_macos()
	return os_type == "macOS"
end

--]]

-- Setup function
local function lsp_install()
	if is_macos() then
		os.execute("brew install xsel ripgrep")
	else
		os.execute("sudo pacman -S xsel ripgrep")
	end
	os.execute("sudo npm i -g typescript-language-server typescript-language-server gopls vls")
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
    Update Configurations
  ]]
local function update_dotfiles()
	for _, config in ipairs(configs) do
		os.execute("rm -rf " .. config)
		os.execute("mv " .. dir .. config .. " ~/dotfiles/")
	end
	-- set the updated config files
	set_config_files()
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
-- Colors using: ANSI escape codes 
--]]
local function display_menu()
	io.write("\27[32m [0] - Set config files \27[0m\n") -- green color
	io.write("\27[34m [1] - Install Lsp (Language Server Protocol)\27[0m\n") -- blue color
	io.write("\27[33m [2] - Update dotfiles\27[0m\n") -- yellow color
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
		elseif selection == "2" then
			update_dotfiles()
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
