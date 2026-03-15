{
  pkgs,
  firefox-addons,
  ...
}:
let
  spaces = {
    "Skadi" = {
      id = "08be3ada-2398-4e63-bb8e-f8bf9caa8d10";
      icon = "";
      position = 2000;
      theme = {
        type = "gradient";
        colors = [
          {
            red = 46;
            green = 52;
            blue = 64;
            algorithm = "analogous";
            type = "explicit-lightness";
          }
        ];
        opacity = 1.0;
      };
    };
    "Specter" = {
      id = "2441acc9-79b1-4afb-b582-ee88ce554ec0";
      icon = "󰹡";
      position = 3000;
      theme = {
        type = "gradient";
        colors = [
          {
            red = 216;
            green = 222;
            blue = 233;
            algorithm = "floating";
            type = "explicit-lightness";
          }
        ];
        opacity = 0.0;
        texture = 1.0;
      };
    };
  };
in
{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.default = {
      isDefault = true;
      inherit spaces;
      spacesForce = true;
      # userChrome = ''
      #   #navigator-toolbox {
      #     background-color: #5e81ac;
      #   }
      # '';

      pinsForce = true;
      pins = {
        "Whatsapp" = {
          id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
          url = "https://web.whatsapp.com";
          isEssential = true;
          position = 101;
        };
        "Github" = {
          id = "8af62707-0722-4049-9801-bedced343333";
          url = "https://github.com/axelmychro";
          isEssential = true;
          position = 102;
        };
        "SATU" = {
          id = "fb316d70-2b5e-4c46-bf42-f4e82d635153";
          url = "https://satu.usu.ac.id";
          isEssential = true;
          position = 103;
        };
        "KELAS" = {
          id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
          url = "https://kelas.usu.ac.id";
          isEssential = true;
          position = 104;
        };
      };
      search = {
        force = true;
        default = "ddg";
        engines = {
          mynixos = {
            name = "MyNixOS";
            urls = [ { template = "https://mynixos.com/search?q={searchTerms}"; } ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@mno" ];
          };
        };
      };
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Axel";
            toolbar = true;
            bookmarks = [
              {
                name = "Whatsapp";
                url = "https://web.whatsapp.com";
              }
              {
                name = "GitHub";
                url = "https://github.com/axelmychro";
              }
            ];
          }
        ];
      };
      extensions.packages = with firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        proton-pass
      ];
    };
  };
}
