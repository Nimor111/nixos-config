# Some more configs taken from cprussin: https://github.com/cprussin/dotfiles
{pkgs, config, ...}:

{
  primary-user.home-manager = {
    services.dunst = {
      enable = true;

      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
        size = "48x48";
      };

      settings = {
        global = {
          font = "Jet Brains Mono Nerd Font 10";
          allow_markup = "yes";
          icon_position = "left";
          max_icon_size = 32;
          sort = "yes";
          indicate_hidden = "yes";
          alignment = "left";
          show_age_threshold = 30;
          word_wrap = "yes";
          ignore_newline = "no";
          geometry = "300x5+30-50";
          transparency = 20;
          idle_threshold = 120;
          monitor = 0;
          follow = "mouse";
          sticky_history = "yes";
          line_height = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          separator_color = "frame";
          startup_notification = "false";
          frame_width = 3;
        };
        shortcuts = {
          close = "ctrl+space";
          close_all = "ctrl+shift+space";
          history = "ctrl+dollar";
          context = "ctrl+shift+period";
        };
        urgency_low = {
          background = "#282828";
          foreground = "#888888";
          frame_color = "#888888";
          timeout = 10;
        };
        urgency_normal = {
          background = "#282828";
          foreground = "#268bd2";
          frame_color = "#073642";
          timeout = 10;
        };
        urgency_critical = {
          background = "#282828";
          foreground = "#d33682";
          frame_color = "#d33682";
          timeout = 0;
        };
      };
    };
  };
}
