#!/bin/sh

BITRATE=${BITRATE:-500000}

echo "Setting can0 bitrate: ${BITRATE}bps"
/sbin/ip link set can0 down || true
/sbin/ip link set can0 up type can bitrate ${BITRATE} || true

echo "Starting..."
exec $@
