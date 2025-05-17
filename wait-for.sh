#!/bin/sh

set -e

host="$1"
port="${2:-5432}"
shift 2
cmd="$@"

echo "Waiting for $host:$port to be available..."

while ! nc -z "$host" "$port"; do
  sleep 1
done

echo "$host:$port is available. Starting app..."
exec $cmd
