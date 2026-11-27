# History: onscreen

Append-only: add entries at the end, never edit or remove one (the planning-files build gate enforces it, once the build pipeline has it: tacplus-dev/looper#18). One line each:
`- <YYYY-MM-DD> <who: looper|agent|jody> <kind: issue|decision|release|deploy> <one line> (<links>)`

- 2026-11-13 looper issue CI: the planning-files check is missing (HISTORY.md append-only not enforced) (#3, 85d7f5d)
- 2026-11-20 looper issue Pin this repository's build image (tacplus.lock or build.lock), so its gates run as build jobs and the VM runners can go (#4)
- 2026-11-23 looper issue Pinned images behind their lines: relock (build.lock: ghcr.io/tacplus-dev/tacplus/build:2.6.13 → ghcr.io/tacplus-dev/tacplus/build:2.6.14) (#5)
- 2026-11-27 looper issue checks/build-lock.test.sh: accept build.lock at a tacplus line's dated build tag (build:<YYYYMMDD>-<commit>@digest), so the nightly re-pin lands (looper#226) (#6)
- 2026-11-27 looper issue Pinned images behind their lines: relock (build.lock: ghcr.io/tacplus-dev/tacplus/build:2.6.14 → ghcr.io/tacplus-dev/tacplus/build:20261123-57a6521) (#7)
