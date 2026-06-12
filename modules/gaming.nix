# Gaming stack shared by every host: Steam, Proton helpers, gamemode
# and GPU drivers needed for 32-bit games.
{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
    heroic
    bottles
    mangohud
    protonup-qt
    wineWowPackages.staging
    winetricks
    gamescope
    discord
  ];
}
