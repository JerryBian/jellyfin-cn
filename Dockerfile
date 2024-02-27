FROM jellyfin/jellyfin:latest

COPY ./ ./

RUN apt update -y \
    && apt install -y fonts-noto-cjk-extra \
    && mkdir -p /config/fonts \
    && cp -r ./fonts /config/fonts

EXPOSE 8096
VOLUME ${JELLYFIN_DATA_DIR} ${JELLYFIN_CACHE_DIR}
ENTRYPOINT [ "./jellyfin/jellyfin", \
             "--ffmpeg", "/usr/lib/jellyfin-ffmpeg/ffmpeg" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=10s --retries=3 \
    CMD curl -Lk -fsS "${HEALTHCHECK_URL}" || exit 1