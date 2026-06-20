#!/bin/sh

# arch
kubectl label node datasphere arch=arm64 --overwrite
kubectl label node neptune arch=arm64 --overwrite
kubectl label node pluto arch=arm64 --overwrite
kubectl label node arlo-laptop1 arch=amd64 --overwrite

# transcode
kubectl label node datasphere transcode=false --overwrite
kubectl label node neptune transcode=false --overwrite
kubectl label node pluto transcode=false --overwrite
kubectl label node arlo-laptop1 transcode=true --overwrite

# network
kubectl label node datasphere network=fast --overwrite
kubectl label node neptune network=fast --overwrite
kubectl label node pluto network=fast --overwrite
kubectl label node arlo-laptop1 network=slow --overwrite

# zigbee
kubectl label node datasphere zigbee=false --overwrite
kubectl label node neptune zigbee=false --overwrite
kubectl label node pluto zigbee=true --overwrite
kubectl label node arlo-laptop1 zigbee=false --overwrite

# db
kubectl label node datasphere db=true --overwrite
kubectl label node neptune db=false --overwrite
kubectl label node pluto db=false --overwrite
kubectl label node arlo-laptop1 db=false --overwrite

# gpu
kubectl label node datasphere gpu=false --overwrite
kubectl label node neptune gpu=false --overwrite
kubectl label node pluto gpu=false --overwrite
kubectl label node arlo-laptop1 gpu=false --overwrite
kubectl label node bazzite gpu=true --overwrite

# datasphere taint
kubectl taint nodes datasphere db=true:NoSchedule
kubectl taint nodes bazzite gpu=true:NoSchedule

