Docker-Spigot
====

Overview
Build Spigot Server on Docker.

## Description


## Requirement
- Docker

## Install
`# docker build -t {image_name} --build-arg VERSION={version} ./Dockerfile`
## Usage
`# docker run --name {container} -p 25565:25565 -v {data_path}:/data {image_name}`

`# docker start {container}`

## TODO
- 実行ユーザーを変更する
- EULAをtrueにする
- docker-composeにmariadbとかを追加する
- .envファイルで各種設定をする
- デーモン化
- 終了処理をいい感じにする