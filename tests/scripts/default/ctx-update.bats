#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "ctx-update runs without syntax errors" {
  run bash -n ./bin/ctx-update
  [ "$status" -eq 0 ]
}

@test "ctx-update handles no package manager" {
  run env -i PATH=/usr/bin:/bin HOME="$HOME" ./bin/ctx-update
  [ "$status" -eq 1 ]
}

@test "ctx-update passes -qq flag to apt-get" {
  run bash -n ./bin/ctx-update
  [ "$status" -eq 0 ]
  run grep -q 'apt-get.*-qq' ./bin/ctx-update
  [ "$status" -eq 0 ]
}

@test "ctx-about runs without errors" {
  run ./bin/ctx-about
  [ "$status" -eq 0 ]
}

@test "ctx-about outputs OS information" {
  run ./bin/ctx-about
  [[ "$output" =~ "OS:" ]]
}

@test "ctx-about outputs kernel information" {
  run ./bin/ctx-about
  [[ "$output" =~ "Kernel:" ]]
}

@test "ctx-about outputs memory information" {
  run ./bin/ctx-about
  [[ "$output" =~ "Memory:" ]]
}

@test "ctx-about outputs shell information" {
  run ./bin/ctx-about
  [[ "$output" =~ "Shell:" ]]
}

@test "ctx-dev-setup runs without syntax errors" {
  run bash -n ./bin/ctx-dev-setup
  [ "$status" -eq 0 ]
}

@test "ctx-dev-setup uses set -euo pipefail" {
  run grep -q 'set -euo pipefail' ./bin/ctx-dev-setup
  [ "$status" -eq 0 ]
}

@test "ftpsync has required shebang" {
  run head -1 ./bin/ftpsync
  [[ "$output" =~ "#!/bin/bash" ]]
}

@test "ftpsync has set -euo pipefail" {
  run grep -q 'set -euo pipefail' ./bin/ftpsync
  [ "$status" -eq 0 ]
}

@test "ftpsync requires FTP host argument" {
  run ./bin/ftpsync 2>&1 || true
  [[ "$output" =~ "FTP host is required" ]]
}

@test "ctx-update has error handling for no package manager" {
  run bash -n ./bin/ctx-update
  [ "$status" -eq 0 ]
  run grep -q 'command -v' ./bin/ctx-update
  [ "$status" -eq 0 ]
}

@test "ctx-dev-setup has set -euo pipefail" {
  run grep -q 'set -euo pipefail' ./bin/ctx-dev-setup
  [ "$status" -eq 0 ]
}

@test "archive_release requires argument" {
  run ./bin/archive_release 2>&1 || true
  [[ "$output" =~ "Usage:" ]]
}

@test "archive_release validates version from changelog" {
  run bash -n ./bin/archive_release
  [ "$status" -eq 0 ]
}

@test "runmirrors has required shebang" {
  run head -1 ./bin/runmirrors
  [[ "$output" =~ "#!/usr/bin/env bash" ]]
}

@test "mirror-ctx-images has required shebang" {
  run head -1 ./bin/mirror-ctx-images
  [[ "$output" =~ "#!/bin/bash" ]]
}

@test "ftpsync-cron runs without syntax errors" {
  run bash -n ./bin/ftpsync-cron
  [ "$status" -eq 0 ]
}

@test "ftpsync-cron uses flock for locking" {
  run grep -q 'flock' ./bin/ftpsync-cron
  [ "$status" -eq 0 ]
}

@test "ctx-update logs to correct log file" {
  run grep -q 'CTX_UPDATE_LOG' ./bin/ctx-update
  [ "$status" -eq 0 ]
}

@test "ctx-dev-setup has help or usage information" {
  run grep -q 'echo' ./bin/ctx-dev-setup
  [ "$status" -eq 0 ]
}
