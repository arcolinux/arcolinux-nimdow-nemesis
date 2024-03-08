const
  MEMINFO_PATH: string = "/proc/meminfo"
  MEMINFO_LINES: int = 26
  GIB_DIVISOR: float = 1024.0 * 1024.0

proc getMemInfo(key: string): int =
  for line in readFile(MEMINFO_PATH).splitLines():
    let parts = line.split(":")
    if parts.len == 2 and parts[0].strip() == key:
      return parts[1].strip().split()[0].parseInt()
  return 0

proc getMemory(): string =
  if not fileExists(MEMINFO_PATH):
    return "Memory info not available"

  let
    iTotalMem = getMemInfo("MemTotal")
    iAvailableMem = getMemInfo("MemAvailable")

    iUsedMem = iTotalMem - iAvailableMem

  if iUsedMem >= 1048576:
    result = fmt"{MEMORY_ICON} {iUsedMem.float / GIB_DIVISOR:0.2f} GiB"
  else:
    result = fmt"{MEMORY_ICON} {toInt(iUsedMem / 1024)} MiB"

