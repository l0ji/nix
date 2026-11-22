{
  pkgs,
  ...
}:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  programs.kde-pim.enable = false;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    ];
    xdgOpenUsePortal = true;
  };
}
