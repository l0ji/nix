{
  pkgs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;

  users.users.penny = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "af-magic";
      plugins = [
        "bun"
        "git"
        "jj"
        "mix"
        "node"
        "npm"
        "ssh"
        "sudo"
        "systemd"
        "tailscale"
        "yarn"
      ];
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
        jujutsu
        kdePackages.kdeconnect-kde
        lmstudio
        mpv
        newsflash
        nil
        nixd
        nodejs
        opencode
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
