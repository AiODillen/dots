# Home Manager settings shared by every profile.
{ pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Your Name";
    userEmail = "your.email@example.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    firefox
    htop
    unzip
    ripgrep
    fzf
    fd
  ];
}
