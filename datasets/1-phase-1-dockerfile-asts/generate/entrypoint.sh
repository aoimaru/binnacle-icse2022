#!/bin/bash

mkdir -p /mnt/jessfraz/dockerfiles

echo "Extracting..."
tar -xJf /mnt/inputs/jessfraz.tar.xz -C /mnt/jessfraz/dockerfiles
echo "  + Done!"

ls /mnt/jessfraz/dockerfiles

find /mnt/jessfraz/dockerfiles -type f | \
    python3 /app/app.py jessfraz