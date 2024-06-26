#!/bin/bash
chown -R ${PUID}:${PGID} /opt/alist/
chown -R ${PUID}:${PGID} /root/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} nohup aria2c \
  --enable-rpc \
  --rpc-allow-origin-all \
  --conf-path=/root/.aria2/aria2.conf \
  >/dev/null 2>&1 &

exec su-exec ${PUID}:${PGID} ./alist server --no-prefix
