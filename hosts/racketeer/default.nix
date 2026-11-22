{
  config,

  pkgs,
  ...
}:
{
  imports = [
    ./hardware.nix

    ../../common/boot.nix
    ../../common/fwupd.nix
    ../../common/nvidia.nix
    ../../common/nixpkgs.nix
    ../../common/networking.nix
    ../../common/locales.nix
    ../../common/shell-users.nix
    ../../common/ssh.nix
    ../../common/virtualisation.nix
    ../../common/tailscale.nix

    ../../common/desktop/plasma.nix
    ../../common/desktop/xrdp.nix
    ../../common/desktop/fonts.nix
    ../../common/desktop/audio.nix
  ];

  system.stateVersion = "25.05";


  networking.hostName = "racketeer";
  networking.firewall.enable = true;

  users.users.penny = {
    description = "Blu";
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';

  services.printing = {
    enable = true;
  };
  services.kubo = {
    enable = true;
  };
  services.flatpak = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    file
    inotify-tools
    lon
    pciutils
    vim
    wget
  ];

  # probably a mistake
  programs.steam.enable = true;

  programs.firefox = {
    enable = true;
  };
}
