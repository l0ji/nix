{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware.nix

    ../../common/boot.nix
    ../../common/fwupd.nix
    ../../common/nvidia.nix
    ../../common/tailscale.nix

    ../../common/desktop/plasma.nix
    ../../common/desktop/vnc.nix
  ];

  system.stateVersion = "25.05";
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

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

  users.defaultUserShell = pkgs.zsh;

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

  programs.firefox = {
    enable = true;
  };

  programs.git = {
    enable = true;
    config = {
      user.name = "penny";
      user.email = "penny@hexmani.ac";
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "af-magic";
      plugins = [
        "bun"
        "git"
        "jj"
        "mix"
        "node"
        "npm"
        "ssh"
        "sudo"
        "systemd"
        "tailscale"
        "yarn"
      ];
    };
  };

  networking.hostName = "racketeer";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

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
    vim
    wget
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # probably a mistake
  programs.steam.enable = true;

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
