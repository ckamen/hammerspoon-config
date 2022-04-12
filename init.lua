print('============================')

-- require("hs.ipc")
-- hs.ipc.cliInstall()

-- Reload Configuration after init.lua changed
-- myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()


hyper = { "ctrl", "alt", "cmd" }
shift_hyper = { "shift", "ctrl", "alt", "cmd" }


hs.hotkey.bind({"alt"}, "w", function()
  hs.application.open('WeChat')
end)

-- open Finder
hs.hotkey.bind({"alt"}, "`", function()
  hs.execute('open ~')
end)

hs.hotkey.bind({"alt"}, "1", function()
  hs.execute('open ~/Downloads')
end)

--
hs.hotkey.bind({"ctrl"}, "1", function()
  hs.application.open('Google Chrome')
end)

hs.hotkey.bind({"ctrl"}, "2", function()
  hs.application.open('IntelliJ IDEA')
end)

hs.hotkey.bind({"ctrl"}, "3", function()
  hs.application.open('WizNote')
end)

hs.hotkey.bind({"ctrl"}, "5", function()
  -- copy
  hs.eventtap.keyStroke({"cmd"}, "c")  

  hs.application.launchOrFocus('/Applications/网易有道词典.app')
  -- 清除输入框
  hs.eventtap.keyStroke({"cmd"}, hs.keycodes.map["delete"])  
  local content = hs.pasteboard.getContents() 
  hs.eventtap.keyStrokes(content)
end)

hs.hotkey.bind({"ctrl"}, "F1", function()
  hs.application.open('Hotspot Shield')
end)

hs.hotkey.bind({"ctrl"}, "F2", function()
  hs.application.open('iTerm')
end)

hs.hotkey.bind({"ctrl"}, "`", function()
  hs.application.open('Sublime Text')
end)

hs.hotkey.bind({"ctrl", "cmd"}, "f", function()
  local win = hs.window.focusedWindow()
  win:toggleFullScreen()
end)


hs.hotkey.bind(hyper, "n", function()
  hs.application.open('Activity Monitor')
end)


hs.hotkey.bindSpec({ hyper, "y" }, hs.toggleConsole)
hs.hotkey.bindSpec({ hyper, "r" }, hs.reload)




function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()




