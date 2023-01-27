local os = require("os")
local dir = os.getenv("HOME") .. "/.config/"
local awesome_Dir = io.open(dir .. "awesome")
local nvim_Dir = io.open(dir .. "nvim")

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
    Check if awesome config exist
    Else copy copy config
    create a symbolic links ]]
if awesome_Dir then
	print(awesome_Dir .. "Exist")
else
	os.execute("cp -r awesome " .. dir)
end

os.execute("ln -s " .. "awesome" .. " " .. awesome_Dir)
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
os.execute("ln -s " .. "nvim" .. " " .. nvim_Dir)
--]]

--[[
    Lsp installation
    Catch error if missing node ]]
if pcall(lsp_install) then
	print("Success installation!")
else
	print("Missing dependencies")
end
--]]
