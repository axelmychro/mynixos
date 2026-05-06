{ pkgs, ... }:
let
  # pkgs.qt6.env already includes pkgs.qt6.qtbase
  # And using `with` to prevent a lot of typing.
  qtEnv =
    with pkgs.qt6;
    env "qt-custom-${qtbase.version}" [
      qtbase
      qttools
      qtpositioning
      qtdeclarative
    ];
in
{
  environment.systemPackages = [
    qtEnv
    # pkgs.qt6.qtdeclarative depends on pkgs.libglvnd
    pkgs.libglvnd
    pkgs.qtcreator
    pkgs.gnumake
    pkgs.cmake
  ];
}
