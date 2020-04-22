{ config, pkgs, ... }:


{
  imports = [
    <home-manager/nix-darwin>
    ../../modules/macos
    ../../modules/tmux
  ];

  users.users."g.bozhinov" = {
    name = "g.bozhinov";
    shell = pkgs.zsh;
  };

  environment.systemPackages = [

    # GNU userland
    pkgs.coreutils
    pkgs.gnumake
    pkgs.gnugrep
    pkgs.gnused
    pkgs.vifm

    # uncomment when neovim is fixed on darwin ( who knows when that will happen )
    # pkgs.neovim

    pkgs.kitty
    pkgs.vim
    pkgs.jump
    pkgs.bat
    pkgs.emacs
    pkgs.exa
    pkgs.pfetch
    pkgs.git
    pkgs.ripgrep
    pkgs.fzf
    pkgs.tree
    pkgs.unzip
    pkgs.curl
    pkgs.htop
    pkgs.scala
    pkgs.sbt
    pkgs.nix-prefetch-git
    pkgs.nodejs
    pkgs.direnv
    pkgs.lorri
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.zsh = {
    enable = true;
    enableFzfHistory = true;
    enableFzfGit = true;
    enableSyntaxHighlighting = true;
  };
  environment.shells = with pkgs; [ bash zsh ];
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;

  # This options make persistent nix-shell possible
  # i.e. packages built by nix-shell won't be garbage-collected.
  nix.extraOptions = "keep-outputs = true";
}
