#!/bin/sh

sed -i s/__buildkite_token__/$BUILDKITE_TOKEN/g /conf/hooks.json

cat <<EOF >/etc/cron.d/buildkite-metrics-publisher
BUILDKITE_API_ACCESS_TOKEN=$BUILDKITE_API_ACCESS_TOKEN
BUILDKITE_ORG_SLUG=$BUILDKITE_ORG_SLUG
AWS_REGION=$AWS_REGION
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
* * * * * root /conf/publisher
EOF
