{
  ...
}:
{
  programs.fastfetch.enable = true;
  programs.hyfetch = {
    enable = true;
    settings = {
      preset = "lesbian";
      mode = "rgb";
      light_dark = "dark";
      lightness = 0.54;
      color_align = {
        mode = "custom";
        custom_colors = {
          "1" = 3;
          "2" = 2;
        };
        fore_back = [ ];
      };
      backend = "fastfetch";
    };
  };

  programs.obsidian.enable = true;

  programs.opencode.enable = true;
}
