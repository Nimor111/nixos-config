{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "web-search"
        ];
        theme = "robbyrussell";
      };

      shellAliases = {
        vi = "nvim";
        "g++" = "g++ -std=c++11";
        py = "python3";
        rdm = "vi README.md";
        sl = "ls --color=auto";
        lls = "ls --color=auto";
        lss = "ls --color=auto";
        ls = "ls --color=auto";
        cwd = "pwd";
        pw = "poweroff";
        viconf = "vi ~/.vimrc";
        zshconf = "vi ~/.zshrc";
        down = "git pull";
        cat = "bat";
      };

      initExtra = ''
        neofetch

        # Preferred editor for local and remote sessions
        if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='nvim'
        else
          export EDITOR='nvim'
            fi

        # Source autojump file
        source ~/.nix-profile/etc/profile.d/autojump.sh
      '';
    };
  };
}
