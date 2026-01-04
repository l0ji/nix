{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.users.penny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox = {
    enable = true;
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "penny";
      user.email = "penny@hexmani.ac";
      init = {
        defaultBranch = "main";
      };
    };
  };

  home-manager.useUserPackages = true;
  home-manager.users.penny =
    { pkgs, ... }:
    {
      nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };

      home.packages = with pkgs; [
        bun
        cider-2
        discord
        elixir
        elixir-ls
        ghostty
        gleam
        htop
        jetbrains-toolbox
        kdePackages.kdeconnect-kde
        lmstudio
        mpv
        newsflash
        nil
        nixd
        nodejs
        plex-desktop
        plexamp
        pnpm
        signal-desktop
        vencord
        vscodium
        yarn
        zed-editor
      ];

      home.stateVersion = "25.11";
    };
}
