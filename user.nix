{
  pkgs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;

  users.users.penny = {
    description = "Blu";
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

      # todo: not this shit
      home.packages = with pkgs; [
        bun
        cabal-install
        cargo
        cider-2
        crystal
        discord
        dmd
        elixir
        elixir-ls
        erlang
        erlang-language-platform
        go
        ghostty
        gleam
        ghc
        htop
        jetbrains-toolbox
        jujutsu
        kdePackages.kdeconnect-kde
        kotlin
        lmstudio
        mpv
        newsflash
        nil
        nixd
        nodejs
        opencode
        openjdk
        plex-desktop
        plexamp
        pnpm
        ruby
        rustc
        signal-desktop
        uv
        vencord
        vlang
        vscodium
        yarn
        zed-editor
        zig
      ];

      home.stateVersion = "25.11";
    };
}
