{
  ...
}:
{

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };


  xdg.configFile."direnv/direnv.toml".text = ''
    [global]
    strict_env = true

    [whitelist]
    prefix = [
      "/home/penny/code",
    ]
  '';

}
