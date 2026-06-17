# `docker-azure-cli`

Minimal Alpine-based Azure CLI base image for the `devops-infra` organization.

## Source and Images

- Source: <https://github.com/devops-infra/docker-azure-cli>
- Docker Hub: <https://hub.docker.com/r/devopsinfra/docker-azure-cli>
- GHCR: <https://ghcr.io/devops-infra/docker-azure-cli>

## Current Version

| Image | Current Azure CLI version |
| --- | --- |
| `docker-azure-cli` | `2.87.0` |

Published image tags:

- `2.87.0`
- `2.87`
- `latest`

All published images are multi-architecture:

- `linux/amd64`
- `linux/arm64`

## What Is Included

- `alpine:3.24.x`
- `bash`
- `ca-certificates`
- `jq`
- `python3` (`python`)
- `pip3` (`pip`)
- `azure-cli`

This image intentionally does **not** include:

- AWS CLI
- Google Cloud SDK
- Terraform
- OpenTofu
- Terragrunt

## Local Usage

Build the image for the local host platform:

```bash
task docker:build
```

Push the multi-arch image to Docker Hub and GHCR:

```bash
task docker:push
```

Check for Azure CLI and Alpine package updates:

```bash
task dependency:update
```

Run container-structure-tests against the built image:

```bash
task test:structure
```

## Downstream Usage

Use this image as a base for Azure-enabled Docker images:

```dockerfile
FROM ghcr.io/devops-infra/docker-azure-cli:2.87.0
```

Example interactive usage:

```bash
docker run --rm -it devopsinfra/docker-azure-cli:latest az version
```

## Automation

The repository includes workflows for:

- dependency update pull requests when a new Azure CLI version is published
- manual multi-arch image publishing to Docker Hub and GHCR
- automatic pull request creation for non-default branches
