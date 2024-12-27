import std/[times, sugar, strformat, strutils]
import delay

type
  Sides = tuple
    left: string
    right: string

  Segment* = ref object
    sides: Sides
    color*: string
    body: (Segment) -> string
    text*: string
    delay: Delay
    icon*: string
    isShowAlways*: bool

# TODO: escape chars to hex color code
const
  RESET: string  = "\x1b[0m"
  FG: string = "\x1b[38;2;"
  BG: string = "\x1b[48;2;"
  
  REGION: string = "\x1F"

  ARROW* = (left: "", right: "").Sides
  ARROW_L* = (left: "", right: "").Sides
  ARROW_R* = (left: "", right: "").Sides

  CIRCLE* = (left: "", right: "").Sides
  CIRCLE_L* = (left: "", right: "").Sides
  CIRCLE_R* = (left: "", right: "").Sides

  ANGLE_A* = (left: "", right: "").Sides
  ANGLE_B* = (left: "", right: "").Sides

proc hexColorToEscapeCode*(strHex: string): string =
  let hex: uint = fromHex[uint](strHex[1..<7])
  return fmt"{hex.int shr 16 and 0xff};{hex.int shr 8 and 0xff};{hex.int and 0xff}m"


proc update*(s: Segment, isForce: bool = false) =
  if s.delay.isUpdate() or isForce:
    var body: string
    try:
      body = s.body(s)
    except CatchableError as e:
      echo "Error: ", e.repr
      body = "N/A"
    if body == "" and not s.isShowAlways:
      s.text = body
    else:
      s.text = if s.sides.right == "":
        FG&s.color & s.sides.left & RESET & BG&s.color & s.icon & body & REGION
      else:
        RESET & FG&s.color & s.sides.left & RESET & BG&s.color & s.icon & body & REGION & RESET & FG&s.color & s.sides.right & RESET

proc initSegment*(isShowAlways: bool = false, icon: string = "", sides: Sides = ANGLE_B, color: string = "#282828", body: (Segment) -> string, interval: Duration = initDuration(milliseconds = 500)): Segment =
  result = Segment.new
  result.icon = icon
  result.sides = sides
  result.color = hexColorToEscapeCode(color)
  result.body = body
  result.isShowAlways = isShowAlways
  result.delay = initDelay(interval = interval)
