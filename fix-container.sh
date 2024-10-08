# bash <(curl -s https://github.com/JerryBian/jellyfin-cn/raw/refs/heads/master/fix-container.sh)

apt update -y \
    && apt install -y fonts-noto-cjk-extra \
    && mkdir -p /config/fonts

curl --output /config/fonts/simhei.ttf "https://github.com/JerryBian/jellyfin-cn/raw/refs/heads/master/fonts/simhei.ttf"