```
version: "3.9"
services:

  emby:
    image: lovechen/embyserver:latest
    container_name: emby
    ports:
      - 8096:8096
      - 8920:8920
      - 1900:1900/udp
      - 7359:7359/udp
    environment:
      - PUID=1000
      - PGID=1000
      - GIDLIST=0
      - TZ=Asia/Shanghai
    volumes:
      - /emby:/config
      - /media-database:/media
    restart: unless-stopped
```
