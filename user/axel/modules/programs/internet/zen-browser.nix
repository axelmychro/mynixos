{
  zenPkgs,
  pkgs,
  lib,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };
  prefs = {
    # Check these out at about:config
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
  };
  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
  ];
in
{
  environment.systemPackages = [
    (pkgs.wrapFirefox zenPkgs.zen-browser-unwrapped {
      extraPrefs = lib.concatLines (
        lib.mapAttrsToList (
          name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
        ) prefs
      );

      extraPolicies = {
        DisableTelemetry = true;
        ExtensionSettings = builtins.listToAttrs extensions;

        SearchEngines = {
          Default = "ddg";
          Add = [
            {
              Name = "nixpkgs packages";
              URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@np";
            }
            {
              Name = "NixOS options";
              URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@no";
            }
            {
              Name = "NixOS Wiki";
              URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@nw";
            }
            {
              Name = "noogle";
              URLTemplate = "https://noogle.dev/q?term={searchTerms}";
              IconURL = "https://noogle.dev/favicon.ico";
              Alias = "@ng";
            }
          ];
        };
      };
    })
  ];
}
