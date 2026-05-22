#!/bin/bash
# Export SWIVAL_* env vars to a file readable by all users.
# SSH sessions (hooks) can't read /proc/1/environ, so we persist them here.
set -e

env | grep '^SWIVAL_' > /etc/swival.env 2>/dev/null || true
chmod 644 /etc/swival.env

exec /usr/local/bin/docker-entrypoint-orig.sh "$@"
