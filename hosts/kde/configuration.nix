{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-kde";

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.okular
    kdePackages.ark
    kdePackages.filelight
  ];
}
