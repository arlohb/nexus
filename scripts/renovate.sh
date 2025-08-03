#!/bin/sh

kubectl create job --from=cronjob/renovate renovate-tmp -n default

