#!/bin/sh

./label.sh

flux bootstrap github \
    --owner=arlohb \
    --repository=nexus \
    --branch=dev \
    --path=./flux \
    --personal

if [ ! -f age.agekey ]; then
    echo "Private key not present, cannot setup secrets"
    exit 1
fi

cat age.agekey | \
    kubectl create secret generic sops-age \
        --namespace=flux-system \
        --from-file=age.agekey=/dev/stdin

