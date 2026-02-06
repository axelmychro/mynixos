{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # nixfmt
    vim
    git
    nodejs_20
    vscodium
    zed-editor
  ];
}
