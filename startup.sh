#!/bin/sh

sed -i s/__buildkite_token__/$BUILDKITE_TOKEN/g /conf/hooks.json
