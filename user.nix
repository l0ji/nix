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
        cider-2
        discord
        elixir
        elixir-ls
        ghostty
        gleam
        jetbrains-toolbox
        nil
        nixd
        plex-desktop
        plexamp
        vencord
        vscodium
        zed-editor
      ];

      home.stateVersion = "25.11";
    };
}
