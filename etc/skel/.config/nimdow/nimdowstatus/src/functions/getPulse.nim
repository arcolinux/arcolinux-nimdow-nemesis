
proc getPulse(): string = 
  let sPulseVol = execProcess("pactl get-sink-volume @DEFAULT_SINK@").split(" / ")[1].strip
  if sPulseVol == "0%":
    return MUTE_ICON & " " & sPulseVol
  else:
    return VOL_ICON & " " & sPulseVol
