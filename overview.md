# Overview

Generated on: Sun Feb 15 06:09:29 PM WIB 2026

## mynixos

### flake.nix
```nix
{
  description = "my chemical rebuild";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-flatpak,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "axel";
    in
    {
      nixosConfigurations.mychro = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit username; };

        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              backupFileExtension = "backup";
              users.${username} = import ./home-manager/home.nix;
              extraSpecialArgs = {
                inherit username;
              };
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          {
            nixpkgs.overlays = [ inputs.millennium.overlays.default ];
          }
        ];
      };
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}

```

## ./home-manager

### home.nix
```nix
{
  username,
  ...
}:
{
  home = {
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  xdg.enable = true;
  imports = [
    ./modules/bash/index.nix
    ./modules/plasma-manager/plasma.nix
    ./modules/mimeapps/index.nix
    ./modules/programs/index.nix
  ];
}

```

## ./home-manager/modules/bash/functions

### cpprun.sh
```bash
# shellcheck shell=bash

cpprun() {
  [ -z "$1" ] && {
    echo "usage: cpprun <file.cpp>"
    return 1
  }
  [ ! -f "$1" ] && {
    echo "cpprun: file not found: $1"
    return 1
  }
  [[ "$1" != *.cpp ]] && {
    echo "cpprun: only .cpp files allowed"
    return 1
  }
  file="${1%.*}"
  g++ "$1" -Wall -Wextra -std=c++20 -o "$file" && "./$file"
}

```

### crun.sh
```bash
# shellcheck shell=bash

crun() {
  [ -z "$1" ] && {
    echo "usage: crun <file.c>"
    return 1
  }
  [ ! -f "$1" ] && {
    echo "crun: file not found: $1"
    return 1
  }
  [[ "$1" != *.c ]] && {
    echo "crun: only .c files allowed"
    return 1
  }
  file="${1%.*}"
  gcc "$1" -Wall -Wextra -std=c23 -o "$file" && "./$file"
}

```

### index.nix
```nix
_: {
  programs.bash.initExtra = ''
    ${builtins.readFile ./my.sh}

    ${builtins.readFile ./cpprun.sh}
    ${builtins.readFile ./crun.sh}
    ${builtins.readFile ./mcd.sh}
    ${builtins.readFile ./rm.sh}
  '';
}

```

### mcd.sh
```bash
# shellcheck shell=bash

mcd() {
  [[ -z "$1" ]] && return 1
  mkdir -p -- "$1" && cd -- "$1" || return
}

```

### my.sh
```bash
# shellcheck shell=bash

my() {
  case "$1" in
    "" | help | -h | --help)
      cat << 'EOF'
usage: my <command>

commands:
  status
  switch
  drun
  test
  undo
  update
  prune
  purge
  overview
EOF
      ;;
    status)
      fd -e nix -E hardware-configuration.nix -x nixfmt {}
      nix run nixpkgs#deadnix -- /etc/nixos
      nix run nixpkgs#statix -- check /etc/nixos
      echo "my: status: done"
      ;;
    switch)
      git add /etc/nixos &&
        fd -e nix -E hardware-configuration.nix -x nixfmt {} &&
        nix run nixpkgs#deadnix -- /etc/nixos &&
        nix run nixpkgs#statix -- check /etc/nixos &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro &&
        my overview
      reboot
      ;;
    drun)
      sudo nixos-rebuild dry-run --flake /etc/nixos#mychro
      ;;
    test)
      git add /etc/nixos &&
        sudo nixos-rebuild test --flake /etc/nixos#mychro
      ;;
    undo)
      sudo nixos-rebuild switch --rollback && reboot
      ;;
    update)
      git add /etc/nixos &&
        nix flake update &&
        sudo nixos-rebuild switch --flake /etc/nixos#mychro &&
        reboot
      ;;
    prune)
      echo "my: prune: delete generations older than 3 days"
      sudo nix-collect-garbage --delete-older-than 3d
      nix-collect-garbage -d
      echo "my: prune: collect store garbage"
      sudo nix-store --gc
      echo "my: prune: optimise store"
      sudo nix-store --optimise
      echo "my: prune: done"
      ;;
    purge)
      echo "my: purge: delete previous generation(s)"
      sudo nix-collect-garbage -d
      nix-collect-garbage -d
      echo "my: purge: collect store garbage"
      sudo nix-store --gc
      echo "my: purge: optimise store"
      sudo nix-store --optimise
      echo "my: purge: done"
      ;;
    overview)
      local root="/etc/nixos"
      local out="/etc/nixos/overview.md"
      rm -f "$out"
      {
        echo "# Overview"
        echo
        echo "Generated on: $(date)"
        echo

        fd -t f -e nix -e sh . "$root" \
          -E hardware-configuration.nix -E flake.lock | sort |
          while read -r file; do
            rel_dir=$(dirname "${file#$root/}")
            filename=$(basename "$file")
            ext="${file##*.}"
            lang="nix"
            [[ "$ext" == "sh" ]] && lang="bash"

            if [[ "$rel_dir" != "$last_dir" ]]; then
              if [[ "$rel_dir" == "." ]]; then
                echo "## mynixos"
                echo
              else
                echo "## ./${rel_dir}"
                echo
              fi
              last_dir="$rel_dir"
            fi
            echo "### $filename"
            echo "\`\`\`$lang"
            cat "$file"
            echo ""
            echo "\`\`\`"
            echo ""
          done
      } > "$out"
      echo "my: overview: created $out"
      ;;
    *)
      echo "my: $1: command not found"
      return 1
      ;;
  esac
}
_my_complete() {
  local cmds="status switch test drun undo update purge overview"
  mapfile -t COMPREPLY < <(compgen -W "$cmds" -- "${COMP_WORDS[1]}")
}
complete -F _my_complete my

```

### rm.sh
```bash
# shellcheck shell=bash

rm() {
  for arg in "$@"; do
    [[ "$arg" == "/" ]] && {
      echo "idiot."
      return 1
    }
  done
  command rm "$@"
}

```

## ./home-manager/modules/bash

### index.nix
```nix
_: {
  home.shell.enableBashIntegration = true;
  imports = [ ./functions/index.nix ];
  programs.bash = {
    enable = true;
    shellAliases = {
      bb = "exec bash";
      x = "exit";

      wd = "waydroid show-full-ui";
      wdx = "waydroid session stop";
    };
    initExtra = builtins.readFile ./init.sh;
  };
}

```

### init.sh
```bash
## !/usr/bin/env bash

[[ $- == *i* ]] && clear
[[ $SHLVL -eq 1 ]] && fastfetch
# eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.json)"

```

## ./home-manager/modules/mimeapps

### documents.nix
```nix
_: {
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "dev.zed.Zed.desktop" ];
    "text/markdown" = [ "dev.zed.Zed.desktop" ];
    "text/x-cmake" = [ "dev.zed.Zed.desktop" ];
    "application/json" = [ "dev.zed.Zed.desktop" ];
    "application/x-yaml" = [ "dev.zed.Zed.desktop" ];
    "application/x-docbook+xml" = [ "dev.zed.Zed.desktop" ];

    "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
  };
}

```

### index.nix
```nix
_: {
  xdg.mimeApps.enable = true;
  imports = [
    ./documents.nix
    ./internet.nix
    ./multimedia.nix
    ./utilities.nix
  ];
}

```

### internet.nix
```nix
_: {
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = [ "app.zen_browser.zen.desktop" ];
    "x-scheme-handler/https" = [ "app.zen_browser.zen.desktop" ];
  };
}

```

### multimedia.nix
```nix
_: {
  xdg.mimeApps.defaultApplications = {
    "image/jpeg" = [ "com.interversehq.qView.desktop" ];
    "image/png" = [ "com.interversehq.qView.desktop" ];
    "image/webp" = [ "com.interversehq.qView.desktop" ];
    "image/avif" = [ "com.interversehq.qView.desktop" ];
    "image/bmp" = [ "com.interversehq.qView.desktop" ];
    "image/heif" = [ "com.interversehq.qView.desktop" ];

    "audio/vnd.rn-realaudio" = [ "org.kde.haruna.desktop" ];
    "audio/x-ms-wma" = [ "org.kde.haruna.desktop" ];
    "audio/x-musepack" = [ "org.kde.haruna.desktop" ];
    "audio/x-pn-realaudio" = [ "org.kde.haruna.desktop" ];
    "audio/x-scpls" = [ "org.kde.haruna.desktop" ];
    "audio/x-speex" = [ "org.kde.haruna.desktop" ];

    "video/mp4" = [ "org.kde.haruna.desktop" ];
    "video/webm" = [ "org.kde.haruna.desktop" ];
    "video/quicktime" = [ "org.kde.haruna.desktop" ];
    "video/x-matroska" = [ "org.kde.haruna.desktop" ];
    "video/avi" = [ "org.kde.haruna.desktop" ];
    "video/x-msvideo" = [ "org.kde.haruna.desktop" ];
    "video/mpeg" = [ "org.kde.haruna.desktop" ];
    "video/ogg" = [ "org.kde.haruna.desktop" ];
    "video/3gp" = [ "org.kde.haruna.desktop" ];
    "video/3gpp" = [ "org.kde.haruna.desktop" ];
    "video/divx" = [ "org.kde.haruna.desktop" ];
    "video/mp2t" = [ "org.kde.haruna.desktop" ];
    "video/mp4v-es" = [ "org.kde.haruna.desktop" ];
    "video/msvideo" = [ "org.kde.haruna.desktop" ];
    "video/vnd.divx" = [ "org.kde.haruna.desktop" ];
    "video/x-avi" = [ "org.kde.haruna.desktop" ];
    "video/x-m4v" = [ "org.kde.haruna.desktop" ];
    "video/x-mpeg2" = [ "org.kde.haruna.desktop" ];
    "video/x-ms-wmv" = [ "org.kde.haruna.desktop" ];
    "video/x-ogm" = [ "org.kde.haruna.desktop" ];
    "video/x-ogm+ogg" = [ "org.kde.haruna.desktop" ];
    "video/x-theora" = [ "org.kde.haruna.desktop" ];
    "video/x-theora+ogg" = [ "org.kde.haruna.desktop" ];
  };
}

```

### utilities.nix
```nix
_: {
  xdg.mimeApps.defaultApplications = {
    "application/gzip" = [ "peazip.desktop" ];
    "application/vnd.ms-cab-compressed" = [ "peazip.desktop" ];
    "application/vnd.rar" = [ "peazip.desktop" ];
    "application/x-7z-compressed" = [ "peazip.desktop" ];
    "application/x-archive" = [ "peazip.desktop" ];
    "application/x-bzip" = [ "peazip.desktop" ];
    "application/x-bzip-compressed-tar" = [ "peazip.desktop" ];
    "application/x-cd-image" = [ "peazip.desktop" ];
    "application/x-compress" = [ "peazip.desktop" ];
    "application/x-compressed-tar" = [ "peazip.desktop" ];
    "application/x-cpio" = [ "peazip.desktop" ];
    "application/x-cpio-compressed" = [ "peazip.desktop" ];
    "application/x-docbook+xml" = [ " dev.zed.Zed.desktop" ];
    "application/x-iso9660-appimage" = [ "peazip.desktop" ];
    "application/x-lha" = [ "peazip.desktop" ];
    "application/x-lrzip-compressed-tar" = [ "peazip.desktop" ];
    "application/x-lz4-compressed-tar" = [ "peazip.desktop" ];
    "application/x-lzip-compressed-tar" = [ "peazip.desktop" ];
    "application/x-lzma" = [ "peazip.desktop" ];
    "application/x-lzma-compressed-tar" = [ "peazip.desktop" ];
    "application/x-rar" = [ "peazip.desktop" ];
    "application/x-source-rpm" = [ "peazip.desktop" ];
    "application/x-tar" = [ "peazip.desktop" ];
    "application/x-tarz" = [ "peazip.desktop" ];
    "application/x-tzo" = [ "peazip.desktop" ];
    "application/x-xar" = [ "peazip.desktop" ];
    "application/x-xz" = [ "peazip.desktop" ];
    "application/x-xz-compressed-tar" = [ "peazip.desktop" ];
    "application/x-yaml" = [ " dev.zed.Zed.desktop" ];
    "application/x-zstd-compressed-tar" = [ "peazip.desktop" ];
    "application/zip" = [ "peazip.desktop" ];
    "application/zstd" = [ "peazip.desktop" ];

    "x-scheme-handler/geo" = [ "openstreetmap-geo-handler.desktop" ];
  };
}

```

## ./home-manager/modules/plasma-manager/controlling

### index.nix
```nix
_: {
  imports = [
    ./iodevice.nix
    ./keybind.nix
    ./power.nix
  ];
}

```

### iodevice.nix
```nix
_: {
  programs.plasma = {
    input = {
      mice = [
        {
          vendorId = "046d";
          productId = "c077";
          name = "Logitech USB Optical Mouse";
          enable = true;
          acceleration = 1;
          accelerationProfile = "none";
          leftHanded = false;
          middleButtonEmulation = false;
          naturalScroll = false;
          scrollSpeed = 1;
        }
      ];
      keyboard.numlockOnStartup = "on";
    };
  };
}

```

### keybind.nix
```nix
_: {
  programs.plasma = {
    shortcuts = {
      kwin = {
        "Window Fullscreen" = "";
        "Window Maximize" = "F11";
      };
      "services/kitty.desktop" = {
        "_launch" = "Meta+Return";
      };
    };
  };
}

```

### power.nix
```nix
_: {
  programs.plasma = {
    powerdevil = {
      AC = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 1200; # 20 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 600; # 20 mins
        };
        displayBrightness = null;
        powerButtonAction = "nothing";
        powerProfile = "balanced";
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = 20;
        };
        whenLaptopLidClosed = "doNothing";
      };
      battery = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 600; # 10 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 150;
        };
        displayBrightness = null;
        powerButtonAction = "nothing";
        powerProfile = "powerSaving";
        turnOffDisplay = {
          idleTimeout = 300;
          idleTimeoutWhenLocked = 20;
        };
        whenLaptopLidClosed = "sleep";
      };
      lowBattery = {
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 300; # 20 mins
        };
        dimDisplay = {
          enable = true;
          idleTimeout = 75;
        };
        displayBrightness = null;
        powerButtonAction = "shutDown";
        powerProfile = "powerSaving";
        turnOffDisplay = {
          idleTimeout = 150;
          idleTimeoutWhenLocked = "immediately";
        };
        whenLaptopLidClosed = "shutDown";
      };
    };
  };
}

```

## ./home-manager/modules/plasma-manager/interface

### desktop.nix
```nix
_:
let
  sans = "UbuntuSans Nerd Font";
  code = "FiraCode Nerd Font";
in
{
  programs.plasma = {
    workspace = {
      wallpaper = ../assets/desktop.jpg;
      lookAndFeel = null;
      colorScheme = "CatppuccinFrappe";
      theme = null; # plasma style. null = default
      windowDecorations = {
        theme = "Breeze";
        library = "org.kde.breeze";
      };
      iconTheme = "breeze-dark";
      cursor = {
        animationTime = 5;
        cursorFeedback = "Bouncing";
        size = 36;
        taskManagerFeedback = true;
        theme = "Breeze_Light";
      };
      soundTheme = "ocean";
    };
    desktop.widgets = [
      {
        digitalClock = {
          position = {
            horizontal = 16;
            vertical = 16;
          };
          size = {
            width = 128;
            height = 128;
          };
          date.format = {
            custom = "ddd, d MMM";
          };
          calendar.firstDayOfWeek = "monday";
        };
      }
    ];

    kscreenlocker.appearance = {
      wallpaper = ../assets/lock.jpg;
      alwaysShowClock = true;
      showMediaControls = true; # for spotify too
    };
    fonts = {
      general = {
        family = sans;
        pointSize = 12;
      };
      fixedWidth = {
        family = code;
        pointSize = 12;
      };
      small = {
        family = sans;
        pointSize = 10;
      };
      toolbar = {
        family = sans;
        pointSize = 12;
      };
      menu = {
        family = sans;
        pointSize = 12;
      };
      windowTitle = {
        family = sans;
        pointSize = 12;
      };
    };
  };
}

```

### index.nix
```nix
_: {
  imports = [
    ./desktop.nix
    ./panels.nix
    ./window.nix
  ];
}

```

### panels.nix
```nix
_:
let
  browser = "app.zen_browser.zen.desktop";
  editor = "dev.zed.Zed.desktop";
in
{
  programs.plasma = {
    panels = [
      {
        alignment = "right";
        floating = false;
        height = 48;
        hiding = "none";
        lengthMode = "fill";
        location = "right";
        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake";
            };
          }
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [
                "applications:${browser}"
                "applications:${editor}"
              ];
            };
          }
          {
            systemTray = {
              items = {
                shown = [
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.battery"
                ];
                hidden = [
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.volume"
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.mediacontrol"
                  "org.kde.plasma.brightness"
                ];
              };
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
  };
}

```

### window.nix
```nix
_: {
  programs.plasma = {
    kwin.titlebarButtons = {
      left = [
        "close"
        "maximize"
        "minimize"
      ];
      right = [ ]; # note: null value is actually default. leave an empty string instead
    };
  };
}

```

## ./home-manager/modules/plasma-manager

### plasma.nix
```nix
_: {
  programs.plasma = {
    enable = true;
    overrideConfig = true;
  };
  imports = [
    ./controlling/index.nix
    ./interface/index.nix
    ./workflow/session.nix
  ];
}

```

## ./home-manager/modules/plasma-manager/workflow

### index.nix
```nix
_: { import = [ ./session.nix ]; }

```

### session.nix
```nix
_: {
  programs.plasma = {
    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
    kscreenlocker = {
      lockOnResume = true; # resume = after sleep
      timeout = 5; # minutes before screen is locked
    };
    krunner = {
      activateWhenTypingOnDesktop = true;
      historyBehavior = "disabled";
      position = "top";
    };
    configFile.kdeglobals = {
      General = {
        TerminalApplication = "kitty";
        TerminalService = "kitty.desktop";
      };
    };
  };
}

```

## ./home-manager/modules/programs

### direnv.nix
```nix
_: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}

```

## ./home-manager/modules/programs/fastfetch

### index.nix
```nix
_: {
  programs.fastfetch.enable = true;
  xdg.configFile = {
    "fastfetch" = {
      source = ./config;
      recursive = true;
    };
  };
}

```

## ./home-manager/modules/programs

### git.nix
```nix
_: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Axel";
        email = "axelmychro@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}

```

### index.nix
```nix
_: {
  imports = [
    ./fastfetch/index.nix
    ./oh-my-posh/index.nix
    ./zed/index.nix
    ./direnv.nix
    ./git.nix
    ./kitty.nix
  ];
}

```

### kitty.nix
```nix
_: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableBashIntegration = false; # let oh-my-posh handle the window title

    settings = {
      shell = "bash";
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

```

## ./home-manager/modules/programs/oh-my-posh

### index.nix
```nix
_: {
  programs.oh-my-posh = {
    enable = true;
    configFile = ./config.json;
  };
}

```

## ./home-manager/modules/programs/wakatime

### index.nix
```nix
_: {
  home.file.".wakatime.cfg".source = ./wakatime.cfg;
}

```

## ./home-manager/modules/programs/zed

### editor.nix
```nix
_: {
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

```

### index.nix
```nix
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

```

### languages.nix
```nix
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

```

### layout.nix
```nix
_: {
  programs.zed-editor.userSettings = {
    title_bar = {
      show_menus = false;
      show_branch_icon = true;
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

    tab_bar.show = true;
    tabs = {
      close_position = "left";
      file_icons = true;
      git_status = true;
    };
    toolbar.breadcrumbs = true;
  };
}

```

### terminal.nix
```nix
_: {
  programs.zed-editor.userSettings = {
    bottom_dock_layout = "full";
    terminal = {
      shell = {
        program = "bash";
      };
      toolbar.breadcrumbs = false;
      font_family = "FiraCode Nerd Font";
      cursor_shape = "underline";
    };
  };
}

```

### theme.nix
```nix
_: {
  programs.zed-editor = {
    extensions = [
      "catppuccin"
      "catppuccin-icons"
    ];
    userSettings = {
      ui_font_size = 20.0;
      ui_font_family = "UbuntuSans Nerd Font";

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
    };
  };
}

```

## ./nixos

### configuration.nix
```nix
{
  username,
  pkgs,
  ...
}:
{
  system = {
    stateVersion = "25.11";
    nixos.label = "fallen-angel";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_12;
    kernelModules = [ "ideapad_laptop" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "mychro";
    networkmanager.enable = true;
  };
  time.timeZone = "Asia/Jakarta";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
  programs = {
    nix-ld.enable = true;
    appimage.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
  };
  services.fwupd.enable = true; # linux FOSS firmware update daemon
  zramSwap.enable = true; # 50% by default

  imports = [
    ./hardware-configuration.nix

    ./modules/hardware/index.nix
    ./modules/programs/index.nix
    ./modules/services/index.nix
    ./modules/workspace/index.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };
}

```

## ./nixos/modules/hardware

### audio.nix
```nix
_: {
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };
}

```

### graphics.nix
```nix
{
  config,
  pkgs,
  ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    vulkan-tools
  ];
}

```

### index.nix
```nix
_: {
  imports = [
    ./audio.nix
    ./graphics.nix
    ./profiling.nix
  ];
}

```

### profiling.nix
```nix
_: {
  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = true; # pp daemon conflicts with tlp
    # tlp = {
    #   enable = true;
    #   settings = {
    #     START_CHARGE_THRESH_BAT0 = 0;
    #     STOP_CHARGE_THRESH_BAT0 = 1;
    #   };
    # };
  };
}

```

## ./nixos/modules/programs

### cli.nix
```nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tldr

    wget
    curl

    zip
    unzip

    tree
    fd
    ripgrep
    bat
    imagemagick

    btop
    ncdu
    gdu

    cmatrix
    wakatime-cli
  ];
}

```

### development.nix
```nix
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    micro
    vim

    git
    nodejs_20
    pnpm

    nixd
    nixfmt-rfc-style

    shfmt
    shellcheck

    clang-tools
    gcc

    python3
    pyright
    ruff
  ];
}

```

### games.nix
```nix
{
  pkgs,
  ...
}:
{
  services.flatpak.packages = [
    "com.vysp3r.ProtonPlus"
  ];
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [
    heroic
    osu-lazer-bin
  ];
}

```

### index.nix
```nix
_: {
  imports = [
    ./cli.nix
    ./development.nix
    ./games.nix
    ./multimedia.nix
    ./utilities.nix
    ./web.nix
  ];
}

```

### multimedia.nix
```nix
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    qview
    feh
    haruna

    libreoffice
    zathura

    spotify
  ];
}

```

### utilities.nix
```nix
{ pkgs, ... }:
{
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    keyd
    peazip
  ];
}

```

### web.nix
```nix
{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    librewolf
    zoom-us
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
  ];
}

```

## ./nixos/modules/services

### index.nix
```nix
_: {
  imports = [
    ./internet.nix
    ./package-manager.nix
  ];
}

```

### internet.nix
```nix
_: {
  networking = {
    firewall = {
      enable = true;
      allowPing = true;
      logReversePathDrops = true;
    };
    nameservers = [
      "1.1.1.1"
    ];
  };

  services.resolved = {
    enable = true;
    extraConfig = ''
      [Resolve]
      DNS=1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com
      FallbackDNS=9.9.9.9#dns.quad9.net
      DNSOverTLS=yes
      DNSSEC=yes
      Domains=~.
    '';
  };
}

```

### package-manager.nix
```nix
{
  pkgs,
  ...
}:
{
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
  };
}

```

## ./nixos/modules/workspace

### desktop.nix
```nix
{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    aurorae
    plasma-browser-integration
    plasma-workspace-wallpapers
    ark
    konsole
    elisa
    gwenview
    okular
    kate
    ktexteditor
    khelpcenter
    baloo
    baloo-widgets
    dolphin-plugins
  ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}

```

### display.nix
```nix
{
  pkgs,
  ...
}:
{
  services = {
    xserver = {
      enable = true;
      videoDrivers = [
        "nvidia"
      ];
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-frappe-mauve";
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
  ];

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "frappe";
      accent = "mauve";
      font = "UbuntuSans Nerd Font";
      fontSize = "16";
      userIcon = true;
      background = ./assets/login.png;
      loginBackground = true;
    })
  ];
}

```

### index.nix
```nix
_: {
  imports = [
    ./desktop.nix
    ./display.nix
  ];
}

```

