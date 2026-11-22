{
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

    sessionVariables = {
      EDITOR = "hx";
    };
  };
}
