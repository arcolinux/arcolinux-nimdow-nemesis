import times
import ../core/segment

# TODO: Move to toml file
const
  ## date formatting
  DATE_FORMAT = "ddd d MMM "
  ## time formatting
  TIME_FORMAT = "HH:mm "
  ## date and time formatting
  DATETIME_FORMAT = "ddd d MMM HH:mm "

# TODO: work out a way for the user to select what function to be used in toml file
# get the date and time
proc getDateTime*(s: Segment): string =
  result = format(now(), DATETIME_FORMAT)

proc getDate*(): string =
  result = format(now(), DATE_FORMAT)

proc getTime*(): string =
  result =  format(now(), TIME_FORMAT)
