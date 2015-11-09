#!/bin/bash
currentTime=`echo $(($(date +%s%N)/1000000))`
vsql -q -d testDB -f $1
finalTime=`echo $(($(date +%s%N)/1000000))`
let queryTime=$finalTime-$currentTime
echo $queryTime "ms"
