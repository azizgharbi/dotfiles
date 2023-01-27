local os = require("os")
local dir = os.getenv("HOME") .. "/.config/"
local awesome_Dir = io.open(dir .. "awesome")
local nvim_Dir = io.open(dir .. "nvim")

-- Setup function
local function setup()
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
    Check if awesome config exist
    Else copy copy config
    create a symbolic links ]]
if awesome_Dir then
	print(awesome_Dir .. "Exist")
else
	os.execute("cp -r awesome " .. dir)
end
--]]

--[[ 
    Check if nvim config exist
    Else copy copy config
    create a symbolic links ]]
if nvim_Dir then
	print(nvim_Dir .. "Exist")
else
	os.execute("cp -r nvim " .. dir)
end
--]]

--[[
    Lsp installation
    Catch error if missing node ]]
if pcall(setup) then
	print("Success")
else
	print("Please install nodejs")
end
--]]
