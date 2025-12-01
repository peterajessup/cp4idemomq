# cp4idemomq

This repository is to be used for creating an MQ Queue Manager on OCP, with IBM's Cloudpak for Integration Installed (verison 16.1 or higher).

The artifacts include an MQ QueueManager Object Custom resource definition, and
a route object associated with the channel created for access to the queue manager from outside the cluster.

In addition, a tls key and cert is provided for the queue manager's keystore, and a secret is created 
using these artifacts for the queue manger keystore. These files can also be used to create a keystore for the MQ client to connect, for simplicity.
Alternatively you can fork this repository and use your own certs and keys.

A route is created for connectivity from outside of the cluster for using channel-based SNI. Host based SNI uses the operator-creaed route.

