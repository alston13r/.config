{ config, pkgs, ... }:

{
    home.username = "alston";
    home.homeDirectory = "/home/alston";

    home.stateVersion = "26.05";

    home.packages = [
        pkgs.python314
            pkgs.fish

            pkgs.nixd

            pkgs.gcc16
            pkgs.gdb

    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
    programs.fish.enable = true;
    xdg.configFile."fish".source = ./fish-config;

    nix = {
        package = pkgs.nix;
        settings = {
            experimental-features = ["nix-command" "flakes"];
        };
    };
}
