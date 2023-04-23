import           Xmobar

config :: Config
config =
  defaultConfig
    { alignSep = "}{"
    , allDesktops = True
    , bgColor = "#5f5f5f"
    , commands =
        [ Run $
          Weather
            "EGPF"
            [ "--template"
            , "<weather> <tempC>C"
            , "-L"
            , "0"
            , "-H"
            , "25"
            , "--low"
            , "lightblue"
            , "--normal"
            , "#f8f8f2"
            , "--high"
            , "red"
            ]
            36000
        , Run $
          Cpu ["-L", "3", "-H", "50", "--high", "red", "--normal", "green"] 10
        , Run $ Memory ["--template", "Mem: <usedratio>%"] 10
        , Run $ Date "%a %Y-%m-%d <fc=#8be9fd>%H:%M</fc>" "date" 10
        , Run XMonadLog
        ]
    , fgColor = "#f8f8f2"
    , font = "xft:Noto Sans:pixelsize=13,M+ 1c:pixelsize=13"
    , overrideRedirect = False
    , position = TopW L 100
    , sepChar = "%"
    , template = "%XMonadLog% }{ %cpu% | %memory% * %swap% | %EGPF% | %date% "
    }

main :: IO ()
main = xmobar config
