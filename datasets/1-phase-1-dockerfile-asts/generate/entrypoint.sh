#!/bin/bash

TARGET=$1

mkdir -p /mnt/$TARGET/dockerfiles

echo "Extracting..."
ls /mnt/inputs
tar -xJf /mnt/inputs/$TARGET.tar.xz -C /mnt/$TARGET/dockerfiles
echo "  + Done!"

ls /mnt/$TARGET/dockerfiles

find /mnt/$TARGET/dockerfiles -type f | \
    python3 /app/app.py $TARGET