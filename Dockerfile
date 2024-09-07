FROM jellyfin/jellyfin:latest

COPY ./ ./

RUN apt update -y \
    && apt install -y fonts-noto-cjk-extra \
    && mkdir -p /config/fonts \
    && cp -r ./fonts /config/fonts

ENV TZ=Asia/Shanghai

EXPOSE 8096
VOLUME /cache /config /media
ENTRYPOINT dotnet /jellyfin/jellyfin.dll --datadir /config --cachedir /cache