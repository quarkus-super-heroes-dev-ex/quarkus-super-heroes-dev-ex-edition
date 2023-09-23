FROM registry.access.redhat.com/ubi9/ubi-minimal as tools-builder

COPY get-tools.sh /get-tools.sh

RUN microdnf --disableplugin=subscription-manager install -y bash tar gzip zip xz unzip ; \
  chmod +x /get-tools.sh ; \
  /get-tools.sh

FROM scratch

COPY --from=tools-builder  /tools/ /tools
