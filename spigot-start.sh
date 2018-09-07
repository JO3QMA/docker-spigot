#! /bin/bash

#
SERVER_ROOT="/data"
MAIN_EXECUTABLE="spigot.jar"
SESSION_NAME="spigot"

## prams45
MAX_MEM="4G"
MIN_MEM="1024M"
THREADS="4"


#
echo "Starting Spigot Server..."
java \
  -Xmx${MAX_MEM} \
  -Xms${MIN_MEM} \
  -XX:ParallelGCThreads=${THREADS} \
  - jar /opt/spigot/spigot.jar nogui