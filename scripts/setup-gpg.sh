#! /usr/bin/env bash

echo "${GPG_SIGN_KEY}" > ./signkey.gpg
gpg --import ./signkey.gpg
gpg --default-key pkg-builder@mdarocha.pl --sign-key pkg-builder@mdarocha.pl

rm ./signkey.gpg
