#! /bin/bash

#
SERVER_ROOT="/data"
MAIN_EXECUTABLE="spigot.jar"
SPIGOT_PATH="/opt/spigot/"
SESSION_NAME="spigot"

JAR_PATH=${SPIGOT_PATH}${MAIN_EXECUTABLE}

## prams
MAX_MEM="4G"
MIN_MEM="1024M"
THREADS="4"

# screen
echo "Starting Spigot Server..."
/usr/bin/screen -Dm -S ${SESSION_NAME} /usr/bin/java \
  -Xmx${MAX_MEM} \
  -Xms${MIN_MEM} \
  -XX:ParallelGCThreads=${THREADS} \
  -Dcom.mojang.eula.agree=true \
  -jar ${JAR_PATH} nogui
#tail -f /data/logs/latest.log