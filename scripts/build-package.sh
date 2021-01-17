#! /usr/bin/env bash

set -e

PACKAGE=$1

echo "workspace: ${GITHUB_WORKSPACE}"

CONTEXT=${GITHUB_WORKSPACE:=.}

PKGREPO="${CONTEXT}/package"
PKGDEST="${CONTEXT}/build"

echo "repo: ${PKGREPO}"
echo "dest: ${PKGDEST}"

mkdir -p ${PKGREPO}
mkdir -p ${PKGDEST}

# clone pkgfile from aur
git clone https://aur.archlinux.org/${PACKAGE}.git ${PKGREPO}

# if found a hooks, run it
if [[ -f hooks/pre-build/${PACKAGE} ]]; then
    bash "hooks/pre-build/${PACKAGE}"
fi

# setup PKGDEST
sudo sh -c "echo 'PKGDEST=${PKGDEST}' >> /etc/makepkg.conf"

# enter cloned repo and run makepkg
cd ${PKGREPO}
makepkg -c -s --noconfirm

# go back to context
cd ${CONTEXT}
