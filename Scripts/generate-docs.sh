#!/bin/sh

# Generate static docs
xcodebuild docbuild -scheme K1ngLayout \
    -destination generic/platform=ios \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path K1ngLayout --output-path ./docs"
