#!/bin/sh
set -e

echo "Activating feature 'lunarvim'"

curl -sL "https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh" | bash -s -- --no-install-dependencies -y 1>/dev/null;