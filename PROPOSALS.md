# Proposals: onscreen

Written by loopers. Each proposal: what, why, links. Jody promotes accepted ones into ROADMAP.md (via an agent);
the looper then marks it `promoted` or `declined` here with the date.

## Open
- **<title>** (<date>, <issue/run link>): <what and why>
- **The planning files check from the build image, not a copy** (2026-11-20, #4): `checks/planning-files-check` and
  its test are copies of tacplus-dev/looper's (at 3f47c48), because the tacplus build image that `build.lock` pins
  does not carry it; a fix to looper's check does not reach this one. If the build image (tacplus-dev/tacplus
  images/build.Dockerfile) or the build pipeline's gates job carried `planning-files-check`, every pinned
  repository's gates could run the same one, and these copies go.

## Promoted / declined
- **The pin check accepts a dated build tag** (2026-11-23, #6; promoted 2026-11-26, ROADMAP.md): `checks/build-lock.test.sh`
  accepts only `build:X.Y.Z@sha256:…`; it would also take a tacplus line's dated build, `build:<yyyymmdd>-<sha7>@sha256:…`
  (tacplus#966), and still refuse a floating `build:X.Y`, a tag with no digest, and `latest`, with a fixture test of the
  check. The nightly relock (looper#226; roadmap `decisions/security-gates-ship-only-2026-11-23.md`: pin dated or patch
  tags only) moves `build.lock` to that tag, and while this check refuses it, every relock land here is red.
