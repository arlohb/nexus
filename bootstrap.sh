#!/bin/sh

flux bootstrap github \
    --owner=arlohb \
    --repository=nexus \
    --branch=dev \
    --path=./flux \
    --personal

