#!/bin/bash
mkdir packages
helm package --destination packages mysql-backup
cr upload \
    --owner obukhov \
    --git-repo helm-mysql-backup \
    --package-path packages \
    --token $GITHUB_TOKEN

cr index \
    --owner obukhov \
    --git-repo helm-mysql-backup \
    --package-path packages \
    --charts-repo https://obukhov.github.io/helm-mysql-backup/ \
    --index-path .