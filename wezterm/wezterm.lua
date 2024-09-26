-- Pull in the wezterm API
local wezterm = require 'wezterm'
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- Startup script
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    local screen = wezterm.gui.screens().main
    local padding = screen.height / 20
    window:gui_window():set_position(padding, padding)
    window:gui_window():set_inner_size(screen.width - (padding * 2), screen.height - (padding * 2 + 30))
end)

-- This is where you actually apply your config choices
config.default_prog = { 'C:\\Users\\Angel\\.cargo\\bin\\nu.exe', '-l' } -- Crash for obscure reasons
config.enable_tab_bar = false
config.allow_win32_input_mode = false
config.enable_kitty_keyboard = true
-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
-- config.window_background_opacity = 0.5
-- config.win32_system_backdrop = 'Acrylic'

config.font = wezterm.font 'VictorMono Nerd Font'
config.font_size = 15
config.window_decorations = "RESIZE"
config.leader = { key = "x", mods = "CTRL", timeout_milliseconds = 5000 }
config.keys = {
    {
        mods = "LEADER",
        key = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods = "LEADER",
        key = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods = "LEADER|SHIFT",
        key = "N",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods = "LEADER",
        key = "n",
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods = "LEADER",
        key = "|",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods = "LEADER",
        key = "-",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods = "CTRL",
        key = "t",
        action = act.ActivateLastTab,
    },
    {
        mods = "CTRL|SHIFT",
        key = "h",
        action = act.Multiple {
            act.CloseCurrentPane { confirm = false },
            act.ActivatePaneDirection 'Left',
        },
    },
    {
        mods = "CTRL|SHIFT",
        key = "j",
        action = act.Multiple {
            act.CloseCurrentPane { confirm = false },
            act.ActivatePaneDirection 'Down',
        },
    },
    {
        mods = "CTRL|SHIFT",
        key = "k",
        action = act.Multiple {
            act.CloseCurrentPane { confirm = false },
            act.ActivatePaneDirection 'Up',
        },
    },
    {
        mods = "CTRL|SHIFT",
        key = "l",
        action = act.Multiple {
            act.CloseCurrentPane { confirm = false },
            act.ActivatePaneDirection 'Right',
        },
    },
    {
        mods = "ALT|SHIFT",
        key = "h",
        action = act.SplitPane {
            direction = 'Left',
        },
    },
    {
        mods = "ALT|SHIFT",
        key = "j",
        action = act.SplitPane {
            direction = 'Down',
        },
    },
    {
        mods = "ALT|SHIFT",
        key = "k",
        action = act.SplitPane {
            direction = 'Up',
        },
    },
    {
        mods = "ALT|SHIFT",
        key = "l",
        action = act.SplitPane {
            direction = 'Right',
        },
    },
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
}

smart_splits.apply_to_config(config, {
    -- the default config is here, if you'd like to use the default keys,
    -- you can omit this configuration table parameter and just use
    -- smart_splits.apply_to_config(config)

    -- directional keys to use in order of: left, down, up, right
    direction_keys = { 'h', 'j', 'k', 'l' },
    -- if you want to use separate direction keys for move vs. resize, you
    -- can also do this:
    -- direction_keys = {
    --     move = { 'h', 'j', 'k', 'l' },
    --     resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
    -- },
    -- modifier keys to combine with direction_keys
    modifiers = {
        move = 'CTRL',  -- modifier to use for pane movement, e.g. CTRL+h to move left
        resize = 'ALT', -- modifier to use for pane resize, e.g. META+h to resize to the left
    },
})
-- and finally, return the configuration to wezterm
return config
