{
  pkgs,
  inputs,
  ...
}:
let
  discordPkgs = import inputs.nixpkgs-discord-krisp {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  catppuccin = {
    flavor = "mocha";
    kitty = {
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
      discordPkgs.discord
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

  programs.kitty = {
    enable = true;
    settings = {
      initial_window_width = "80c";
      initial_window_height = "25c";
      window_padding_width = 16;
      resize_in_steps = true;
      background_blur = 32;

      font_family = "JetBrains Mono Nerd Font";
      font_size = 12;
      disable_ligatures = "never";

      cursor_shape = "beam";
      cursor_beam_thickness = 1.0;
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;

      scrollback_lines = 2000;
      scrollbar = "scrolled-and-hovered";

      tab_bar_edge = "top";
      tab_bar_align = "center";

      shell = "zsh";
      editor = "hx";
      close_on_child_death = "yes";
    };
  };
}
