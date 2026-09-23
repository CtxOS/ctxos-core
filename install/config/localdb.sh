#!/usr/bin/env bash

# Configure local database access
# Allow local connections without password for PostgreSQL
if command -v psql &>/dev/null; then
  sudo mkdir -p /etc/postgresql
  sudo sed -i 's/^listen_addresses.*/listen_addresses = "localhost"/' /etc/postgresql/*/main/postgresql.conf 2>/dev/null || true
fi
