{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home.packages = with pkgs; [
    kdePackages.kcalc
  ];

  # Plasma itself is configured through System Settings. For a fully
  # declarative setup, see https://github.com/nix-community/plasma-manager
  #
  # The files below install a Catppuccin Mocha (Mauve accent) color scheme
  # for Plasma and Konsole. Select them via:
  #   System Settings -> Appearance -> Colors -> "Catppuccin Mocha Mauve"
  #   Konsole -> Settings -> Edit Current Profile -> Appearance -> "Catppuccin Mocha Mauve"
  home.file.".local/share/color-schemes/CatppuccinMochaMauve.colors".text = ''
    [ColorEffects:Disabled]
    Color=56,56,56
    ColorAmount=0
    ColorEffect=0
    ContrastAmount=0.65
    ContrastEffect=1
    IntensityAmount=0.1
    IntensityEffect=2

    [ColorEffects:Inactive]
    ChangeSelectionColor=true
    Color=112,111,110
    ColorAmount=0.025
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=2
    Enable=false
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=49,50,68
    BackgroundNormal=30,30,46
    DecorationFocus=203,166,247
    DecorationHover=203,166,247
    ForegroundActive=203,166,247
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Selection]
    BackgroundAlternate=203,166,247
    BackgroundNormal=203,166,247
    DecorationFocus=203,166,247
    DecorationHover=203,166,247
    ForegroundActive=30,30,46
    ForegroundInactive=30,30,46
    ForegroundLink=30,30,46
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=30,30,46
    ForegroundPositive=166,227,161
    ForegroundVisited=17,17,27

    [Colors:Tooltip]
    BackgroundAlternate=24,24,37
    BackgroundNormal=24,24,37
    DecorationFocus=203,166,247
    DecorationHover=203,166,247
    ForegroundActive=203,166,247
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:View]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=203,166,247
    DecorationHover=203,166,247
    ForegroundActive=203,166,247
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [Colors:Window]
    BackgroundAlternate=24,24,37
    BackgroundNormal=30,30,46
    DecorationFocus=203,166,247
    DecorationHover=203,166,247
    ForegroundActive=203,166,247
    ForegroundInactive=166,173,200
    ForegroundLink=137,180,250
    ForegroundNegative=243,139,168
    ForegroundNeutral=249,226,175
    ForegroundNormal=205,214,244
    ForegroundPositive=166,227,161
    ForegroundVisited=203,166,247

    [General]
    ColorScheme=CatppuccinMochaMauve
    Name=Catppuccin Mocha Mauve
    shadeSortColumn=true

    [KDE]
    contrast=4

    [WM]
    activeBackground=30,30,46
    activeBlend=205,214,244
    activeForeground=205,214,244
    inactiveBackground=17,17,27
    inactiveBlend=166,173,200
    inactiveForeground=166,173,200
  '';

  home.file.".local/share/konsole/CatppuccinMochaMauve.colorscheme".text = ''
    [Background]
    Color=30,30,46

    [BackgroundIntense]
    Color=30,30,46

    [Foreground]
    Color=205,214,244

    [ForegroundIntense]
    Color=205,214,244

    [Color0]
    Color=69,71,90

    [Color0Intense]
    Color=88,91,112

    [Color1]
    Color=243,139,168

    [Color1Intense]
    Color=243,139,168

    [Color2]
    Color=166,227,161

    [Color2Intense]
    Color=166,227,161

    [Color3]
    Color=249,226,175

    [Color3Intense]
    Color=249,226,175

    [Color4]
    Color=137,180,250

    [Color4Intense]
    Color=137,180,250

    [Color5]
    Color=203,166,247

    [Color5Intense]
    Color=203,166,247

    [Color6]
    Color=148,226,213

    [Color6Intense]
    Color=148,226,213

    [Color7]
    Color=186,194,222

    [Color7Intense]
    Color=166,173,200

    [General]
    Description=Catppuccin Mocha Mauve
    Opacity=1
    Wallpaper=
  '';
}
