## Dracula themed arrows
const
  RESET: string  = "\x1b[0m"
  FG: string = "\x1b[38;2;"
  BG: string = "\x1b[48;2;"


  BACKGROUND: string  = "80;250;123m" #282a36
  CURRENTLINE: string = "80;250;123m" #44475a
  FOREGROUND: string  = "80;250;123m" #f8f8f2
  COMMENT: string     = "80;250;123m" #6272a4

  CYAN: string     = "139;233;253m" #8be9fd
  GREEN: string    = "80;250;123m"  #50fa7b
  ORANGE: string   = "255;184;108m" #ffb86c
  PINK:  string    = "255;121;198m" #ff79c6
  PURPLE: string   = "189;147;249m" #bd93f9
  RED: string      = "255;85;85m"   #ff5555
  YELLOW: string   = "241;250;140m" #f1fa8c


  ARROW_CYAN: string   = RESET & FG&CYAN & "" & RESET & BG&CYAN      #8be9fd
  ARROW_GREEN: string  = RESET & FG&GREEN & "" & RESET & BG&GREEN    #50fa7b
  ARROW_ORANGE: string = RESET & FG&ORANGE & "" & RESET & BG&ORANGE  #ffb86c
  ARROW_PINK: string   = RESET & FG&PINK & "" & RESET & BG&PINK      #ff79c6
  ARROW_PURPLE: string = RESET & FG&PURPLE & "" & RESET & BG&PURPLE  #bd93f9
  ARROW_RED: string    = RESET & FG&RED & "" & RESET & BG&RED        #ff5555
  ARROW_YELLOW: string = RESET & FG&YELLOW & "" & RESET & BG&YELLOW  #f1fa8c

  CIRCLE_CYAN: string   = RESET & FG&CYAN & "" & RESET & BG&CYAN      #8be9fd
  CIRCLE_GREEN: string  = RESET & FG&GREEN & "" & RESET & BG&GREEN    #50fa7b
  CIRCLE_ORANGE: string = RESET & FG&ORANGE & "" & RESET & BG&ORANGE  #ffb86c
  CIRCLE_PINK: string   = RESET & FG&PINK & "" & RESET & BG&PINK      #ff79c6
  CIRCLE_PURPLE: string = RESET & FG&PURPLE & "" & RESET & BG&PURPLE  #bd93f9
  CIRCLE_RED: string    = RESET & FG&RED & "" & RESET & BG&RED        #ff5555
  CIRCLE_YELLOW: string = RESET & FG&YELLOW & "" & RESET & BG&YELLOW  #f1fa8c


#[ Nimdow config.toml

  # Window settings Dracula type theme
  borderWidth = 1
  borderColorUnfocused = "#6272a4"
  borderColorFocused = "#ff79c6"
  borderColorUrgent = "#ff5555"
  # Bar settings
  barHeight = 28
  windowTitlePosition = "center"
  barBackgroundColor = "#282a36"
  barForegroundColor = "#44475a"
  barSelectionColor = "#f1fa8c"
  barUrgentColor = "#ff5555"
  barFonts = [
    "DejaVu Sans:style=Bold:size=12:antialias=true",
    "FontAwesome:size=14:antialias=true",
    "JetBrainsMono Nerd Font:size=20:antialias=true",
  ]


]#




