{pkgs, config, ...}:

let
  quickmarks = builtins.readFile ./quickmarks;
in
  {
    home-manager.users.gbojinov = {
      programs.qutebrowser = {
        enable = true;
        settings = {
          url.start_pages = "https://startpage.com";
          url.default_page = "https://startpage.com";
          downloads.location.directory = "/home/gbojinov/Downloads";
        };
        extraConfig = ''
          c.url.searchengines = {
            "DEFAULT": "http://startpage.com/rvd/search?query={}&language=auto",
            "w": "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1",
            "aw": "https://wiki.archlinux.org/?search={}",
            "nw": "https://nixos.wiki/index.php?search={}",
            "re": "https://www.reddit.com/r/{}"
          }
        '';
        };
      xdg.configFile."qutebrowser/quickmarks".text = quickmarks;
    };
  }
