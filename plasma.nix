{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  fonts.fontconfig.useEmbeddedBitmaps = true;

  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    liberation_ttf
    nerd-fonts.go-mono
    nerd-fonts.gohufont
    nerd-fonts.jetbrains-mono
    nerd-fonts.terminess-ttf
    nerd-fonts.zed-mono
    noto-fonts
    noto-fonts-color-emoji
    twitter-color-emoji
    ubuntu-sans
    vista-fonts
  ];
}
