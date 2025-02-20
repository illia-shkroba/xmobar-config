import           Xmobar

config :: Config
config =
  defaultConfig
    { alignSep = "}{"
    , allDesktops = True
    , bgColor = "#1e1e2e"
    , commands =
        [ Run $
          Cpu ["-L", "3", "-H", "50", "--high", "red", "--normal", "green"] 10
        , Run $
          Com
            "sh"
            ["-c", "wpctl get-volume \"$(wpctl-get-default-sink)\""]
            "volume"
            10
        , Run $ Com "sh" ["-c", "echo \"[$(pfile which)]\""] "profile" 10
        , Run $ Battery ["--template", "Batt: <left>% (<timeleft>)"] 100
        , Run $ Memory ["--template", "Mem: <usedratio>%"] 10
        , Run $ Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
        , Run XMonadLog
        ]
    , fgColor = "#cdd6f4"
    , font = "xft:Noto Sans:pixelsize=13,M+ 1c:pixelsize=13"
    , overrideRedirect = False
    , position = TopW L 100
    , sepChar = "%"
    , template = "%XMonadLog% }{ %profile% | %cpu% | %memory% | %volume% | %battery% | %date% "
    }

main :: IO ()
main = xmobar config
