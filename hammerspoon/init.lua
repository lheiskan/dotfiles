-- Load necessary Hammerspoon modules
local openAppAndSendKeys = require("openAppAndSendKeys")

-- NOTE: eventName, params are the two parameters for the function callback
hs.urlevent.bind("someAlert", function(_, _)
	hs.alert.show("Received someAlert")
end)

-- activate terminal and send tmux command to load daily note
hs.urlevent.bind("daily-note", function(_, _)
	openAppAndSendKeys("Ghostty", {
		-- {key="f", modifiers={"cmd", "alt", "ctrl", "shift"},
		{ key = "b", modifiers = { "ctrl" } },
		{ key = "1", modifiers = {} },
	})
end)

-- activate terminal and send tmux command to load karabiner rules
hs.urlevent.bind("karabiner-rules", function(_, _)
	openAppAndSendKeys("Ghostty", {
		-- {key="f", modifiers={"cmd", "alt", "ctrl", "shift"},
		{ key = "b", modifiers = { "ctrl" } },
		{ key = "2", modifiers = {} },
	})
end)
