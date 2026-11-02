local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local triple = wezterm.target_triple

if triple:match('windows') then
    config.default_prog = { 'pwsh.exe' }
    config.initial_cols = 140
    config.initial_rows = 40
    config.font_size = 12
    config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'

    wezterm.on('gui-startup', function(cmd)
        local _, _, mux_window = wezterm.mux.spawn_window(cmd or {})
        local gui_window = mux_window:gui_window()
        local screen = wezterm.gui.screens().active
        local dimensions = gui_window:get_dimensions()

        gui_window:set_position(
            screen.x + math.floor((screen.width - dimensions.pixel_width) / 2),
            screen.y + math.floor((screen.height - dimensions.pixel_height) / 2)
        )

        return mux_window
    end)
elseif triple:match('darwin') then
    config.default_prog = { 'zsh', '-l' }
    config.font_size = 12
    config.font = wezterm.font 'Hack Nerd Font'
elseif triple:match('linux') then
    config.default_prog = { 'bash', '-l' }
    config.font_size = 12
    config.font = wezterm.font 'Hack Nerd Font'
else
    config.default_prog = { 'bash', '-l' }
    config.font_size = 12
    config.font = wezterm.font 'Hack Nerd Font'
end

config.color_scheme = 'Slate'

config.window_decorations = 'TITLE | RESIZE'
config.window_background_opacity = 0.95
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.window_padding = {
    left = 4,
    right = 4,
    top = 2,
    bottom = 2,
}

config.default_cursor_style = 'BlinkingBlock'

return config
