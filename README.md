# Developer Tooling & Workspace Setup for the Quarkus Super Heroes Project

## Create Container Images for Workspaces

1. Login to your OpenShift Cluster as a non-admin user with self-provisioner rights

1. Clone this repo and create the container images for developer workspaces

   ```bash
   git clone https://github.com/lab-monkeys/quarkus-super-heroes-dev-ex-edition.git
   cd quarkus-super-heroes-dev-ex-edition
   chmod +x ./dev-tool-images/setup-dev-images.sh
   ./dev-tool-images/setup-dev-images.sh
   ```

1. Wait for the image builds and imports to complete.

## Create Developer Workspace

1. Login to OpenShift Dev Spaces on your cluster

1. Create a new workspace from `https://github.com/lab-monkeys/quarkus-super-heroes-dev-ex-edition.git`
