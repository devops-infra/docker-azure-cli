# Azure CLI Docker Image
**Minimal Alpine-based Azure CLI base image for the `devops-infra` organization**

## Available on
- **Docker Hub:** [devopsinfra/docker-azure-cli:latest](https://hub.docker.com/repository/docker/devopsinfra/docker-azure-cli)
- **GitHub Packages:** [ghcr.io/devops-infra/docker-azure-cli:latest](https://github.com/devops-infra/docker-azure-cli/pkgs/container/docker-azure-cli)
- **Source:** [devops-infra/docker-azure-cli](https://github.com/devops-infra/docker-azure-cli)

## Badges
[
![GitHub repo](https://img.shields.io/badge/GitHub-devops--infra%2Fdocker--azure--cli-2496ED?style=plastic&logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/devops-infra/docker-azure-cli?color=2496ED&label=Last%20commit&logo=github&style=plastic)
![Pull Request](https://github.com/devops-infra/docker-azure-cli/actions/workflows/auto-pull-request-create.yml/badge.svg)
](https://github.com/devops-infra/docker-azure-cli "shields.io")
<br>
[
![DockerHub](https://img.shields.io/badge/DockerHub-devopsinfra%2Fdocker--azure--cli-0db7ed.svg?style=plastic&logo=docker)
![Docker version](https://img.shields.io/docker/v/devopsinfra/docker-azure-cli/latest?color=0db7ed&label=Version&logo=docker&style=plastic)
![Image size](https://img.shields.io/docker/image-size/devopsinfra/docker-azure-cli/latest?label=Image%20size&style=plastic&logo=docker)
![Docker Pulls](https://img.shields.io/docker/pulls/devopsinfra/docker-azure-cli?color=0db7ed&label=Pulls&logo=docker&style=plastic)
](https://hub.docker.com/r/devopsinfra/docker-azure-cli "shields.io")

## Current image tags
- Exact Azure CLI tag: `2.87.0`
- Minor Azure CLI tag: `2.87`
- Floating tag: `latest`

All published images are multi-architecture:
- `linux/amd64`
- `linux/arm64`

## What is included
- `bash`
- `ca-certificates`
- `jq`
- `python3` with `python`
- `pip3` with `pip`
- `azure-cli`

This image intentionally does not include:
- AWS CLI
- Google Cloud SDK
- Terraform
- OpenTofu
- Terragrunt

## Validation
Container Structure Tests for this repository are run with [`devops-infra/action-container-structure-test@v1`](https://github.com/devops-infra/action-container-structure-test), and the local `task test:structure` helper uses the same published runtime image.

## Local usage
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

Run Container Structure Tests against the built image:

```bash
task test:structure
```

## Downstream usage
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
