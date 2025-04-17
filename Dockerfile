# FROM registry.svc.ci.openshift.org/openshift/release:golang-1.12 AS builder
# WORKDIR /go/src/github.com/openshift/must-gather
# COPY . .
# 
# FROM quay.io/openshift/origin-must-gather:4.5.0
# COPY --from=builder /go/src/github.com/openshift/must-gather/collection-scripts/* /usr/bin/

FROM quay.io/openshift/origin-must-gather:4.16.0
COPY collection-scripts/* /usr/bin/

# ENTRYPOINT /bin/bash /usr/bin/gather
