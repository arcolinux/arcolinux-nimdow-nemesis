###########
# Imports
# #########
import os
# Core function for nStatus
import core/[segment, delay, reconnect, colours]
# Module Functions for nStatus
import modules/[mAlsa, mArchupdates, mBatstatus, mBluetooth, mDatetime, mKeyboard, mMemory, mWeather, mWifi]

# Define a new bar type to hold the segments and result string
type
  Bar = ref object
    segments: seq[Segment]
    text: string

# Send the formated strings tot he status bar
proc setStatus(status: string) =
  discard execShellCmd("xsetroot -name " & "\"" & status & "\"")

# Update the Segments/Modules
proc update(s: Bar, isUpdateAll: bool = false) =
  s.text = ""
  for segment in s.segments:
    segment.update(isUpdateAll)
    s.text &= segment.text
  setStatus(s.text)

# Create a new status bar with selected segments
proc initBar(segments: seq[Segment]): Bar =
  result = Bar.new
  result.segments = segments

let
  # create an internet connection checker
  connectChecker = initConnectChecker()

  ###################
  # Status Bar setup
  ###################
  ## Parameters:
  ## - style: Predefined segment style (default: Angle_B)
  ## - icon: Icon to display before the text (default: "")
  ## - color: Hex color code or use themes (default: "#282828")
  ## - body: Callback function that returns segment content
  ## - interval: Update interval (default: 500ms)
  ## - isShowAlways: Show segment even when empty (default: false)

  sArchUpdates = initSegment(icon = "", body = getArchUpdates, interval = initDuration(seconds = 30))
  sWeather = initSegment(icon = " ", color = Nord.nord10, body = getWeather, interval = initDuration(minutes = 10))
  sMemory = initSegment(icon = " ", color = Nord.nord11, body = getMemory, interval = initDuration(seconds = 1))
  sAlsa = initSegment(color = Nord.nord12, body = getAlsa)
  #sPulse = initSegment(color = "##D4625E", body = getPulse)
  sBluetooth = initSegment(icon = "", color = "#D4625E", body = getBluetooth, interval = initDuration(seconds = 5))
  sBatStatus = initSegment(color = "#D4625E", body = getBatStatus, interval = initDuration(seconds = 2))
  sDateTime = initSegment(icon = " ", color = Nord.nord13, body = getDateTime)
  sKeyboard = initSegment(icon = " ", color = Nord.nord14, body = getKeyboard, interval = initDuration(minutes = 10))
  sWifi = initSegment(isShowAlways = true, color = Nord.nord15, body = getWifi, interval = initDuration(seconds = 2))


  #sPulse, sBlueTooth, sBatStatus
  bar = initBar(segments = @[sArchUpdates, sWeather, sMemory, sAlsa, sBlueTooth, sBatStatus, sDateTime, sKeyboard, sWifi])

  ###################
# Status bar loop
# #################
while true:
  bar.update(connectChecker.hasReconnected())
