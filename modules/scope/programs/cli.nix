{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kitty
    fastfetch
    oh-my-posh

    wget
    unzip
    ripgrep
    fd
    tree
    btop
    curl
    tldr
    cmatrix
    bat
  ];
}
