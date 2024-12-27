#!/bin/bash
pkill -f "NimdowStatus"
pkill -f "nStatus"
xsetroot -name ""
nim c -d:release --deepcopy:on -d:lto -d:ssl -o:bin/nStatus src/nStatus.nim
./bin/nStatus &
