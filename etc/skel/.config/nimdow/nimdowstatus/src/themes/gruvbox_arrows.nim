## Gruvbox themed arrows
const
  RESET: string  = "\x1b[0m"
  FG: string = "\x1b[38;2;"
  BG: string = "\x1b[48;2;"

  GREEN: string  = "104;157;106m"
  BLUE:  string  = "69;133;136m"
  ORANGE: string = "249;188;47m"
  RED: string    = "231;104;97m"
  WHITE: string  = "235;219;178m"
  BROWN: string  = "49;51;66m"




#                
  ARROW_GREEN: string  = RESET & FG&GREEN & "" & RESET & BG&GREEN
  ARROW_BLUE: string   = RESET & FG&BLUE & "" & RESET & BG&BLUE
  ARROW_ORANGE: string = RESET & FG&ORANGE & "" & RESET & BG&ORANGE
  ARROW_RED: string    = RESET & FG&RED & "" & RESET & BG&RED
  ARROW_WHITE: string  = RESET & FG&WHITE & "" & RESET & BG&WHITE
  ARROW_BROWN: string  = RESET & FG&BROWN & "" & RESET & BG&BROWN

  CIRCLE_GREEN_L: string  = RESET & FG&GREEN & "" & RESET & BG&GREEN
  CIRCLE_GREEN_R: string  = RESET & FG&GREEN & "" & RESET
  CIRCLE_BLUE_L: string   = RESET & FG&BLUE & "" & RESET & BG&BLUE
  CIRCLE_BLUE_R: string   = RESET & FG&BLUE & "" & RESET
  CIRCLE_ORANGE_L: string = RESET & FG&ORANGE & "" & RESET & BG&ORANGE
  CIRCLE_ORANGE_R: string = RESET & FG&ORANGE & "" & RESET
  CIRCLE_RED_L: string    = RESET & FG&RED & "" & RESET & BG&RED
  CIRCLE_RED_R: string    = RESET & FG&RED & "" & RESET
  CIRCLE_WHITE_L: string  = RESET & FG&WHITE & "" & RESET & BG&WHITE
  CIRCLE_WHITE_R: string  = RESET & FG&WHITE & "" & RESET
  CIRCLE_BROWN_L: string  = RESET & FG&BROWN & "" & RESET & BG&BROWN
  CIRCLE_BROWN_R: string  = RESET & FG&BROWN & "" & RESET


#[ Nimdow config.toml

  # Window settings  Gruvbox type theme
  borderWidth = 1
  borderColorUnfocused = "#282a36"
  borderColorFocused = "#8ec07c"
  borderColorUrgent = "#cc241d"
  # Bar settings
  barHeight = 28
  windowTitlePosition = "center"
  barBackgroundColor = "#918273" #"#282a36"
  barForegroundColor = "#313338" #"#f8f8f2"
  barSelectionColor = "ebdbb2"#"#f9bc2f" #"#50fa7b"
  barUrgentColor = "#cc241d"
  barFonts = [
    "DejaVu Sans:style=Bold:size=12:antialias=true"
    "FontAwesome:size=14:antialias=true"
    "JetBrainsMono Nerd Font:size=20:antialias=true",
  ]


]#

