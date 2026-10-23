#!/bin/bash
oc project mq 
set +e
# Remove the runnning queue manager instance (if any)

oc delete QueueManager mq3

# Delete the route object and secret for the QueueManager keystore (if any), and the mqsc configMap
oc delete route mq3route
oc delete secret mq3key
oc delete configMap mq3-mqsc

set -e
# Create the route and the keystore secret and mqsc configMap
oc apply -f mq3Route.yaml
oc create secret tls mq3key --cert=./tls/tls.crt --key=./tls/tls.key

oc create -f mqsc/mqsc.yaml

set -e
oc apply -f mqDeploy.yaml
