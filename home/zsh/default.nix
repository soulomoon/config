{ config, pkgs, xdg, ... }:
{
  programs.zsh = {
    enable = true;
    initExtra = '' 
      export TERM="xterm-256color"
      source ~/.p10k.zsh 
      CASE_SENSITIVE="false"
    '';
    shellAliases = {
      ll = "ls -l";
      updatehome = "nix run ~/.config/nixpkgs";
      uh = "nix run ~/.config/nixpkgs";
      # updateNixos = "sudo nixos-rebuild switch";
      updateNixos= "sudo nixos-rebuild switch --flake ~/.config/nixpkgs";
      updateDarwin= "darwin-rebuild switch --flake ~/.config/nixpkgs";
      updateHomeMac = "home-manager switch --flake ~/.config/nixpkgs/#mac -v";
      updateHomeNixos = "home-manager switch --flake ~/.config/nixpkgs/#nixos -v";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "brew" "fasd"];
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}