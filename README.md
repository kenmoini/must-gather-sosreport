# must-gather-sosreport

## About

Must gather image for the collection of sosreports which builds on top of the must-gather infrastructure: [https://github.com/openshift/must-gather](https://github.com/openshift/must-gather)

Sosreports are generated in a rolling fashion with a concurrency of a single sosreport generation per node at a time.

## Usage

### Gathering sosreports for all nodes in the cluster

The following will generate and download sosreports for all nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport:latest --timeout=60m -- /bin/bash /usr/bin/gather-sosreports
~~~

### Gathering sosreports for all master nodes

The following will generate and download sosreports for all master nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport:latest --timeout=60m -- /bin/bash /usr/bin/gather-sosreports -l node-role.kubernetes.io/master=
~~~

### Gathering sosreports for all worker nodes

The following will generate and download sosreports for all worker nodes of the cluster:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport:latest --timeout=60m  -- /bin/bash /usr/bin/gather-sosreports -l node-role.kubernetes.io/worker=
~~~

### Gathering sosreports for a subset of nodes

It is possible to gather sosreports by label:
~~~
oc adm must-gather --image=quay.io/akaris/must-gather-sosreport:latest --timeout=60m -- /bin/bash /usr/bin/gather-sosreports -l kubernetes.io/hostname=openshift-worker-0
~~~

### Changing the support-tools image

Either provide a registry and image as parameters to the `gather-sosreports` script:
~~~
oc adm must-gather --timeout=60m  --image=quay.io/akaris/must-gather-sosreport:latest -- /bin/bash -x /usr/bin/gather-sosreports -l kubernetes.io/hostname=openshift-worker-0 -r registry.example.com:5000 -i support-tools:0.0.2
~~~

Or create file `/root/.toolboxrc` and specify a replacement registry and image. This step must be repeated on every node in the cluster:
~~~
REGISTRY=registry.example.com:5000
IMAGE=support-tools:0.0.2
~~~
