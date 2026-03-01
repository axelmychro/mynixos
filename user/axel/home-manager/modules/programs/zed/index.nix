_: {
  programs.zed-editor = {
    enable = true;

    extensions = [
      "git-firefly"
      "wakatime"

    ];

    userSettings = {
      disable_ai = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      autosave.after_delay.milliseconds = 0;
      format_on_save = "on";

      restore_on_startup = "launchpad";
      session = {
        trust_all_worktrees = false;
        restore_unsaved_buffers = true;
      };

      prettier = {
        allowed = true;
        trailingComma = "none";
        tabWidth = 2;
        semi = false;
        singleQuote = true;
      };

      use_auto_surround = true;
      use_autoclose = true;
      ensure_final_newline_on_save = true;
      remove_trailing_whitespace_on_save = true;

      auto_indent = true;
      auto_indent_on_paste = true;

      cursor_blink = true;
      cursor_shape = "underline";
      hide_mouse = "on_typing_and_movement";
      multi_cursor_modifier = "alt";

      when_closing_with_no_tabs = "close_window";
      on_last_window_closed = "quit_app";

      tab_size = 2;
      preferred_line_length = 80;

      redact_private_values = true;
      use_system_prompts = false;
      use_system_path_prompts = false;
    };
  };

  imports = [
    ./editor.nix
    ./languages.nix
    ./layout.nix
    ./terminal.nix
    ./theme.nix
  ];
}
