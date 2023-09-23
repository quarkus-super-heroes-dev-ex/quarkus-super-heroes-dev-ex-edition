oc new-project quarkus-super-heroes-dev-images  
oc policy add-role-to-group system:image-puller system:serviceaccounts -n quarkus-super-heroes-dev-images
oc apply -f ./dev-container-build.yaml

oc import-image kafka:0.34.0-kafka-3.4.0 --from=quay.io/strimzi/kafka:0.34.0-kafka-3.4.0 --confirm -n quarkus-super-heroes-dev-images
oc import-image mongodb:5.0 --from=docker.io/bitnami/mongodb:5.0 --confirm -n quarkus-super-heroes-dev-images
oc import-image postgresql-15-c9s:c9s --from=quay.io/sclorg/postgresql-15-c9s:c9s --confirm -n quarkus-super-heroes-dev-images
oc import-image jaegertracing-all-in-one:1 --from=docker.io/jaegertracing/all-in-one:1 --confirm -n quarkus-super-heroes-dev-images
oc import-image opentelemetry-collector:0.75.0 --from=docker.io/otel/opentelemetry-collector:0.75.0 --confirm -n quarkus-super-heroes-dev-images
oc import-image prometheus:v2.43.0 --from=quay.io/prometheus/prometheus:v2.43.0 --confirm -n quarkus-super-heroes-dev-images
oc import-image apicurio-registry-mem:2.4.2.Final --from=quay.io/apicurio/apicurio-registry-mem:2.4.2.Final --confirm -n quarkus-super-heroes-dev-images

oc start-build dev-tools-image -n quarkus-super-heroes-dev-images -w -F    
oc start-build dev-workspace-image-base -n quarkus-super-heroes-dev-images -w -F
oc start-build dev-workspace-image-vfs -n quarkus-super-heroes-dev-images -w -F
oc start-build dev-workspace-image-fuse -n quarkus-super-heroes-dev-images -w -F
oc start-build dev-workspace-image-nested -n quarkus-super-heroes-dev-images -w -F
