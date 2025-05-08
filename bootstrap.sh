#!/bin/sh

./label.sh

flux bootstrap github \
    --owner=arlohb \
    --repository=nexus \
    --branch=dev \
    --path=./flux \
    --personal

