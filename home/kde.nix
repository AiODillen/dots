{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home.packages = with pkgs; [
    kdePackages.kcalc
  ];

  # Plasma itself is configured through System Settings. For a fully
  # declarative setup, see https://github.com/nix-community/plasma-manager
}
