local yabai = require "yabai"

hs.application.watcher
  .new(function(app, eventType)
    yabai.handler(app, eventType)
  end)
  :start()

-- install hammerspoon cli
hs.ipc.cliInstall "/opt/homebrew/"

-- show hide kitty
hs.hotkey.bind({ "command" }, "`", function()
  local app = hs.application.get "kitty"
  if app then
    if not app:mainWindow() then
      app:selectMenuItem { "kitty", "New OS window" }
    elseif app:isFrontmost() then
      app:hide()
    else
      app:activate()
    end
  else
    hs.application.launchOrFocus "kitty"
  end
end)
