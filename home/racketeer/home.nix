{
  pkgs,
  ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  catppuccin = {
    flavor = "mocha";
    alacritty = {
      enable = true;
    };
  };

  home = {
    stateVersion = "25.11";

    username = "penny";
    homeDirectory = "/home/penny";

    # todo: replace with shells and devenvs n shit AND STOP WITH THE PKGS
    packages = [
      pkgs.bun
      # pkgs.cabal-install
      pkgs.cargo
      pkgs.cider-2
      # pkgs.crystal
      pkgs.discord
      # pkgs.dmd
      pkgs.elixir
      pkgs.elixir-ls
      pkgs.erlang
      pkgs.erlang-language-platform
      pkgs.esbuild
      pkgs.go
      pkgs.ghostty
      pkgs.gimp
      pkgs.github-cli
      # pkgs.ghc
      pkgs.helix
      pkgs.htop
      pkgs.jetbrains-toolbox
      pkgs.jujutsu
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

  # programs.ghostty = {
  #   enable = true;
  #   enableZshIntegration = true;
  #   settings = {
  #     theme = "Catppuccin Mocha";
  #     font-family = "JetBrainsMono Nerd Font";
  #     font-size = 11;
  #     window-padding-x = 10;
  #     window-padding-y = 10;
  #     cursor-style = "block";
  #   };
  # };

  programs.alacritty = {
    enable = true;
    settings = {
      general.live_config_reload = true;
      env.TERM = "xterm-256color";
      window = {
        dimensions = {
          columns = 120;
          rows = 38;
        };
        padding = {
          x = 16;
          y = 16;
        };
        dynamic_padding = true;
        blur = true;
        resize_increments = true;
      };
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "Regular";
        };
        size = 13;
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
        vi_mode_style = {
          shape = "Block";
          blinking = "Off";
        };
        thickness = 0.25;
      };
    };
  };
}
