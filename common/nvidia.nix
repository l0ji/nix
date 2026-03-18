{
  config,
  pkgs,
  ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.services.nvidia-control-devices = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${pkgs.linuxPackages.nvidia_x11.bin}/bin/nvidia-smi";
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = false; # bs bug
    powerManagement.finegrained = false;
  };

  hardware.nvidia-container-toolkit.enable = true;
}
