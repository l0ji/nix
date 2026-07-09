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
    enable = true;
    autoEnable = false;
    flavor = "mocha";

    kitty = {
      enable = true;
    };
    halloy = {
      enable = true;
    };
  };

  home = {
    stateVersion = "25.11";

    username = "penny";
    homeDirectory = "/home/penny";

    # todo: replace with shells and devenvs n shit AND STOP WITH THE PKGS
    packages = with pkgs; [
      baobab
      bolt-launcher
      bun
      # cabal-install
      cargo
      cider-2
      # crystal
      codex
      discordPkgs.discord
      # dmd
      beamPackages.elixir
      elixir-ls
      beamPackages.erlang
      erlang-language-platform
      esbuild
      gajim
      gemini-cli-bin
      github-copilot-cli
      go
      ghostty
      gimp
      github-cli
      # ghc
      helix
      htop
      jetbrains-toolbox
      jujutsu
      kotlin
      lmstudio
      mpv
      newsflash
      nil
      nixd
      nodejs
      obs-studio
      obsidian
      opencode
      openfortivpn
      openfortivpn-webview
      openjdk
      php84
      plexamp
      pnpm
      prismlauncher
      python314
      racket
      ruby
      rustc
      signal-desktop
      tailwindcss
      trayscale
      uv
      vscodium
      yarn
      zed-editor
      zig
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
      confirm_os_window_close = 0;
    };
  };

  programs.halloy = {
    enable = true;
    settings = {
      servers = {
        libera = {
          nickname = "tyzias";
          server = "irc.libera.chat";
          channels = [ "#halloy" ];
        };
      };
    };
  };
}
