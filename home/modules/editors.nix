{
  ...
}:
{
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
      enable_audio_bell = "yes";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
    };
  };

  programs.vscodium = {
    enable = true;
    profiles.default.userSettings = {
      "[html]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
    };
  };

  programs.zed-editor = {
    enable = true;
    userSettings = {
      language_models.opencode = {
        show_go_models = true;
        show_free_models = true;
        show_zen_models = false;
      };
      project_panel.dock = "left";
      outline_panel.dock = "left";
      collaboration_panel.dock = "left";
      git_panel.dock = "left";
      session.trust_all_worktrees = true;
      helix_mode = false;
      agent = {
        dock = "right";
        tool_permissions = {
          default = "allow";
          tools = {
            create_directory.default = "allow";
            fetch.default = "allow";
          };
        };
        default_profile = "write";
        default_model = {
          effort = "high";
          enable_thinking = true;
          provider = "zed.dev";
          model = "claude-sonnet-4-6";
        };
        model_parameters = [ ];
      };
      edit_predictions = {
        provider = "zed";
        mode = "subtle";
      };
      audio = {
        experimental.rodio_audio = true;
      };
      calls = {
        mute_on_join = true;
      };
      use_system_prompts = false;
      use_system_path_prompts = false;
      buffer_line_height = "comfortable";
      buffer_font_weight = 400.0;
      buffer_font_family = ".ZedMono";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      icon_theme = "Colored Zed Icons Theme Dark";
      ui_font_size = 16;
      buffer_font_size = 15.0;
      theme = {
        mode = "dark";
        light = "Ayu Light";
        dark = "Catppuccin Mocha";
      };
    };
  };
}
