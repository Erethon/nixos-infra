#!/usr/bin/env bash

set -euo pipefail

readonly VERSION
VERSION="$(cat /run/current-system/nixos-version)"
readonly CURRENT_SYSTEM_DRV
CURRENT_SYSTEM_DRV="$(readlink /run/current-system)"
readonly CURRENT_SYSTEM_PROFILE
CURRENT_SYSTEM_PROFILE="$(find /nix/var/nix/profiles -ilname "${CURRENT_SYSTEM_DRV}")"
readonly DEPLOY_TIMESTAMP
DEPLOY_TIMESTAMP="$(stat -c '%y' "${CURRENT_SYSTEM_PROFILE}" | cut -c '-16')"
readonly DEPLOY_SECONDS
DEPLOY_SECONDS="$(stat -c '%Y' "${CURRENT_SYSTEM_PROFILE}")"

echo "node_deployed{version=\"${VERSION}\",date=\"${DEPLOY_TIMESTAMP}\"} ${DEPLOY_SECONDS}"
