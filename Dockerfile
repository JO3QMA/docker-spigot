FROM base/archlinux:latest
MAINTAINER jo3qma

## ARG
ARG VERSION=latest

RUN echo "Build Spigot Version: ${VERSION}"
  mkdir -p /opt/spigot
WORKDIR /opt/spigot
#COPY . .
RUN \
  pacman -Sy && \
  pacman -S jdk8-openjdk git wget --noconfirm && \
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
  java -jar BuildTools.jar  -rev 1.13.1 && \
  rm -rf ./BuildData/ ./Bukkit/ ./CraftBukkit/ ./Spigot/ ./apache-maven-3.5.0/ ./work/ && \
  rm BuildTools.jar BuildTools.log.txt  craftbukkit*.jar && \
  echo eula=true > eula.txt && \
  mv spigot-*.jar spigot.jar && \
## Make Minecraft User
  useradd -s /bin/bash spigot -d /opt/spigot && \
  chown spigot:spigot /opt/spigot -R

USER spigot

RUN ls -l
## Minecraft Default Port  
EXPOSE 25565
CMD java -jar spigot.jar nogui
