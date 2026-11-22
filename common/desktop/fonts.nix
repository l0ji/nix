{
  pkgs,
  ...
}:
{
  fonts.fontconfig.useEmbeddedBitmaps = true;

  fonts.packages = with pkgs; [
    corefonts
    dejavu_fonts
    hanazono
    liberation_ttf
    nerd-fonts.go-mono
    nerd-fonts.gohufont
    nerd-fonts.jetbrains-mono
    nerd-fonts.terminess-ttf
    nerd-fonts.zed-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    stix-two
    symbola
    twitter-color-emoji
    ubuntu-sans
    vista-fonts
  ];
}
