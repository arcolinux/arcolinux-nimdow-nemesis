import std/[os, osproc, strutils, times]
import ../core/[segment, delay]

let archUpdatesDelay = initDelay(interval = initDuration(minutes = 10))
var archUpdatesText = ""

proc getArchUpdates*(s: Segment): string =

  if fileExists("var/lib/pacman/db.lck"):
    s.color = hexColorToEscapeCode("#fb4934")
    return "UPDATING"
  else:
    s.color = hexColorToEscapeCode("#689d6a")
    if archUpdatesDelay.isUpdate() or archUpdatesText == "N/A":
      let updates = execProcess("checkupdates | wc -l")
      let sUpdates = if "ERROR" in updates:
        "N/A"
      else:
        updates[0 .. ^2]
      if sUpdates == "0":
        archUpdatesText = ""
      elif sUpdates == "N/A":
        archUpdatesText = sUpdates
      else:
        archUpdatesText = "Updates: " & sUpdates
    return archUpdatesText