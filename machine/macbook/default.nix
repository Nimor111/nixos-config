{ pkgs, ... }:
let
  secrets = import ./secret.nix { };
  sources = import ../../sources.nix;
in
{
  imports = [
    "${sources.home-manager}/nix-darwin"
    ../../modules/custom
    ../../modules/macos
    ../../modules/tmux
    ../../modules/git
    ../../modules/alacritty
    ../../modules/fzf
    ../../modules/nixpkgs/darwin
    # ../../modules/nix-path/darwin
    ../../cachix.nix
  ];

  primary-user.name = "g.bozhinov";
  primary-user.email = secrets.email;
  primary-user.userName = secrets.userName;

  environment.systemPackages = [

    pkgs.cachix
    # GNU userland
    pkgs.coreutils
    pkgs.gnumake
    pkgs.gnugrep
    pkgs.gnused
    pkgs.vifm

    # uncomment when neovim is fixed on darwin ( who knows when that will happen )
    pkgs.neovim

    pkgs.vim
    pkgs.jump
    pkgs.bat
    pkgs.emacs
    pkgs.exa
    pkgs.choose
    pkgs.pfetch
    pkgs.comma
    pkgs.ripgrep
    pkgs.tree
    pkgs.unzip
    pkgs.curl
    pkgs.htop
    pkgs.ytop
    #pkgs.scala
    #pkgs.sbt
    pkgs.nix-prefetch-git
    pkgs.nodejs
    pkgs.direnv
    pkgs.lorri
    pkgs.fd

    # neuron
    (
      let
        neuronSrc = builtins.fetchTarball https://github.com/srid/neuron/archive/master.tar.gz;
      in
      import neuronSrc { }
    )
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  nixpkgs.overlays =
    let
      path = ../../overlays;
    in
    with builtins;
    map (n: import (path + ("/" + n)))
      (
        filter
          (
            n: match ".*\\.nix" n != null || pathExists (path + ("/" + n + "/default.nix"))
          )
          (attrNames (readDir path))
      );

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.zsh = {
    enable = true;
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
