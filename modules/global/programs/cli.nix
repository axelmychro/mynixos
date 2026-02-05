{pkgs, ...}: {
  environment.systemPackages = with pkgs; [

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
