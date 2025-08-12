#!/bin/bash
# Fix DevPod permissions on your Mac
sudo chown -R $(whoami):staff ~/.devpod
find ~/.devpod -type d -exec chmod 755 {} \;
find ~/.devpod -type f -exec chmod 644 {} \;
find ~/.devpod -name "*provider*" -type f -path "*/binaries/*" -exec chmod +x {} \;
find ~/.devpod -name "devpod*" -type f -exec chmod +x {} \;

# Also check if DevPod CLI itself needs fixing
which devpod
ls -la $(which devpod)

# If needed, fix DevPod CLI permissions
sudo chmod +x $(which devpod)
