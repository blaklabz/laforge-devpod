#!/bin/bash
set -e

ARCH=$(uname -m)

echo "Installing Terragrunt for $ARCH"

if [ "$ARCH" = "aarch64" ]; then
  TG_ARCH="arm64"
elif [ "$ARCH" = "x86_64" ]; then
  TG_ARCH="amd64"
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

curl -L \
  "https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_${TG_ARCH}" \
  -o /usr/local/bin/terragrunt

chmod +x /usr/local/bin/terragrunt

echo "Installing k9s"

curl -L \
  "https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_${TG_ARCH}.tar.gz" \
  -o /tmp/k9s.tar.gz

tar -xzf /tmp/k9s.tar.gz -C /tmp

mv /tmp/k9s /usr/local/bin/k9s

chmod +x /usr/local/bin/k9s

echo "Done"
