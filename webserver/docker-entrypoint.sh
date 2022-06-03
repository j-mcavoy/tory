#!/bin/sh

set -e

echo "\n Launching Phoenix web server..."
mix ecto.setup
mix phx.server
