#!/bin/sh

# transcode
kubectl label node datasphere transcode=false
kubectl label node neptune transcode=false
kubectl label node pluto transcode=false
kubectl label node arlo-laptop1 transcode=true

# network
kubectl label node datasphere network=fast
kubectl label node neptune network=fast
kubectl label node pluto network=fast
kubectl label node arlo-laptop1 network=slow

