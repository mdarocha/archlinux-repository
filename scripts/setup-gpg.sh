#! /usr/bin/env bash

echo "${1}" > ./signkey.gpg
gpg --import ./signkey.gpg

rm ./signkey.gpg
