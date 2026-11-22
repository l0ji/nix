{
  ...
}:
{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
}
