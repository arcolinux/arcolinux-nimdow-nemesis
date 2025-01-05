import httpclient
import ../core/[segment]

proc getWeather*(s: Segment): string =
  var hClient = newHttpClient(timeout = 1000)
  # TODO: Move city location to toml file
  result = hClient.getContent("http://wttr.in/Perth?format=%t")
  hClient.close()
