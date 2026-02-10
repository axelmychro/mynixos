{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#c6d0f5";
      background = "#303446";
      selection_foreground = "#303446";
      selection_background = "#f2d5cf";

      cursor = "#f2d5cf";
      cursor_text_color = "#303446";

      url_color = "#f2d5cf";

      active_border_color = "#babbf1";
      inactive_border_color = "#737994";
      bell_border_color = "#e5c890";
      active_tab_foreground = "#232634";
      active_tab_background = "#ca9ee6";
      inactive_tab_foreground = "#c6d0f5";
      inactive_tab_background = "#292c3c";
      tab_bar_background = "#232634";

      color0 = "#51576d";
      color8 = "#626880"; # Black
      color1 = "#e78284";
      color9 = "#e78284"; # Red
      color2 = "#a6d189";
      color10 = "#a6d189"; # Green
      color3 = "#e5c890";
      color11 = "#e5c890"; # Yellow
      color4 = "#8caaee";
      color12 = "#8caaee"; # Blue
      color5 = "#f4b8e4";
      color13 = "#f4b8e4"; # Magenta
      color6 = "#81c8be";
      color14 = "#81c8be"; # Cyan
      color7 = "#b5bfe2";
      color15 = "#a5adce"; # White

      font_family = "FiraCode Nerd Font";
      font_size = "12";
      cursor_shape = "underline";
      scrollback_lines = 10000;
      repaint_delay = 30;
      input_delay = 5;
      remember_window_size = "no";
      initial_window_width = "128c";
      initial_window_height = "32c";
      window_padding_width = 8;
      background_opacity = "0.9";

      wayland_titlebar_color = "system";
    };
  };
}
