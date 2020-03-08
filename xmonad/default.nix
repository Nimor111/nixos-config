{pkgs, config, ...}:

{
  home-manager.users.gbojinov = {
    xsession = {
      enable = true;

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;

        config = pkgs.writeText "xmonad.hs" ''
          import System.IO (hPutStrLn)

          import XMonad (xmonad, terminal, borderWidth, mod4Mask, modMask, normalBorderColor, focusedBorderColor, logHook, layoutHook, manageHook, manageHook, (<+>), startupHook, spawn)

          import XMonad.Config.Desktop (desktopConfig)

          import XMonad.Util.SpawnOnce (spawnOnce)
          import XMonad.Util.Run (spawnPipe)
          import XMonad.Util.EZConfig (additionalKeysP)

          import XMonad.Hooks.DynamicLog (dynamicLogWithPP, xmobarPP, xmobarColor, shorten, PP(..))
          import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks)


          myTerminal = "termite"
          myModMask = mod4Mask
          myBorderWidth = 2
          myNormalBorderColor = "#292d3e"
          myFocusedBorderColor = "#ffb86c"

          main :: IO ()
          main = do
              xmobarProc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/.xmobarrc"

              xmonad $ desktopConfig
                  { logHook = dynamicLogWithPP xmobarPP
                                  { ppOutput = hPutStrLn xmobarProc
                                  , ppTitle = xmobarColor "#ffa500" "" . shorten 20
                                  }
                  , modMask = myModMask
                  , terminal = myTerminal
                  , startupHook = myStartupHook
                  , borderWidth = myBorderWidth
                  , normalBorderColor  = myNormalBorderColor
                  , focusedBorderColor = myFocusedBorderColor
                  , layoutHook = myLayout
                  , manageHook = myManageHook
                  } `additionalKeysP` myKeys

          myStartupHook = do
                  spawnOnce "feh --bg-scale $HOME/wallpaper.png &"

          -- this is to make enough room for xmobar on the screen
          myLayout = avoidStruts $ layoutHook desktopConfig
          myManageHook = manageHook desktopConfig <+> manageDocks

          myKeys =
                  [ ("M-<Return>", spawn myTerminal)
                  , ("M-d", spawn "dmenu_run -p 'dmenu:'")
                  ]
        '';
      };
    };
  };
}
