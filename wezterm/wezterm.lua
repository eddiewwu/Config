local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ============================================================
-- Shell
-- ============================================================
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }

config.launch_menu = {
  { label = "Herdr", args = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i", "-c", "herdr" } },
  { label = "Git Bash", args = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" } },
  { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } },
  { label = "Command Prompt", args = { "cmd.exe" } },
}

-- ============================================================
-- Appearance (Catppuccin Mocha — matches nvim theme)
-- ============================================================
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  "JetBrains Mono", -- bundled with WezTerm, includes Nerd Font symbols fallback
  "Segoe UI Emoji",
})
config.font_size = 11.0
config.line_height = 1.1

config.window_decorations = "RESIZE"
config.window_padding = { left = 8, right = 8, top = 8, bottom = 4 }
config.initial_cols = 140
config.initial_rows = 36
config.window_background_opacity = 0.97

config.default_cursor_style = "SteadyBlock"
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32
config.show_new_tab_button_in_tab_bar = false

-- ============================================================
-- Performance / behavior
-- ============================================================
config.front_end = "WebGpu"
config.max_fps = 120
config.scrollback_lines = 10000
config.automatically_reload_config = true

-- ============================================================
-- Keys — leader Ctrl-Space, the same leader/prefix as the
-- tmux prefix and the Herdr prefix, so one key runs the whole
-- stack. Press Ctrl-Space twice to send a literal Ctrl-Space
-- through (Herdr/tmux prefix one level down, nvim-cmp
-- completion). Ctrl-a now reaches the shell untouched
-- (readline beginning-of-line).
-- ============================================================
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }

config.keys = {
  -- Passthrough: Leader Ctrl-Space sends real Ctrl-Space down a level
  { key = "Space", mods = "LEADER|CTRL", action = act.SendKey({ key = "Space", mods = "CTRL" }) },

  -- Splits (tmux-style)
  { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

  -- Pane navigation (vim-style)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- Pane resize
  { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

  -- Pane zoom / close
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

  -- Tabs
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "&", mods = "LEADER|SHIFT", action = act.CloseCurrentTab({ confirm = true }) },

  -- Copy mode / search (leader-[ like tmux)
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "f", mods = "LEADER", action = act.Search({ CaseInSensitiveString = "" }) },

  -- Launcher (shells) / command palette
  { key = "Space", mods = "LEADER", action = act.ShowLauncher },
  { key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
}

-- Leader 1-9 jumps to tab
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

-- ============================================================
-- Status: show LEADER indicator top-right
-- ============================================================
wezterm.on("update-right-status", function(window, _)
  if window:leader_is_active() then
    window:set_right_status(wezterm.format({
      { Foreground = { Color = "#f9e2af" } },
      { Text = " LEADER " },
    }))
  else
    window:set_right_status("")
  end
end)

return config
