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
        pkgs.valgrind
        pkgs.gnumake

        pkgs.wl-clipboard

        pkgs.wget
        pkgs.git
        pkgs.curl
        pkgs.unzip
        pkgs.nano
        pkgs.vim
        pkgs.ngrok

        pkgs.xapp
    ];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs.home-manager.enable = true;

    programs.fish.generateCompletions = false;

    xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "/home/alston/.config/home-manager/fish-config";
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/alston/nvim-config";

    nix = {
        package = pkgs.nix;
        settings = {
            experimental-features = ["nix-command" "flakes"];
        };
    };
}
