FROM alpine:3.24.1

ENV PIP_BREAK_SYSTEM_PACKAGES=1

ARG AZ_VERSION=2.87.0

COPY alpine-packages.txt /tmp/alpine-packages.txt

SHELL ["/bin/ash", "-euxo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN xargs -r apk add --no-cache < /tmp/alpine-packages.txt; \
  ln -sf /usr/bin/python3 /usr/bin/python; \
  ln -sf /usr/bin/pip3 /usr/bin/pip; \
  pip3 install --no-cache-dir "azure-cli==${AZ_VERSION}"; \
  test "$(az version --output json | jq -r '."azure-cli"')" = "${AZ_VERSION}"; \
  rm -rf /var/cache/*; \
  rm -rf /root/.cache/*; \
  rm -rf /tmp/*
