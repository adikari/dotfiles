local hotkeys = hs.hotkey.modal.new({ "cmd", "shift", "alt" }, "F19")
hotkeys:enter()

local yabai = {}

function yabai.handler(app, eventType)
	if app == "Alacritty" then
		if eventType == hs.application.watcher.activated then
			hotkeys:exit()
		elseif eventType == hs.application.watcher.deactivated then
			hotkeys:enter()
		end
	end
end

local function execute(args)
	hs.task
		.new("/opt/homebrew/bin/yabai", nil, function(_, ...)
			print("stream", hs.inspect(table.pack(...)))
			return true
		end, args)
		:start()
end

local function ctrl(key, commands)
	hotkeys:bind({ "ctrl" }, key, function()
		execute(commands)
	end)
end

local function commandCtrl(key, commands)
	hotkeys:bind({ "command", "ctrl" }, key, function()
		execute(commands)
	end)
end

ctrl("d", { "-m", "window", "--toggle", "zoom-parent" })
ctrl("f", { "-m", "window", "--toggle", "zoom-fullscreen" })
ctrl("r", { "-m", "space", "--rotate", "90" })
ctrl("h", { "-m", "space", "--mirror", "y-axis" })
ctrl("t", { "-m", "window", "--toggle", "float", "--grid", "4:4:1:1:2:2" })
ctrl("e", { "-m", "window", "--toggle", "split" })

ctrl("j", { "-m", "window", "--focus", "west" })
ctrl("k", { "-m", "window", "--focus", "south" })
ctrl("i", { "-m", "window", "--focus", "north" })
ctrl("l", { "-m", "window", "--focus", "east" })

commandCtrl("j", { "-m", "window", "--swap", "west" })
commandCtrl("k", { "-m", "window", "--swap", "south" })
commandCtrl("i", { "-m", "window", "--swap", "north" })
commandCtrl("l", { "-m", "window", "--swap", "east" })

return yabai
