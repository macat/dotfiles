hs.hotkey.bind({"alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w * 0.6
  f.y = max.y
  f.w = max.w * 0.4
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.6
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"alt", "cmd"}, "j", function()
  hs.application.launchOrFocus("iTerm")
end)
hs.hotkey.bind({"alt", "cmd"}, "k", function()
  hs.application.launchOrFocus("Firefox")
end)
hs.hotkey.bind({"alt", "cmd"}, "l", function()
  hs.application.launchOrFocus("Slack")
end)
hs.hotkey.bind({"alt", "cmd"}, "m", function()
  hs.application.launchOrFocus("Telegram")
end)
hs.hotkey.bind({"alt", "cmd"}, "i", function()
  hs.application.launchOrFocus("Windows 10")
end)


hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool:start()


