#!/bin/sh

set -e

echo "\n Launching Phoenix web server..."
mix ecto.setup || mix ecto.migrate
mix phx.server
