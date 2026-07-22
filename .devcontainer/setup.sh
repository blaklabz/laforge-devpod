#!/bin/bash

set -e

echo "Installing Terragrunt..."

curl -sL https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_amd64 \
  -o /usr/local/bin/terragrunt

chmod +x /usr/local/bin/terragrunt


echo "Installing k9s..."

curl -sL https://github.com/derailed/k9s/releases/latest/download/k9s_linux_amd64.tar.gz \
  -o /tmp/k9s.tar.gz

tar -xzf /tmp/k9s.tar.gz -C /tmp

mv /tmp/k9s /usr/local/bin/k9s

chmod +x /usr/local/bin/k9s


echo "Done!"
