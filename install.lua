-- Install lsp
-- This script is missing the node installation: WIP
-- working in progress
local os = require("os")

-- Installation
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

-- Catch error if missing node
if pcall(setup) then
	print("Success")
else
	print("Please install nodejs")
end
