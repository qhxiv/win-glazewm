local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
local theme = require("lua/vague")

config.default_prog = { "pwsh" }
config.audible_bell = "Disabled"

-- UI options
-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 4,
	top = 4,
	right = 4,
	bottom = 4,
}
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.colors = theme.colors()
config.font = wezterm.font("AdwaitaMono Nerd Font")
config.font_size = 11
-- config.freetype_load_target = "HorizontalLcd"

-- Keymaps
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = {
	{
		mods = "LEADER",
		key = "c",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "[",
		action = act.ActivateCopyMode,
	},
	{
		mods = "LEADER",
		key = "x",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = ",",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		mods = "CTRL",
		key = "h",
		action = act.ActivateTabRelative(-1),
	},
	{
		mods = "CTRL",
		key = "l",
		action = act.ActivateTabRelative(1),
	},
	{
		mods = "CTRL|ALT",
		key = "h",
		action = act.MoveTabRelative(-1),
	},
	{
		mods = "CTRL|ALT",
		key = "l",
		action = act.MoveTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "'",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = act.AdjustPaneSize({ "Left", 6 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
}
for i = 1, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
