# axelmychro/mynixos#mychro

this is the flake i daily drive

## bare metal

- x86_64-linux system
- UEFI system
- NixOS with flakes enabled

## usage

```bash
sudo nixos-rebuild switch --flake github:axelmychro/mynixos#mychro
```

## credits

### modules

- [Nix](https://nixos.org)
  - options: https://search.nixos.org/options
  - packages: https://search.nixos.org/packages

- [Nix community](https://github.com/nix-community)
  - [home-manager](https://github.com/nix-community/home-manager)
    - options: https://nix-community.github.io/home-manager/options.xhtml
    - examples: https://nixos.wiki/wiki/Home_Manager

  - [plasma-manager](https://github.com/nix-community/plasma-manager)
    - options: https://nix-community.github.io/plasma-manager/options.xhtml
    - examples:
      - https://nixos.wiki/wiki/Plasma-Manager
      - https://github.com/nix-community/plasma-manager/blob/trunk/examples/home.nix

### theming

- [Catppuccin](https://catppuccin.com/) (GRUB, login, home, lock, terminal, Zed)

#### display manager

- [SDDM](https://github.com/sddm/sddm)
- [SilentSDDM](https://github.com/uiriansan/SilentSDDM)
- [Yyyyuec_07](https://x.com/Yyyyuec_07/status/1836062341152067602) (login screen)

#### desktop manager

- [KDE](https://github.com/KDE/plasma-desktop)
- [T4B4Ko](https://x.com/t4b4ko/status/1968375351547204009) (home screen)
- [ﾒｰﾍﾞ](https://www.pixiv.net/en/artworks/118789197) (lock screen)

#### terminal

- [Ghostty](https://github.com/ghostty-org/ghostty)
- [4DBug](https://github.com/4DBug/nix-ansi) (logo)
- [アーリン](https://www.pixiv.net/en/artworks/137307172) (logo)
