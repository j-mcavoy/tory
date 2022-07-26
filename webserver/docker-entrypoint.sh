#!/bin/sh

set -e

echo "\n Launching Phoenix web server..."
export MIX_ENV=prod
mix ecto.setup || mix ecto.migrate || 0
mix phx.server
