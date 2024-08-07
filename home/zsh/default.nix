{ config, pkgs, xdg, ... }:

let ConfigFile = "~/.config/nixpkgs";
in {
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };
  programs.zsh = {
    enable = true;
    initExtra = ''
      export TERM="xterm-256color"
      export PATH=~/.ghcup/bin:$PATH
      export PATH=~/bin:$PATH
      export PATH="/opt/homebrew/opt/m4/bin:$PATH"
      export ConfigFile="${ConfigFile}"
      CASE_SENSITIVE="true"
      # export C_INCLUDE_PATH="`xcrun --show-sdk-path`/usr/include/ffi"
      # source ~/.p10k.zsh
      # eval $(thefuck --alias)
      # [[ ! -r ~/.opam/opam-init/init.zsh ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

      # export PATH=~/.emacs.d/bin:$PATH
      # export PATH=~/.cargo/bin:$PATH
      # export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
      # for ghc compilation
    '';
    shellAliases = {
      mc = "code ${ConfigFile}";
      ll = "ls -l";
      # replace home
      # updatehome = "nix run ${ConfigFile}";
      uh = "nix run ${ConfigFile}";
      # updateNixos = "sudo nixos-rebuild switch";
      updateNixos= "sudo nixos-rebuild switch --flake ${ConfigFile}";
      updateDarwin= "darwin-rebuild switch --flake ${ConfigFile}";
      updateHomeMac = "home-manager switch --flake ${ConfigFile}/#mac -v";
      updateHomeNixos = "home-manager switch --flake ${ConfigFile}/#nixos -v";

      t = "tmux attach -t default || tmux new -s default";
    };



    oh-my-zsh = {
      enable = false;
      plugins = [ "brew" "fasd"];
      extraConfig = ''
        export PATH=~/.emacs.d/bin:$PATH
        export PATH=~/bin:$PATH
        export PATH=~/.cargo/bin:$PATH
        # export PATH=/opt/homebrew/Cellar/pcre/8.45/include/:$PATH
        export NVM_DIR="$HOME/.nvm"
        export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
        export PATH="/opt/homebrew/opt/m4/bin:$PATH"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
      '';
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "chisui/zsh-nix-shell"; }
        # { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

  };
}
