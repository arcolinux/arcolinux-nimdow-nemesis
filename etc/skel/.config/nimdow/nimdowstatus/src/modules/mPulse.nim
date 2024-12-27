import std/[osproc, strutils]
import ../core/segment

const
  # Volume icon to display
  VOL_ICON = " "
  # Mute icon to display
  MUTE_ICON = "󰖁 "

proc getPulse*(s: Segment): string =
  let volLevel = execProcess("pactl get-sink-volume @DEFAULT_SINK@").split(" / ")[1].strip
  let isMuted = execProcess("pactl get-sink-mute @DEFAULT_SINK@").contains("yes")
  if volLevel == "0%" or isMuted:
    s.icon = MUTE_ICON
    return volLevel
  else:
    s.icon = VOL_ICON
    return volLevel
