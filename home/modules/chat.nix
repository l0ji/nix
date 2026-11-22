{
  ...
}:
{
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
