hs.hotkey.bind({ "command" }, "`", function()
	local app = hs.application.get("alacritty")
	if app then
		if not app:mainWindow() then
			app:selectMenuItem({ "alacritty", "New OS window" })
		elseif app:isFrontmost() then
			app:hide()
		else
			app:activate()
		end
	else
		hs.application.launchOrFocus("alacritty")
	end
end)
