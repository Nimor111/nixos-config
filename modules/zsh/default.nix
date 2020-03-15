{pkgs, config, ...}:

let
  zshConfig = builtins.readFile ./.zshrc;
in
{
  home-manager.users.gbojinov = {
    home.file = {
      ".zprofile".text = ''
        if [ "$(tty)" = /dev/tty1 ]; then
            exec startx
        fi
      '';
    };

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "web-search"
        ];
        theme = "theunraveler";
      };

      shellAliases = {
        vi = "nvim";
        "g++" = "g++ -std=c++11";
        py = "python3";
        rdm = "vi README.md";
        ls = "exa";
        sl = "ls --color=auto";
        lls = "ls --color=auto";
        lss = "ls --color=auto";
        #ls = "ls --color=auto";
        cwd = "pwd";
        pw = "poweroff";
        viconf = "vi ~/.vimrc";
        zshconf = "vi ~/.zshrc";
        down = "git pull";
        cat = "bat";
      };

      initExtra = zshConfig;
    };
  };
}