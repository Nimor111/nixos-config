{pkgs, config, ...}:

{
  home-manager.users.gbojinov = homeManager: {
    programs.tmux = {
      enable = true;

      extraConfig = ''
	# Thank you to https://github.com/zanshin/dotfiles

	# mouse control (clickable windows, panes, resizable panes)
	set -g mouse on

	# default terminal colors
	set -g default-terminal "screen-255color"

	######################
	### DESIGN CHANGES ###
	######################

	# panes

	# scrollback
	set -g history-limit 50000

	## Status bar design
	# status line
	set -g status-justify left
	set -g status-interval 2

	# messaging
	set -g message-command-style fg=blue,bg=black

	#window mode

	# window status
	setw -g window-status-format " #F#I:#W#F "
	setw -g window-status-current-format " #F#I:#W#F "
	setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
	setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "

	# Info on left (I don't have a session display for now)
	set -g status-left ""

	# loud or quiet?
	set-option -g visual-activity off
	set-option -g visual-bell off
	set-option -g visual-silence off
	set-window-option -g monitor-activity off
	set-option -g bell-action none

	set -g default-terminal "screen-256color"

	# The modes {
	setw -g clock-mode-colour colour135
	setw -g mode-style "bg=colour6,fg=colour0,bold,fg=colour196,bg=colour238"

	# }
	# The panes {

	set -g pane-border-style "fg=black,bg=colour235,fg=colour238"
	set -g pane-active-border-style "fg=brightred,bg=colour236,fg=colour51"

	# }
	# The statusbar {

	set -g status-position bottom
	set -g status-style "bg=default,fg=colour12,bg=colour234,fg=colour137,dim"
	set -g status-left ""
	set -g status-right "#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S "
	set -g status-right-length 50
	set -g status-left-length 20

	setw -g window-status-current-style "bg=colour0,fg=colour11,dim,fg=colour81,bg=colour238,bold"
	setw -g window-status-current-format " #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F "

	setw -g window-status-style "bg=green,fg=black,reverse,fg=colour138,bg=colour235,none"
	setw -g window-status-format " #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F "

	setw -g window-status-bell-style "bold,fg=colour255,bg=colour1"

	# }
	# The messages {

	set -g message-style "fg=black,bg=yellow,bold,fg=colour232,bg=colour166"

	# show host name and IP address on left side of status bar
	set -g status-left-length 70
	set -g status-left "#[fg=green]: #h : #[fg=brightblue]#(curl icanhazip.com) #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print \"en0 \" $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

	# show session name, window & pane number, date and time on right side of
	# status bar
	set -g status-right-length 60
	set -g status-right "#[fg=brightblue]#S #I:#P #[fg=yellow]:: %d %b %Y #[fg=green]:: %l:%M %p"

	# Smart pane switching with awareness of Vim splits.
	# See: https://github.com/christoomey/vim-tmux-navigator
	# is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
	# bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
	# bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
	# bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
	# bind-key -n C-f if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
	# bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
	bind-key -T copy-mode-vi C-h select-pane -L
	bind-key -T copy-mode-vi C-j select-pane -D
	bind-key -T copy-mode-vi C-k select-pane -U
	bind-key -T copy-mode-vi C-f select-pane -R
	# bind-key -T copy-mode-vi C-\ select-pane -l
	# }

	# escape time
	set -s escape-time 0

	# copy to system clipboard
	bind-key -T copy-mode-vi v send-keys -X begin-selection
	bind-key -T copy-mode-vi y send-keys -X copy-selection
	bind-key -T copy-mode-vi r send-keys -X rectangle-selection
	bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -sel clip -i"
      '';
    };
  };
}
