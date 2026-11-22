
{
  imports = [
    ../modules/catppuccin.nix
    ../modules/config.nix
    ../modules/packages.nix
    ../modules/editors.nix
    ../modules/chat.nix
    ../modules/git.nix
    ../modules/gh.nix
    ../modules/mpv.nix
    ../modules/jujutsu.nix
    ../modules/tools.nix
    ../modules/direnv.nix
  ];

  programs.codexDesktopLinux = {
    enable = true;
    linuxFeatures = [
      "api-key-model-visibility"
      "api-key-service-tier"
      "copilot-reasoning-effort"
      "tray-usage"
      "ui-tweaks"
    ];
  };
}
