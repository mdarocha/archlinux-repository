#! /usr/bin/env bash

echo "${GPG_SIGN_KEY}" > ./signkey.gpg
gpg --import ./signkey.gpg

rm ./signkey.gpg
