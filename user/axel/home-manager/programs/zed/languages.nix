_: {
  programs.zed-editor = {
    extensions = [
      "nix"
      "toml"
      "ini"
    ];

    userSettings.languages = {
      "Nix" = {
        language_servers = [ "nixd" ];
        formatter.external.command = "nixfmt";
      };

      "Shell Script" = {
        formatter.external = {
          command = "shfmt";
          arguments = [
            "-s"
            "-i"
            "2"
            "-ci"
            "-sr"
          ];
        };
      };

      "C" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };
      "C++" = {
        language_servers = [ "clangd" ];
        formatter.external.command = "clang-format";
      };

      "Python" = {
        language_servers = [
          "pyright"
          "ruff"
        ];
        formatter.language_server.name = "ruff";
      };
    };
  };
}
