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
for _, config in ipairs(configs) do
	local dir_exist = io.open(dir .. config)
	if dir_exist then
		print(config .. " Configuration exist")
	else
		os.execute("cp -r " .. config .. " " .. dir .. config)
	end
	-- os.execute("ln -s " .. Dir .. config .. "/*" .. " " .. config)
end
--]]

--[[
    Lsp installation
    Catch error if missing node ]]
if pcall(lsp_install) then
	print("Success Installation!")
else
	print("Missing Dependencies")
end
--]]
