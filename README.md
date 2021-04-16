# must-gather-sosreport

## About

Must gather image for the collection of sosreports which builds on top of the must-gather image: [https://github.com/openshift/must-gather](https://github.com/openshift/must-gather)

Sosreports are generated in a rolling fashion with a concurrency of a single sosreport generation per node at a time.

## Usage

### Gathering sosreports for all nodes in the cluster

The following will generate and download sosreports for all nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport -- /usr/bin/gather
~~~

### Gathering sosreports for all master nodes

The following will generate and download sosreports for all master nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport -- /usr/bin/gather_masters
~~~

### Gathering sosreports for all worker nodes

The following will generate and download sosreports for all worker nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport -- /usr/bin/gather_workers
~~~

### Gathering sosreports for a subset of nodes

It is possible to gather sosreports by label:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport -- /usr/bin/gather -l kubernetes.io/hostname=openshift-worker-0
~~~
