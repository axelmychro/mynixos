{ ... }:
{
  programs.zed-editor.userSettings = {
    show_whitespaces = "all";

    selection_highlight = true;
    rounded_selection = true;

    indent_guides = {
      background_coloring = "disabled";
      coloring = "fixed";
      line_width = 2;
      active_line_width = 4;
    };

    buffer_font_size = 20.0;
    buffer_font_family = "FiraCode Nerd Font";
    buffer_font_features.calt = true;
    buffer_line_height = "comfortable";
  };
}
