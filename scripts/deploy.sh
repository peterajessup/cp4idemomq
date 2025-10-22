#!/bin/bash
oc project mq 
set +e
# Remove the runnning queue manager instance (if any)

oc delete QueueManager iwhiqm

# Delete the route object and secret for the QueueManager keystore (if any), and the mqsc configMap
oc delete route mq-iwhiroute
oc delete secret mqkey
oc delete configMap iwhi-mqsc

set -e
# Create the route and the keystore secret and mqsc configMap
oc apply -f mqRoute.yaml
oc create secret tls mqkey --cert=./tls/tls.crt --key=./tls/tls.key

oc create -f mqsc/mqsc.yaml

set -e
oc apply -f mqDeploy.yaml
