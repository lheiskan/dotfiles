-- Wrapper script to allow launching tmux keyboard shortcuts from Karabiner-Elements
--
-- Uses hammerspoon apis to activate the terminal app and to send keyAndModifiers to the terminal
-- Requires that terminal is already running a tmux session
--
-- Load necessary Hammerspoon modules
local application = require("hs.application")
local timer = require("hs.timer")
local eventtap = require("hs.eventtap")
local keycode = require("hs.keycodes")

-- Function to open an app and perform keyboard actions
function openAppAndSendKeys(appName, keyModifierList)
	-- Launch the app
	local app = application.launchOrFocus(appName)

	-- Wait for app to fully launch and become active
	timer.doAfter(1, function()
		-- Get a fresh reference to ensure we have the running instance
		app = application.find(appName)
		if app then
			-- Focus the app
			app:activate()

			-- delay to ensure the app is focused
			timer.usleep(300000) -- 300ms delay

			-- send each key and it's modifiers to the app
			for _, combo in ipairs(keyModifierList) do
				-- Access the key and modifiers for each tuple
				local key = combo.key
				local mods = combo.modifiers

				timer.usleep(3 - 000) -- 30ms delay

				hs.eventtap.keyStroke(mods, key)
			end

		-- enter tmux command mode
		-- eventtap.keyStroke({"ctrl"}, "b")
		-- timer.usleep(30000) -- 30ms delay

		-- send the actual custom action key events
		--eventtap.keyStroke({}, "1")
		else
			print("Failed to find application: " .. appName)
		end
	end)
end

-- Example usage: Open Terminal and send Cmd+Opt+Ctrl+Shift+F
return openAppAndSendKeys
