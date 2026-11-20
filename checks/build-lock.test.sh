#!/usr/bin/env bash
# Copyright (c) 2026 Jody Scott
# SPDX-License-Identifier: Apache-2.0
#
# build.lock, the pin the build pipeline builds this repository in (#4; looper#71): one `build_image:` line, the
# tacplus build image by digest, as looper-build's plan reads it (a tag alone, or no pin, is a fail verdict there).
# Run: checks/build-lock.test.sh
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCK="$ROOT/build.lock"

fail() { echo "FAIL build.lock: $*" >&2; exit 1; }
[[ -f "$LOCK" ]] || fail "missing: the build pipeline builds only a pinned repository"
lines="$(grep -v -e '^#' -e '^[[:space:]]*$' "$LOCK")" || fail "no build_image line"
[[ "$(wc -l <<<"$lines")" -eq 1 ]] || fail "more than the build_image line: $lines"
[[ "$lines" =~ ^build_image:\ ghcr\.io/tacplus-dev/tacplus/build:[0-9]+\.[0-9]+\.[0-9]+@sha256:[0-9a-f]{64}$ ]] ||
  fail "not the tacplus build image of a release, by digest: $lines"
echo "build.lock: ok (${lines#build_image: })"
