#!/bin/sh

set -e

echo "\n Launching Phoenix web server..."
mix ecto.setup || mix ecto.migrate || 0
mix phx.server
