import osproc
import ../core/[segment]

proc getKeyboard*(s: Segment): string =
  execProcess("setxkbmap -query | awk 'NR==3 {print $2}'")
