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
