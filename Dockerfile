FROM base/archlinux:latest
MAINTAINER jo3qma

## Open Port
EXPOSE 25565

## Set Build ARGS
ARG VERSION=latest

RUN echo Build Spigot Version: $VERSION && \
  set -x && \
  mkdir -p /opt/spigot /data
WORKDIR /opt/spigot
#COPY . .
RUN \
  ## Update Repos
  pacman -Syy && \
  ## Install JDK8 and git , wget , screen
  pacman -S jdk8-openjdk git wget screen --noconfirm && \
  ## Download BuildTools.jar
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
  java -jar BuildTools.jar  -rev $VERSION && \
  ## Remove Build garbage
  rm -rf ./BuildData/ ./Bukkit/ ./CraftBukkit/ ./Spigot/ ./apache-maven-*/ ./work/ && \
  rm BuildTools.jar BuildTools.log.txt  craftbukkit*.jar && \
  ## Rename spigot-version.jar to spigot.jar
  mv spigot-*.jar spigot.jar && \
  ## Delete pacman Cache
  pacman -Scc --noconfirm && \
  ## Make Minecraft User
  useradd -s /bin/bash spigot -d /opt/spigot && \
  chown spigot:spigot /opt/spigot -R && \
  chown spigot:spigot /data -R
USER spigot
WORKDIR /data

CMD java -jar /opt/spigot/spigot.jar nogui
