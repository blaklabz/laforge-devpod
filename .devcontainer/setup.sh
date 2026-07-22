#!/bin/bash

set -e

echo "Starting LaForge Dev tool installation..."

ARCH=$(uname -m)

case "$ARCH" in
    x86_64)
        PLATFORM="amd64"
        ;;
    aarch64|arm64)
        PLATFORM="arm64"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

echo "Detected architecture: $ARCH ($PLATFORM)"

#
# Terragrunt
#
echo "Installing Terragrunt..."

curl -L \
  "https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_${PLATFORM}" \
  -o /tmp/terragrunt

sudo mv /tmp/terragrunt /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt

echo "Terragrunt installed:"
terragrunt --version


#
# k9s
#
echo "Installing k9s..."

curl -L \
  "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_${PLATFORM}.tar.gz" \
  -o /tmp/k9s.tar.gz

mkdir -p /tmp/k9s

tar -xzf /tmp/k9s.tar.gz -C /tmp/k9s

sudo mv /tmp/k9s/k9s /usr/local/bin/k9s
sudo chmod +x /usr/local/bin/k9s

echo "k9s installed:"
k9s version --short


echo "LaForge Dev tools installation complete!"
