{
  pkgs,
  ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home = {
    stateVersion = "25.11";

    username = "penny";
    homeDirectory = "/home/penny";

    # todo: replace with shells and devenvs n shit AND STOP WITH THE PKGS
    packages = [
      pkgs.bun
      pkgs.cabal-install
      pkgs.cargo
      pkgs.cider-2
      pkgs.crystal
      pkgs.discord
      #pkgs.dmd
      pkgs.elixir
      pkgs.elixir-ls
      pkgs.erlang
      pkgs.erlang-language-platform
      pkgs.esbuild
      pkgs.go
      pkgs.ghostty
      pkgs.gimp
      pkgs.github-cli
      pkgs.ghc
      pkgs.helix
      pkgs.htop
      pkgs.jetbrains-toolbox
      pkgs.jujutsu
      pkgs.kdePackages.kdeconnect-kde
      pkgs.kotlin
      pkgs.lmstudio
      pkgs.mpv
      pkgs.newsflash
      pkgs.nil
      pkgs.nixd
      pkgs.nodejs
      pkgs.opencode
      pkgs.openfortivpn
      pkgs.openfortivpn-webview
      pkgs.openjdk
      pkgs.php84
      pkgs.plexamp
      pkgs.pnpm
      pkgs.prismlauncher
      pkgs.ruby
      pkgs.rustc
      pkgs.signal-desktop
      pkgs.tailwindcss
      pkgs.trayscale
      pkgs.uv
      pkgs.vlang
      pkgs.vscodium
      pkgs.yarn
      pkgs.zed-editor
      pkgs.zig
    ];
    sessionVariables = {
      EDITOR = "hx";
    };

    # todo: look into home.file
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 11;
      window-padding-x = 10;
      window-padding-y = 10;
      cursor-style = "block";
    };
  };
}
