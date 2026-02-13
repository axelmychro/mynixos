{ dotconfig, ... }:
{
  xdg.configFile = {
    "fastfetch" = {
      source = dotconfig + /fastfetch;
      recursive = true;
    };
  };

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "~/.config/fastfetch/nix.txt";
        padding = {
          top = 0;
          left = 0;
          right = 2;
        };
        color = {
          "1" = "#ffffff";
        };
      };

      display = {
        color = {
          keys = "#ACB0BE";
          output = "#eeeeee";
        };
        separator = "";
        key = {
          width = 12;
          type = "string";
        };
        percent = {
          color = {
            green = "#8CAAEE";
            yellow = "#dada00";
            red = "#F4B8E4";
          };
        };
      };

      modules = [
        {
          type = "kernel";
          format = "{1} {2} {4}";
        }
        {
          type = "os";
          format = "{2} {8}";
        }
        {
          type = "wm";
          format = "{2} ({3})";
        }
        {
          type = "terminal";
          format = "{1} {6}";
        }
        {
          type = "display";
          key = "Display";
          format = "{1}×{2} {3}Hz";
        }
        {
          type = "cpu";
          keyIcon = " ";
          format = " {name}";
        }
        {
          type = "gpu";
          hideType = "integrated";
          keyIcon = " ";
          format = "󰈈 {name}";
        }
        # If you ever want to show the discrete GPU instead / additionally:
        # {
        #   type = "gpu";
        #   hideType = "discrete";
        #   keyIcon = " ";
        #   format = "   󰈈 {name}";
        # }
        {
          type = "memory";
          format = " {3} {1} of {2}";
        }
        {
          type = "disk";
          key = "Storage";
          format = " {3} {1} of {2}";
        }
        {
          type = "battery";
          key = "Battery";
          format = " {4} {5}";
        }
        # The commented one with progress bar style:
        # {
        #   type = "battery";
        #   keyIcon = " ";
        #   percent = {
        #     type = 2;
        #   };
        #   format = "    {10}";
        # }
      ];
    };
  };
}
