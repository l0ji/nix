{
  pkgs,
  ...
}:
{
  imports = [
    <home-manager/nixos>

    ./boot.nix
    ./hardware-configuration.nix
    ./nvidia.nix
    ./plasma.nix
    ./user.nix

    ./services/fwupd.nix
    ./services/tailscale.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    allowReboot = true;
    rebootWindow = {
      lower = "04:00";
      upper = "06:00";
    };
  };

  environment.variables.EDITOR = "nano";

  system.stateVersion = "25.05";
  system.copySystemConfiguration = true;

  networking.hostName = "racketeer";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true;
  # };

  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    cudatoolkit
    fastfetch
    file
    gcc
    gnumake
    hyfetch
    lon
    pciutils
    sbctl
    vim
    wget
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
