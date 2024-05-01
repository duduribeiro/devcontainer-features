#!/bin/sh
set -e

echo "Activating feature 'neovim'"

VERSION=${VERSION:-stable}
echo "The version to be installed is: $VERSION"

# Debian / Ubuntu dependencies
install_debian_dependencies() {
  apt-get update -y
  apt-get -y install ninja-build gettext cmake unzip curl build-essential

  apt-get -y clean
  rm -rf /var/lib/apt/lists/*
}

# ******************
# ** Main section **
# ******************


if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

ADJUSTED_VERSION=$VERSION

if [  "$VERSION" != "stable" ] && [  "$VERSION" != "nightly" ]; then
    ADJUSTED_VERSION="v$VERSION"
fi

# Bring in ID, ID_LIKE, VERSION_ID, VERSION_CODENAME
. /etc/os-release
# Get an adjusted ID independent of distro variants
if [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]; then
    ADJUSTED_ID="debian"
# other distros to be implemented
# elif [[ "${ID}" = "rhel" || "${ID}" = "fedora" || "${ID}" = "mariner" || "${ID_LIKE}" = *"rhel"* || "${ID_LIKE}" = *"fedora"* || "${ID_LIKE}" = *"mariner"* ]]; then
  # todo
# elif [ "${ID}" = "alpine" ]; then
  # todo
else
    echo "Linux distro ${ID} not supported."
    exit 1
fi

# Install packages for appropriate OS
case "${ADJUSTED_ID}" in
    "debian")
        install_debian_dependencies
        ;;
esac

echo "Downloading source for ${ADJUSTED_VERSION}..."

curl -sL https://github.com/neovim/neovim/archive/refs/tags/${ADJUSTED_VERSION}.tar.gz | tar -xzC /tmp 2>&1

echo "Building..."

cd /tmp/neovim-${ADJUSTED_VERSION}

make && make CMAKE_INSTALL_PREFIX=/usr/local/nvim install
ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim

rm -rf /tmp/neovim-${ADJUSTED_VERSION}
