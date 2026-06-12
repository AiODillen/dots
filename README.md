# NixOS + Home Manager configuration

Flake-based NixOS configuration with two ready-to-use desktop profiles, both
with a gaming package set included:

- **`kde`** - KDE Plasma 6, SDDM
- **`hyprland`** - Hyprland (Wayland), greetd/tuigreet

## Layout

```
flake.nix                       # entry point, defines the two configurations
modules/
  common.nix                    # shared base: boot, networking, audio, fonts, user account
  gaming.nix                    # Steam, Proton/Wine, gamemode, GPU 32-bit support
hosts/
  kde/configuration.nix         # KDE Plasma + SDDM
  kde/hardware-configuration.nix
  hyprland/configuration.nix    # Hyprland + greetd
  hyprland/hardware-configuration.nix
home/
  common.nix                    # shared Home Manager config (shell, git, CLI tools)
  kde.nix                       # KDE-specific Home Manager profile
  hyprland.nix                  # Hyprland config, waybar, kitty, wofi
```

## First-time setup

1. **Generate hardware configs** on the target machine and overwrite the
   placeholders:

   ```sh
   sudo nixos-generate-config --show-hardware-config > hosts/kde/hardware-configuration.nix
   # or
   sudo nixos-generate-config --show-hardware-config > hosts/hyprland/hardware-configuration.nix
   ```

2. **Set your username.** Edit the `username` value in `flake.nix` (defaults
   to `"user"`). It's used for both the system account and the Home Manager
   profile.

3. **Set your git identity** in `home/common.nix` (`programs.git.userName` /
   `userEmail`).

4. Adjust `time.timeZone` and `console.keyMap` / `services.xserver.xkb` in
   `modules/common.nix` and the host files if needed.

## Building

```sh
sudo nixos-rebuild switch --flake .#kde
# or
sudo nixos-rebuild switch --flake .#hyprland
```

## Extending

- For a fully declarative Plasma setup (panels, shortcuts, themes), consider
  adding [plasma-manager](https://github.com/nix-community/plasma-manager) as
  a flake input and Home Manager module.
- Hyprland keybinds, waybar modules and styling live in `home/hyprland.nix`.
