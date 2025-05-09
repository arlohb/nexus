#!/bin/sh

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

kubectl label node neptune jellyfin=true --overwrite

