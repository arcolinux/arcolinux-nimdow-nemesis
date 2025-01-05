import std/[osproc, strutils]
import ../core/segment

proc getBluetooth*(s: Segment): string =
  result = ""
  let isOn = execCmd("bluetoothctl -- show | grep \"Powered: yes\"") == 0
  s.isShowAlways = isOn
  result = execProcess("bluetoothctl -- devices Connected | cut -c 26-")[0 .. ^2].splitLines().join(", ")
