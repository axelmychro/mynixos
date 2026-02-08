{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "git-firefly"
      "wakatime"

      "nix"
      "toml"
    ];
    userSettings = {
      prettier = {
        allowed = true;

        trailingComma = "none";
        tabWidth = 2;
        semi = false;
        singleQuote = true;
      };

      disable_ai = true;

      terminal = {
        toolbar.breadcrumbs = false;
        cursor_shape = "underline";
      };

      project_panel = {
        drag_and_drop = true;
        hide_hidden = false;
        hide_root = true;
        indent_size = 20.0;
        git_status = true;
        folder_icons = true;
        file_icons = true;
        entry_spacing = "standard";
        hide_gitignore = false;
        default_width = 240.0;
        dock = "right";
      };

      bottom_dock_layout = "full";

      tabs = {
        close_position = "left";
        file_icons = true;
        git_status = true;
      };

      tab_bar.show = true;

      title_bar = {
        show_menus = false;
        show_branch_icon = true;
      };

      show_whitespaces = "all";
      use_auto_surround = true;
      use_autoclose = true;
      ensure_final_newline_on_save = true;
      remove_trailing_whitespace_on_save = true;
      format_on_save = "on";

      indent_guides = {
        background_coloring = "disabled";
        coloring = "fixed";
        line_width = 2;
        active_line_width = 4;
      };

      preferred_line_length = 80;
      auto_indent_on_paste = true;
      auto_indent = true;
      tab_size = 2;

      toolbar.breadcrumbs = true;

      autosave.after_delay.milliseconds = 0;

      selection_highlight = true;
      rounded_selection = true;
      hide_mouse = "on_typing_and_movement";

      cursor_shape = "underline";
      cursor_blink = true;
      multi_cursor_modifier = "alt";

      ui_font_size = 20.0;
      ui_font_family = "UbuntuSans Nerd Font";

      buffer_line_height = "comfortable";
      buffer_font_size = 20.0;
      buffer_font_family = "FiraCode Nerd Font";
      buffer_font_features.calt = true;

      restore_on_startup = "launchpad";

      session = {
        trust_all_worktrees = false;
        restore_unsaved_buffers = true;
      };

      when_closing_with_no_tabs = "close_window";
      on_last_window_closed = "quit_app";

      redact_private_values = true;
      use_system_prompts = false;
      use_system_path_prompts = false;

      icon_theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };

      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

  };
}
