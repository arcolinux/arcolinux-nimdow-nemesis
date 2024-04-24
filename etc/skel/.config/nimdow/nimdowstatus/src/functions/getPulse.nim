
proc getPulse(): string = 
  let volLevel = execProcess("pactl get-sink-volume @DEFAULT_SINK@").split(" / ")[1].strip
  let isMuted = execProcess("pactl get-sink-mute @DEFAULT_SINK@").contains("yes")
  let icon = if volLevel == "0%" or isMuted:
    MUTE_ICON
  else:
    VOL_ICON
  icon & " " & volLevel
