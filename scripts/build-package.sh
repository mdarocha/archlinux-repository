#! /usr/bin/env bash

set -e

PACKAGE=$1

CONTEXT=${GITHUB_WORKSPACE:=.}

PKGREPO="${CONTEXT}/package"
PKGDEST="${CONTEXT}/build"


git clone https://aur.archlinux.org/${PACKAGE}.git ${PKGREPO}

cd ${PKGREPO}
makepkg -c -s --noconfirm

cd ${CONTEXT}
