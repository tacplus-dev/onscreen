#!/usr/bin/env bash
# Copyright (c) 2026 Jody Scott
# SPDX-License-Identifier: Apache-2.0
#
# build-lock.test.sh, the pin's check, against fixture locks (BUILD_LOCK): it passes on a release's patch tag and on
# a tacplus line's dated build tag (#6; looper#226, tacplus#966), each by digest, and fails on a floating line tag,
# latest, a tag with no digest, a short digest and a malformed dated tag.
# Run: checks/build-lock-cases.test.sh
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
IMAGE=ghcr.io/tacplus-dev/tacplus/build
DIGEST=sha256:3ce0f7c5ef5564f12386b9c82665534b03239005daa08ee0c566fdf60ba79196

fail() { echo "FAIL $NAME: $*" >&2; exit 1; }
check() { # name, the build_image line
  NAME="$1"; printf '# a comment\n\nbuild_image: %s\n' "$2" > "$TMP/build.lock"
  OUT="$(BUILD_LOCK="$TMP/build.lock" "$ROOT/checks/build-lock.test.sh" 2>&1)"
}
passes() { check "$@" || fail "expected a pass: $OUT"; echo "ok $NAME"; }
fails() { if check "$@"; then fail "expected a failure: $OUT"; fi; echo "ok $NAME"; }

passes patch "$IMAGE:2.6.14@$DIGEST"
passes dated "$IMAGE:20261123-abc1234@$DIGEST"
passes dated-full-commit "$IMAGE:20261123-3ce0f7c5ef5564f12386b9c82665534b03239005@$DIGEST"
fails line-tag "$IMAGE:2.6@$DIGEST"
fails latest "$IMAGE:latest@$DIGEST"
fails patch-no-digest "$IMAGE:2.6.14"
fails dated-no-digest "$IMAGE:20261123-abc1234"
fails short-digest "$IMAGE:20261123-abc1234@sha256:3ce0f7c5"
fails six-hex-commit "$IMAGE:20261123-abc123@$DIGEST"
fails nine-digit-date "$IMAGE:202611230-abc1234@$DIGEST"
fails uppercase-commit "$IMAGE:20261123-ABC1234@$DIGEST"
fails other-image "ghcr.io/tacplus-dev/other/build:20261123-abc1234@$DIGEST"
