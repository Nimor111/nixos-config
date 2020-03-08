{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    home.file = {
      ".config/xmobar/.xmobarrc".text = ''
        Config { font = "Liberation Mono:pixelsize=16:antialias=true:autohint=true"
               , bgColor = "#282828"
               , fgColor = "#B45BCF"
               , position = Top
               , lowerOnStart = True
               , hideOnStart = False
               , persistent= True
               , iconRoot = ".xmonad/xpm" -- default: "."
               , commands = [ Run Date "%a, %b %d %Y, %H:%M:%S" "date" 10
                            -- , Run Network "wlp3s0" ["-t", "<icon=net_up_20.xpm/>up <rxbar>", "-S", "True"] 10
                            , Run DynNetwork ["-t", "<icon=net_up_20.xpm/>up <rx> | <tx>", "-S", "True"] 10
                            , Run Cpu ["-t", "<icon=cpu_20.xpm/> cpu <bar> (<total>%)","-H","50","--high","red"] 10
                            , Run Memory ["-t", "<icon=memory-icon_20.xpm/> mem <usedbar> (<usedratio>%)"] 10
                            , Run DiskU [("/", "<icon=harddisk-icon_20.xpm/> hdd <usedbar> (<used>)")] [] 3600
                            , Run Battery [ "--template" , "<icon=battery.xpm/> batt <acstatus>"
                                          , "--Low"      , "10"        -- units: %
                                          , "--High"     , "80"        -- units: %
                                          , "--low"      , "red"
                                          , "--normal"   , "orange"
                                          , "--high"     , "green"
                                          , "--" -- battery specific options
                                                    -- discharging status
                                                    , "-o"   , "<left>% (<timeleft>)"
                                                    -- AC "on" status
                                                    , "-O"   , "<fc=#dAA520>Charging</fc>"
                                                    -- charged status
                                                    , "-i"   , "<fc=#006000>Charged</fc>"
                                          ] 50
                    , Run UnsafeStdinReader
                            ]
               , sepChar = "%"
               , alignSep = "}{"
               , template = " <icon=haskell_20.xpm/> <fc=#666666>|</fc> %UnsafeStdinReader% }{ <fc=#FFB86C>%cpu%</fc> <fc=#FF5555>%memory%</fc> <fc=#82AAFF>%disku%</fc> <fc=#c3e88d>%dynnetwork%</fc> <icon=calendar-clock-icon_20.xpm/> <fc=#8BE9FD>%date%</fc> <fc=#dAA520>%battery%</fc> "
               }
      '';
    };
  };
}
