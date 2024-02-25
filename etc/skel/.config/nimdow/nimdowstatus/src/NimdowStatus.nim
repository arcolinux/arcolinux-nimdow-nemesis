import std/[os, osproc, times, strutils, httpclient, options, strformat]
# import parsetoml  <--- WiP to move all the below settings to a toml file

#++++++++++++++++++++++++++++++++++++++++++#
#                SETTINGS                  #
#++++++++++++++++++++++++++++++++++++++++++#
const
  ## main refresh intervals in seconds
  UPDATE_INTERVAL = 10
  ## update weather in minutes
  UPDATE_WEATHER = 10
  ## update checkupdate(arch) intervals in minutes
  UPDATE_UPDATES = 20
  ## select city for weather, uses wttr.in
  CITY = "Perth" #
  ## date formatting
  DATE_FORMAT = "ddd d MMM "
  ## time formatting
  TIME_FORMAT = "HH:mm "
  ## date and time formatting
  DATETIME_FORMAT = "ddd d MMM HH:mm "
  ## Regions for clickable statusbar
  REGION: string = "\x1F" # Do not edit, use Nimdows config.toml to set actions

#++++++++++++++++++++++++++++++++++++++++++#
#                ICONS                     #
#++++++++++++++++++++++++++++++++++++++++++#  
  ## weather icon, be sure to include font in the nimdow config.toml
  WEATHER_ICON = "  "
  ## date icon to display
  DATE_ICON = "  "
  ## time icon to display
  TIME_ICON = "  "
  ## memory icon to display
  MEMORY_ICON = "  "
  ## Volume icon to display
  VOL_ICON = " 󰕾 "
  ## Mute icon to display
  MUTE_ICON = " 󰖁 "
  ## Keyboard Icon to display
  KB_ICON = "  "
  ## Update Icon to display
  UPDATE_ICON = "   Updates: "
  ## Battery Icons to display (array)
  BATTERY_ICON = @["  ", "  ", "  ", "  ", "  ", "  "]
  
#++++++++++++++++++++++++++++++++++++++++++#
#                  THEME                   #
#++++++++++++++++++++++++++++++++++++++++++#
# include themed arrows/circles/angle in gruvbox, dracula, nord and catpuccin
#include themes/gruvbox
#include themes/dracula
#include themes/nord
include themes/catpuccin


#++++++++++++++++++++++++++++++++++++++++++#
#           INCLUDED FUNCTIONS             #
#++++++++++++++++++++++++++++++++++++++++++#
# include getDateTime function {getDateTime()}
include functions/getDateTime
# include getBatStatus function and battery icons {getBatStatus()}
include functions/getBatStatus
# include getMemory function {getMemory()}
include functions/getMemory
# include weather function {getWeather()}
include functions/getWeather
# include Alsa volume levels function {getAlsa()}
include functions/getAlsa
# include keyboard layout function {getKeyboard()}
include functions/getKeyboard
# include updates from arch, function {getArchUpdates()}
include functions/getArchUpdates


# Function to set the string
proc setStatus(sStatus: string) =
  discard execShellCmd("xsetroot -name " & "\"" & sStatus & "\"")
  #Debug/test from the terminal
  #echo sStatus

# Main loop
proc main() =
  while true:
    #+++++++++++++++++++++++++++
    #  CREATE STATUS STRING    #
    #+++++++++++++++++++++++++++

    # ARROWS with Battery
    #let sStatusString = fmt"{PLINE_4}{getArchUpdates()}{REGION}{PLINE_5}{getWeather()}{REGION}{PLINE_6}{getMemory()}{REGION}{PLINE_7}{getBatStatus()}{REGION}{PLINE_8}{getAlsa()}{REGION}{PLINE_9}{getKeyboard()}{REGION}{PLINE_10}{getDateTime()}{RESET}"

    # ARROWS without Battery
    #let sStatusString = fmt"{ARROW_7L}{getMemory()}{ARROW_7R}{REGION}{ARROW_15L}{getAlsa()}{ARROW_15R}{REGION}{ARROW_4L}{getKeyboard()}{ARROW_4R}{REGION}{ARROW_12L}{getDateTime()}{ARROW_12R}{RESET}"
    

    # Powerlines
    #let sStatusString = fmt"{PLINE_7}{getMemory()}{REGION}{PLINE_15}{getAlsa()}{REGION}{PLINE_4}{getKeyboard()}{REGION}{PLINE_12}{getDateTime()}{RESET}"
    
    # CIRCLES with Battery
    #let sStatusString = fmt"{CIRCLE_11}{getArchUpdates()}{REGION}{CIRCLE_13}{getWeather()}{REGION}{CIRCLE_7}{getMemory()}{REGION}{CIRCLE_15}{getBatStatus()}{REGION}{CIRCLE_11}{getAlsa()}{REGION}{CIRCLE_4}{getKeyboard()}{REGION}{CIRCLE_12}{getDateTime()}{RESET}"

    # CIRCLES without Battery
    #let sStatusString = fmt"{CIRCLE_11L}{getArchUpdates()}{CIRCLE_11R}{REGION} {CIRCLE_13L}{getWeather()}{CIRCLE_13R}{REGION} {CIRCLE_7L}{getMemory()}{CIRCLE_7R}{REGION} {CIRCLE_15L}{getBatStatus()}{CIRCLE_15R}{REGION} {CIRCLE_14L}{getAlsa()}{CIRCLE_14R}{REGION} {CIRCLE_4L}{getKeyboard()}{CIRCLE_4R}{REGION} {CIRCLE_12L}{getDateTime()}{CIRCLE_12R}{RESET}"

    # ANGLES with Battery
    let sStatusString = fmt"{ANGLE_11L}{getArchUpdates()}{ANGLE_11R}{REGION}{ANGLE_13L}{getWeather()}{ANGLE_13R}{REGION}{ANGLE_7L}{getMemory()}{ANGLE_7R}{REGION}{ANGLE_14L}{getAlsa()}{ANGLE_14R}{REGION}{ANGLE_4L}{getKeyboard()}{ANGLE_4R}{REGION}{ANGLE_12L}{getDateTime()}{ANGLE_12R}{RESET}"

    # ANGLES without Battery
    #let sStatusString = fmt"{ANGLE_4}{getArchUpdates()}{REGION}{ANGLE_5}{getWeather()}{REGION}{ANGLE_6}{getMemory()}{REGION}{ANGLE_8}{getAlsa()}{REGION}{ANGLE_9}{getKeyboard()}{REGION}{ANGLE_10}{getDateTime()}{RESET}"

    # set the status
    setStatus(sStatusString)
    # sleep for n seconds
    sleep(UPDATE_INTERVAL * 1000)


when isMainModule:
  main()
