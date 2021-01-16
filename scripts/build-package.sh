#! /usr/bin/env bash

set -e

PACKAGE=$1

CONTEXT=${GITHUB_WORKSPACE:=.}

PKGREPO="${CONTEXT}/package"
PKGDEST="${CONTEXT}/build"

mkdir -p ${PKGREPO}
mkdir -p ${PKGDEST}

# clone pkgfile from aur
git clone https://aur.archlinux.org/${PACKAGE}.git ${PKGREPO}

# setup PKGDEST
sudo sh -c "echo 'PKGDEST=${PKGDEST}' >> /etc/makepkg.conf"

# enter cloned repo and run makepkg
cd ${PKGREPO}
makepkg -c -s --noconfirm

# go back to context
cd ${CONTEXT}
