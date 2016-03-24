#!/bin/sh

sed -i s/__buildkite_token__/$BUILDKITE_TOKEN/g /conf/hooks.json

cat <<EOF >/etc/cron.d/buildkite-metrics-publisher
QUEUE=$QUEUE
BUILDKITE_API_ACCESS_TOKEN=$BUILDKITE_API_ACCESS_TOKEN
BUILDKITE_ORG_SLUG=$BUILDKITE_ORG_SLUG
AWS_REGION=$AWS_REGION
* * * * * root /conf/publisher
EOF
