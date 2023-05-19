{ config, pkgs, ... }:
{
    home = {
        enableDebugInfo = true;
        packages = [
        ];
        sessionPath = [
            "$HOME/dev/zls/zig-out/bin"
        ];
        shellAliases = {
            gs = "git status";
            gd = "git diff";
            ga =  "git add";
            gco = "git commit";
            gpl = "git pull";
            gps = "git push";
            zb = "zig build";
            zr = "zig build run";
            zd = "zig build debug";
            zt = "zig build test";
            cdr = "cd ~/dev/rise";
            cdn = "cd ~/nix";
        };
    };

    programs = {
        bash = {
            enable = true;
            enableCompletion = true;
        };
        fzf = {
            enable = true;
            enableBashIntegration = true;
        };
        git = {
            enable = true;
            delta.enable = true;
            extraConfig = {
                user = {
                    name = "David Gonzalez Martin";
                    email = "davidgm94.work@protonmail.com";
                    usersname = "davidgm94";
                };
                core = {
                    editor = "nvim";
                    lf = "open";
                    eof = "lf";
                    autocrlf = false;
                };
                github = {
                    user = "davidgm94";
                };
                init = {
                    defaultBranch = "main";
                };
                credential = {
                    helper = "store";
                };
                push = {
                    autoSetupRemote = true;
                };
            };
        };
        home-manager = {
            enable = true;
        };
        neovim = {
            enable = true;
            extraLuaConfig = builtins.readFile ./config/nvim/init.lua;
        };
    };
}
