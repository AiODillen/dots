# Optional module for NVIDIA GPUs. Not imported by default - add it to
# the relevant host's module list in flake.nix if you have an NVIDIA card.
{ config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
