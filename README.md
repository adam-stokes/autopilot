Overview
========

This branch contains the necessary config and instructions for using
juju-deployer/juju-quickstart to deploy the landscape charm.

Deployment should be straightforward.

Dense Deployment - MAAS
=======================
For MAAS where LXCs can be addressed externally, you can deploy to a single
machine while at the same time making the service scalable in the future:

  juju quickstart u/landscape/landscape-dense-maas/

Dense Deployment - Other
========================
For other substrates, use the plain dense deployment which allows your
landscape server to be fully reachable, but will not allow easy scaling
should load increase.

  juju quickstart u/landscape/landscape-dense/

Scalable Deployment
===================
For a truly scalable deployment, the following stanza should be used.

  juju quickstart u/landscape/landscape-scalable
