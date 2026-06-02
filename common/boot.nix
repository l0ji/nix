{ lib, ... }:
{
  boot = {
    kernel.sysctl."net.ipv4.ip_forward" = 1;

    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = lib.mkForce false;
    loader.systemd-boot.consoleMode = "auto";
    loader.systemd-boot.edk2-uefi-shell.enable = true;
    loader.systemd-boot.configurationLimit = 1;

    plymouth = {
      enable = true;
      theme = "breeze";
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    loader.timeout = 3;
  };

  system.nixos.label = "NixOS";
}
