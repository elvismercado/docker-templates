#!/bin/sh
# Entrypoint wrapper: templates RUNNER_NETWORK into the config, then runs the original entrypoint.
sed "s/__NETWORK__/${RUNNER_NETWORK:-gitea}/" /config.template.yaml > /tmp/config.yaml
export CONFIG_FILE=/tmp/config.yaml
exec /sbin/tini -- run.sh "$@"
